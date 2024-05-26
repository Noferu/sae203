(function($) {
    "use strict";
    $(".card").tilt({
        maxTilt: 20,
        perspective: 1400,
        easing: "cubic-bezier(.03,.98,.52,.99)",
        speed: 1200,
        glare: true,
        maxGlare: 0.3,
        scale: 1.07,
    });
}(jQuery));

$(document).ready(function() {
    const cards = document.querySelectorAll(".card-link");
    cards.forEach((card, index) => {
      card.style.animationDelay = `${index * 0.2}s`;
    });
  });