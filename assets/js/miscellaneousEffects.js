document.addEventListener("DOMContentLoaded", function () {
  var x = document.getElementById("toast-message");
  const titles = document.querySelectorAll("h1, .title-animation");

  // Message Toast
  if (x) {
    x.className = "show";

    setTimeout(function () {
      x.className = x.className.replace("show", "");
    }, 3500);
  }

  // Animation des titres
  titles.forEach(title => {
    if (title) {
      const letters = title.innerText.split(/(?!$)/u); // Split en conservant les espaces
      title.innerHTML = letters
        .map((letter, index) => {
          const delay = Math.random() * 2; // Délai aléatoire entre 0 et 2 secondes
          return `<span class="title-letter" style="animation-delay: ${delay}s;">${
            letter === " " ? "&nbsp;" : letter
          }</span>`;
        })
        .join("");
    }
  });
});
