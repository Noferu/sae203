document.addEventListener("DOMContentLoaded", function () {
  const backButton = document.getElementById("back-link"); // Sélectionne le bouton de retour avec l'ID "back-link"

  if (backButton) { // Vérifie si le bouton de retour existe sur la page
    backButton.addEventListener("click", function (event) {
      event.preventDefault(); // Empêche le comportement par défaut du lien (la navigation vers une nouvelle page)
      
      // Vérifie l'état précédent dans l'historique
      const previousURL = document.referrer;
      const currentURL = window.location.href;

      // Si l'URL précédente est la même que l'URL actuelle, alors ne fait rien
      if (previousURL !== currentURL) {
        window.history.back(); // Fait revenir la page à l'état précédent dans l'historique du navigateur
      } else {
        window.location.href = backButton.getAttribute('href'); // Utilise le lien par défaut du bouton
      }
    });
  }
});
