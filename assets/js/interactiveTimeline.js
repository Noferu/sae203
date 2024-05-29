document.addEventListener("DOMContentLoaded", function () {
  const container = document.getElementById("timeline-container"); // Sélectionne le conteneur de la timeline par son ID
  const epochs = document.querySelectorAll(".epoch"); // Sélectionne tous les éléments d'époque
  const epochLink = document.getElementById("epoch-link"); // Sélectionne le bouton epoch-link
  const boingSound = document.getElementById("boingSound"); // Sélectionne le son boingSound

  // Définit l'image de fond pour chaque élément d'époque
  epochs.forEach((epoch) => {
    const imageUrl = epoch.getAttribute("data-image");
    if (imageUrl) {
      epoch.style.backgroundImage = `url(${imageUrl})`;
    }
  });

  enableDragScroll(container); // Active le défilement par glissement pour le conteneur
  updateCurrentEpoch(epochs, container); // Met à jour l'époque actuelle au chargement
  container.addEventListener("scroll", () => updateCurrentEpoch(epochs, container)); // Met à jour l'époque actuelle lors du défilement

  centerEpochOnLoad(epochs, container, "Moyen-Âge"); // Centre l'époque spécifiée au chargement

  // Ajoute l'événement pour jouer le son au survol avec un délai
  let boingTimeout;

  epochLink.addEventListener("mouseover", () => {
    boingTimeout = setTimeout(() => {
      boingSound.play();
    }, 270);
  });

  epochLink.addEventListener("mouseleave", () => {
    clearTimeout(boingTimeout); // Annule le timeout si la souris quitte avant la fin du délai
    boingSound.pause();
    boingSound.currentTime = 0; // Remet la position de lecture à zéro
  });
});

function centerEpochOnLoad(epochs, container, epochName) {
  const targetEpoch = Array.from(epochs).find((epoch) =>
    epoch.dataset.name.includes(epochName)
  ); // Trouve l'époque cible par son nom
  if (targetEpoch) {
    const leftOffset = targetEpoch.offsetLeft;
    const centerOffset =
      leftOffset - container.offsetWidth / 2 + targetEpoch.offsetWidth / 2;
    container.scrollLeft = centerOffset; // Centre l'époque cible dans le conteneur
  }
}

function enableDragScroll(element) {
  let isDown = false;
  let startX;
  let scrollLeft;

  element.addEventListener("mousedown", (e) => {
    isDown = true;
    startX = e.clientX; // Enregistre la position X de départ
    scrollLeft = element.scrollLeft; // Enregistre la position de défilement de départ
    element.style.cursor = "grabbing";
    e.preventDefault(); // Empêche le comportement par défaut
  });

  document.addEventListener("mouseup", () => {
    if (!isDown) return;
    isDown = false;
    element.style.cursor = "grab";
  });

  document.addEventListener("mousemove", (e) => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.clientX;
    const walk = x - startX; // Calcule la distance de déplacement
    element.scrollLeft = scrollLeft - walk; // Met à jour la position de défilement
  });
}

function updateCurrentEpoch(epochs, container) {
  const centerPoint = container.offsetWidth / 2 + container.scrollLeft; // Calcule le point central du conteneur
  let closestEpoch = null;
  let minDistance = Infinity;

  epochs.forEach((epoch) => {
    const epochCenter = epoch.offsetLeft + epoch.offsetWidth / 2;
    const distance = Math.abs(epochCenter - centerPoint);

    if (distance < minDistance) {
      minDistance = distance;
      closestEpoch = epoch; // Met à jour l'époque la plus proche du centre
    }
  });

  if (closestEpoch) {
    epochs.forEach((epoch) => {
      epoch.classList.remove("center", "adjacent"); // Retire les classes actuelles
    });

    closestEpoch.classList.add("center"); // Ajoute la classe 'center' à l'époque la plus proche

    const closestEpochIndex = Array.from(epochs).indexOf(closestEpoch);
    if (closestEpochIndex > 0) {
      epochs[closestEpochIndex - 1].classList.add("adjacent"); // Ajoute la classe 'adjacent' à l'époque précédente
    }
    if (closestEpochIndex < epochs.length - 1) {
      epochs[closestEpochIndex + 1].classList.add("adjacent"); // Ajoute la classe 'adjacent' à l'époque suivante
    }

    updateLinkAndTheme(closestEpoch); // Met à jour le lien et le thème
  }
}

function updateLinkAndTheme(epoch) {
  const link = document.getElementById("epoch-link");
  const categoryId = epoch.dataset.id;

  if (categoryId) {
    link.href = `pages/product?action=grid&category_id=${categoryId}`; // Met à jour le lien avec l'ID de catégorie
  }

  const body = document.body;
  const newClass = `theme-${epoch.dataset.name.toLowerCase().replace(/\s+/g, "-")}`;
  if (!body.classList.contains(newClass)) {
    body.className = ""; // Réinitialise les classes du body
    body.classList.add(newClass); // Ajoute la nouvelle classe au body
    fadeOutAudio(epoch.dataset.music); // Lance le fondu audio avec l'URL de la musique
    var clickSound = document.getElementById("clickSound");
    clickSound.play(); // Joue le son de clic
  }
}

function fadeOutAudio(newMusicUrl) {
  const audio = document.getElementById('myAudio');
  const fadeOutInterval = setInterval(() => {
    if (audio.volume > 0.1) {
      audio.volume -= 0.1; // Réduit progressivement le volume
    } else {
      clearInterval(fadeOutInterval);
      audio.volume = 0;
      updateAudioSource(newMusicUrl); // Met à jour la source audio une fois le fondu terminé
    }
  }, 100); // Intervalle de 100ms pour chaque réduction de volume
}

function updateAudioSource(newMusicUrl) {
  const audio = document.getElementById('myAudio');
  const audioSource = document.getElementById('audioSource');

  if (newMusicUrl) {
    audioSource.src = newMusicUrl; // Met à jour la source audio avec le nouveau lien
    audio.load(); // Recharge l'audio
    audio.volume = 1;
    audio.play(); // Joue la nouvelle piste audio
  }
}