document.addEventListener("DOMContentLoaded", function () {
  const container = document.getElementById("timeline-container");
  const epochs = document.querySelectorAll(".epoch");
  const epochLink = document.getElementById("epoch-link");
  const boingSound = document.getElementById("boingSound");

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
    clearTimeout(boingTimeout);
    boingSound.pause();
    boingSound.currentTime = 0;
  });
});

function centerEpochOnLoad(epochs, container, epochName) {
  const targetEpoch = Array.from(epochs).find((epoch) =>
    epoch.dataset.name.includes(epochName)
  );
  if (targetEpoch) {
    const leftOffset = targetEpoch.offsetLeft;
    const centerOffset =
      leftOffset - container.offsetWidth / 2 + targetEpoch.offsetWidth / 2;
    container.scrollLeft = centerOffset;
  }
}

function enableDragScroll(element) {
  let isDown = false;
  let isDragging = false;
  let startX, startY;
  let scrollLeft;
  let clickTimeout;

  element.addEventListener("mousedown", (e) => {
    isDown = true;
    startX = e.clientX;
    startY = e.clientY;
    scrollLeft = element.scrollLeft;
    element.style.cursor = "grabbing";
    e.preventDefault();

    // Vérification du clic après un délai
    clickTimeout = setTimeout(() => {
      if (!isDragging) {
        // Vérifier si le clic est maintenu sans déplacement significatif
        element.addEventListener("mouseup", onClick);
      }
    }, 150); // Délai pour différencier clic court et long
  });

  document.addEventListener("mouseup", (e) => {
    if (!isDown) return;
    isDown = false;
    element.style.cursor = "grab";

    // Si la distance est inférieure à 4px, considérer comme un clic
    if (!isDragging && Math.abs(e.clientX - startX) < 4 && Math.abs(e.clientY - startY) < 4) {
      // Exécuter l'action de clic
      const targetEpoch = document.elementFromPoint(e.clientX, e.clientY);
      if (targetEpoch && targetEpoch.classList.contains("epoch")) {
        centerEpochOnClick(targetEpoch, element);
      }
    }

    isDragging = false;
    clearTimeout(clickTimeout);
  });

  document.addEventListener("mousemove", (e) => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.clientX;
    const y = e.clientY;

    // Si la distance dépasse 4 pixels, considérer comme un glissement
    if (Math.abs(x - startX) > 4 || Math.abs(y - startY) > 4) {
      isDragging = true;
      element.removeEventListener("mouseup", onClick); // Supprimer l'écouteur de clic
    }

    const walk = x - startX;
    element.scrollLeft = scrollLeft - walk;
  });

  function onClick(e) {
    // Si c'est un clic, centrer l'époque
    const targetEpoch = document.elementFromPoint(e.clientX, e.clientY);
    if (targetEpoch && targetEpoch.classList.contains("epoch")) {
      centerEpochOnClick(targetEpoch, element);
    }
    element.removeEventListener("mouseup", onClick);
  }
}

function centerEpochOnClick(epoch, container) {
  const leftOffset = epoch.offsetLeft;
  const centerOffset =
    leftOffset - container.offsetWidth / 2 + epoch.offsetWidth / 2;
  container.scrollTo({
    left: centerOffset,
    behavior: 'smooth'
  });

  updateCurrentEpoch(Array.from(document.querySelectorAll(".epoch")), container);
}

function updateCurrentEpoch(epochs, container) {
  const centerPoint = container.offsetWidth / 2 + container.scrollLeft;
  let closestEpoch = null;
  let minDistance = Infinity;

  epochs.forEach((epoch) => {
    const epochCenter = epoch.offsetLeft + epoch.offsetWidth / 2;
    const distance = Math.abs(epochCenter - centerPoint);

    if (distance < minDistance) {
      minDistance = distance;
      closestEpoch = epoch;
    }
  });

  if (closestEpoch) {
    epochs.forEach((epoch) => {
      epoch.classList.remove("center", "adjacent");
    });

    closestEpoch.classList.add("center");

    const closestEpochIndex = Array.from(epochs).indexOf(closestEpoch);
    if (closestEpochIndex > 0) {
      epochs[closestEpochIndex - 1].classList.add("adjacent");
    }
    if (closestEpochIndex < epochs.length - 1) {
      epochs[closestEpochIndex + 1].classList.add("adjacent");
    }

    updateLinkAndTheme(closestEpoch);
  }
}

function updateLinkAndTheme(epoch) {
  const link = document.getElementById("epoch-link");
  const categoryId = epoch.dataset.id;

  if (categoryId) {
    link.href = `pages/product?action=grid&category_id=${categoryId}`;
  }

  const body = document.body;
  const newClass = `theme-${epoch.dataset.name.toLowerCase().replace(/\s+/g, "-")}`;
  if (!body.classList.contains(newClass)) {
    body.className = "";
    body.classList.add(newClass);
    fadeOutAudio(epoch.dataset.music);
    var clickSound = document.getElementById("clickSound");
    clickSound.play();
  }
}

function fadeOutAudio(newMusicUrl) {
  const audio = document.getElementById('myAudio');
  const fadeOutInterval = setInterval(() => {
    if (audio.volume > 0.1) {
      audio.volume -= 0.1;
    } else {
      clearInterval(fadeOutInterval);
      audio.volume = 0;
      updateAudioSource(newMusicUrl);
    }
  }, 100);
}

function updateAudioSource(newMusicUrl) {
  const audio = document.getElementById('myAudio');
  const audioSource = document.getElementById('audioSource');

  if (newMusicUrl) {
    audioSource.src = newMusicUrl;
    audio.load();
    audio.volume = 1;
    audio.play();
  }
}
