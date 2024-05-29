document.addEventListener("DOMContentLoaded", function () {
  const backButton = document.getElementById("back-link"); // Sélectionne le bouton de retour avec l'ID "back-link"

  if (backButton) { // Vérifie si le bouton de retour existe sur la page
    backButton.addEventListener("click", function (event) {
      event.preventDefault(); // Empêche le comportement par défaut du lien (la navigation vers une nouvelle page)
      window.history.back(); // Fait revenir la page à l'état précédent dans l'historique du navigateur
    });
  }
});
