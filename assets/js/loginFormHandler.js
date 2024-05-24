document.addEventListener("DOMContentLoaded", function() {
  const togglePassword = document.querySelector("#togglePassword");
  const password = document.querySelector("#password");
  const toggleConfirmPassword = document.querySelector("#toggleConfirmPassword");
  const confirmPassword = document.querySelector("#confirm_password");

  if (togglePassword) {
    togglePassword.addEventListener("click", function () {
      const type = password.getAttribute("type") === "password" ? "text" : "password";
      password.setAttribute("type", type);
      this.classList.toggle("fa-eye");
      this.classList.toggle("fa-eye-slash");
    });
  }

  if (toggleConfirmPassword) {
    toggleConfirmPassword.addEventListener("click", function () {
      const type = confirmPassword.getAttribute("type") === "password" ? "text" : "password";
      confirmPassword.setAttribute("type", type);
      this.classList.toggle("fa-eye");
      this.classList.toggle("fa-eye-slash");
    });
  }
});