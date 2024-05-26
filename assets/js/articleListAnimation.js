$(document).ready(function () {
  const applyAnimationDelay = () => {
    document.querySelectorAll("#articles .article").forEach((article, index) => {
      article.style.animationDelay = `${index * 0.2}s`;
      const image = article.querySelector('.image');
      if (image) {
        image.style.animationDelay = `${index * 0.2 + 0.1}s`; // Décale l'animation de l'image de 0.1s après l'article
      }
    });
  };
  applyAnimationDelay();
  $(document).on('ajaxComplete', applyAnimationDelay);
});