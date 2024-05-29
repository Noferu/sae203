document.addEventListener("DOMContentLoaded", function () {
  var x = document.getElementById("toast-message"); // Sélectionne l'élément du message toast par son ID
  const titles = document.querySelectorAll("h1, .title-animation"); // Sélectionne tous les titres <h1> et les éléments avec la classe "title-animation"

  // Message Toast
  if (x) {
    x.className = "show"; // Ajoute la classe "show" pour afficher le message toast

    setTimeout(function () {
      x.className = x.className.replace("show", ""); // Retire la classe "show" après 3,5 secondes pour masquer le message toast
    }, 3500);
  }

  // Animation des titres
  titles.forEach(title => {
    if (title) {
      const letters = title.innerText.split(/(?!$)/u); // Sépare le texte du titre en conservant les espaces
      title.innerHTML = letters
        .map((letter, index) => {
          const delay = Math.random() * 2; // Délai d'animation aléatoire entre 0 et 2 secondes
          return `<span class="title-letter" style="animation-delay: ${delay}s;">${
            letter === " " ? "&nbsp;" : letter
          }</span>`; // Retourne chaque lettre avec un délai d'animation
        })
        .join(""); // Joint les lettres pour reformer le titre
    }
  });
});
