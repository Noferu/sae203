$(document).ready(function () {
  const applyAnimationDelay = () => {
    // Sélectionne tous les éléments article dans le document
    document.querySelectorAll("article").forEach((article, index) => {
      // Applique un délai d'animation pour chaque article basé sur son index
      article.style.animationDelay = `${index * 0.2}s`;
      const image = article.querySelector(".image"); // Sélectionne l'image à l'intérieur de l'article
      if (image) {
        // Applique un délai d'animation légèrement plus long pour l'image
        image.style.animationDelay = `${index * 0.2 + 0.1}s`;
      }
    });
  };

  applyAnimationDelay(); // Applique le délai d'animation initial

  // Réapplique les délais d'animation après chaque requête AJAX terminée
  $(document).on("ajaxComplete", applyAnimationDelay);
});
