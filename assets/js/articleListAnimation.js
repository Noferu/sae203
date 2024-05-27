$(document).ready(function () {
  const applyAnimationDelay = () => {
    document.querySelectorAll("#articles .article").forEach((article, index) => {
      article.style.animationDelay = `${index * 0.2}s`;
      const image = article.querySelector('.image');
      if (image) {
        image.style.animationDelay = `${index * 0.2 + 0.1}s`; 
      }
    });
  };
  applyAnimationDelay();
  $(document).on('ajaxComplete', applyAnimationDelay);
});