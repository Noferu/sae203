document.addEventListener("DOMContentLoaded", function () {
  const backButton = document.getElementById("back-link");

  if (backButton) {
    backButton.addEventListener("click", function (event) {
      event.preventDefault();
      window.history.back();
    });
  }
});