(function($) {
    "use strict";
  
    // Fonction pour initialiser l'effet Tilt sur les éléments avec la classe "card"
    function initializeTilt() {
        $(".card").tilt({
            maxTilt: 20, // Inclinaison maximale
            perspective: 1400, // Perspective utilisée pour l'effet 3D
            easing: "cubic-bezier(.03,.98,.52,.99)", // Courbe de Bézier pour l'animation
            speed: 1200, // Durée de l'animation en ms
            glare: true, // Active l'effet d'éblouissement
            maxGlare: 0.3, // Éblouissement maximal
            scale: 1.07, // Facteur de mise à l'échelle
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
    $(document).ready(function() {
        const cards = document.querySelectorAll(".card-link"); // Sélectionne tous les éléments avec la classe "card-link"
        cards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.2}s`; // Applique un délai d'animation basé sur l'index de la carte
        });
        checkTiltActivation(); // Vérifie si l'effet Tilt doit être activé au chargement
        $(window).resize(checkTiltActivation); // Réapplique la vérification lors du redimensionnement de la fenêtre
    });
  
  }(jQuery));
  