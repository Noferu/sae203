document.addEventListener("DOMContentLoaded", function () {
  const stars = document.querySelectorAll(".star-rating i"); // Sélectionne tous les éléments d'étoile de notation
  const ratingInput = document.getElementById("rating"); // Sélectionne l'input caché pour stocker la valeur de notation
  let rating = 0; // Initialise la notation à 0

  stars.forEach((star) => {
    star.addEventListener("click", function () {
      rating = this.dataset.value; // Récupère la valeur de notation de l'étoile cliquée
      ratingInput.value = rating; // Met à jour la valeur de l'input caché
      highlightStars(rating); // Met à jour l'affichage des étoiles
    });

    star.addEventListener("mouseover", function () {
      colorStars(this.dataset.value); // Colore les étoiles en survol
    });

    star.addEventListener("mouseout", function () {
      colorStars(rating); // Colore les étoiles en fonction de la notation actuelle
    });
  });

  function highlightStars(value) {
    // Met à jour les classes des étoiles pour afficher la notation
    stars.forEach((star, index) => {
      star.classList.toggle("fa-solid", index < value); // Utilise une étoile pleine si l'index est inférieur à la valeur
      star.classList.toggle("fa-regular", index >= value); // Utilise une étoile vide si l'index est supérieur ou égal à la valeur
    });
  }

  function colorStars(value) {
    // Met à jour les couleurs des étoiles
    stars.forEach((star, index) => {
      star.style.color = index < value ? "var(--gold)" : "white"; // Colore en or les étoiles jusqu'à la valeur, sinon en blanc
    });
  }

  document
    .querySelector(".add-comment button")
    .addEventListener("click", function (event) {
      const commentText = document.querySelector(".add-comment textarea").value; // Récupère le texte du commentaire
      if (!commentText || !rating) {
        event.preventDefault(); // Empêche l'envoi du formulaire si le commentaire ou la notation est vide
      }
    });

  const textarea = document.getElementById("comment-textarea"); // Sélectionne la zone de texte pour le commentaire

  textarea.addEventListener("input", function () {
    this.style.height = "auto"; // Réinitialise la hauteur pour recalculer
    this.style.height = this.scrollHeight + 5 + "px"; // Ajuste la hauteur en fonction du contenu
  });

  textarea.style.height = textarea.scrollHeight + 5 + "px"; // Ajuste la hauteur initialement en fonction du contenu
});
