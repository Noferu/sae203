(function ($) {
  "use strict";

  // Fonction pour initialiser l'effet Tilt sur les éléments avec la classe "card"
  function initializeTilt() {
    $(".card").tilt({
      maxTilt: 20,
      perspective: 1400,
      easing: "cubic-bezier(.03,.98,.52,.99)",
      speed: 1200,
      glare: true,
      maxGlare: 0.3,
      scale: 1.07,
    });
  }

  // Fonction pour détruire l'effet Tilt sur les éléments avec la classe "card"
  function destroyTilt() {
    $(".card").tilt.destroy.call($(".card")); // Appelle la méthode destroy de tilt.js
  }

  // Fonction pour vérifier si l'effet Tilt doit être activé ou désactivé en fonction de la largeur de la fenêtre
  function checkTiltActivation() {
    if (window.innerWidth <= 960) {
      destroyTilt(); // Désactive Tilt si la largeur de la fenêtre est inférieure ou égale à 960px
    } else {
      initializeTilt(); // Active Tilt si la largeur de la fenêtre est supérieure à 960px
    }
  }

  // Code exécuté lorsque le document est prêt
  $(document).ready(function () {
    const cards = document.querySelectorAll(".card-link"); // Sélectionne tous les éléments avec la classe "card-link"
    const audioIds = [
      "card-audio-1",
      "card-audio-2",
      "card-audio-3",
      "card-audio-4",
      "card-audio-5",
      "card-audio-6",
      "card-audio-7",
    ]; // Liste des identifiants audio

    cards.forEach((card, index) => {
      card.style.animationDelay = `${index * 0.2}s`; // Applique un délai d'animation basé sur l'index de la carte
      card.addEventListener("animationstart", function () {
        const randomAudioId =
          audioIds[Math.floor(Math.random() * audioIds.length)]; // Sélectionne un ID audio aléatoire
        const audioElement = document.getElementById(randomAudioId);
        if (audioElement) {
          const clonedAudio = audioElement.cloneNode(true); // Clone l'élément audio sélectionné
          clonedAudio.play(); // Joue l'audio cloné
          clonedAudio.onended = function () {
            clonedAudio.remove(); // Supprime l'élément audio cloné après la fin de la lecture
          };
        } else {
          console.error(
            `L'élément audio avec l'ID ${randomAudioId} est introuvable.`
          );
        }
      });
    });
    checkTiltActivation(); // Vérifie si l'effet Tilt doit être activé au chargement
    $(window).resize(checkTiltActivation); // Réapplique la vérification lors du redimensionnement de la fenêtre
  });
})(jQuery);
