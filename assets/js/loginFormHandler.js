document.addEventListener("DOMContentLoaded", function() {
  const togglePassword = document.querySelector("#togglePassword"); // Sélectionne l'icône pour afficher/masquer le mot de passe
  const password = document.querySelector("#password"); // Sélectionne le champ de mot de passe
  const toggleConfirmPassword = document.querySelector("#toggleConfirmPassword"); // Sélectionne l'icône pour afficher/masquer le mot de passe de confirmation
  const confirmPassword = document.querySelector("#confirm_password"); // Sélectionne le champ de mot de passe de confirmation

  // Vérifie si l'icône pour le mot de passe existe
  if (togglePassword) {
    togglePassword.addEventListener("click", function () {
      const type = password.getAttribute("type") === "password" ? "text" : "password"; // Change le type du champ entre 'password' et 'text'
      password.setAttribute("type", type); // Applique le nouveau type au champ de mot de passe
      this.classList.toggle("fa-eye"); // Bascule l'icône entre 'fa-eye' et 'fa-eye-slash'
      this.classList.toggle("fa-eye-slash");
    });
  }

  // Vérifie si l'icône pour le mot de passe de confirmation existe
  if (toggleConfirmPassword) {
    toggleConfirmPassword.addEventListener("click", function () {
      const type = confirmPassword.getAttribute("type") === "password" ? "text" : "password"; // Change le type du champ entre 'password' et 'text'
      confirmPassword.setAttribute("type", type); // Applique le nouveau type au champ de mot de passe de confirmation
      this.classList.toggle("fa-eye"); // Bascule l'icône entre 'fa-eye' et 'fa-eye-slash'
      this.classList.toggle("fa-eye-slash");
    });
  }
});
