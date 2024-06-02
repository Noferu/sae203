function addAnimationClass(button, className) {
  button.addClass(className); // Ajoute la classe d'animation au bouton
  setTimeout(function () {
    button.removeClass(className); // Retire la classe d'animation après 800ms
  }, 800);
}

jQuery(document).ready(function () {
  function handleAjaxAction(button, action, articleId) {
    if (action === "view_cart") {
      window.location.href = basePath + "/pages/checkout"; // Redirige vers la page de paiement
      return;
    }

    jQuery.ajax({
      url: "../include/favcart_controller.php?action=" + action, // URL du contrôleur avec l'action
      type: "POST",
      data: { article_id: articleId }, // Envoie l'ID de l'article
      dataType: "json",
      success: function (response) {
        showToast(response.message); // Affiche un message toast avec la réponse du serveur

        if (response.status === "success") {
          addAnimationClass(button, "clicked"); // Ajoute une classe d'animation au bouton

          // Met à jour l'état du bouton en fonction de l'action réussie
          if (action === "add_favorite") {
            button
              .data("action", "remove_favorite")
              .text("Retirer des favoris");
          } else if (action === "remove_favorite") {
            button.data("action", "add_favorite").text("Ajouter aux favoris");
          } else if (action === "add_to_cart") {
            button.data("action", "view_cart").text("Voir le panier");
          } else if (action === "remove_from_cart") {
            button.data("action", "add_to_cart").text("Ajouter au panier");
          }
        }
      },
    });
  }

  // Gère le clic sur les boutons de favori et de panier
  jQuery(document).on("click", ".favorite-btn, .cart-btn", function () {
    const button = jQuery(this); // Sélectionne le bouton cliqué
    addAnimationClass(button, "clicked"); // Ajoute une classe d'animation au bouton
    const action = button.data("action"); // Récupère l'action à effectuer
    const articleId = button.data("article-id"); // Récupère l'ID de l'article
    handleAjaxAction(button, action, articleId); // Appelle la fonction pour gérer l'action AJAX
  });

  // Gère le clic sur le bouton "Ajouter tout au panier"
  jQuery("#add-all-to-cart").on("click", function () {
    jQuery.ajax({
      url: "../include/favcart_controller.php?action=add_all_to_cart", // URL du contrôleur pour ajouter tous les articles au panier
      type: "POST",
      dataType: "json",
      success: function (response) {
        showToast(response.message); // Affiche un message toast avec la réponse du serveur

        if (response.status === "success") {
          // Met à jour tous les boutons "Ajouter au panier" pour afficher "Voir le panier"
          jQuery('.cart-btn[data-action="add_to_cart"]').each(function () {
            const button = jQuery(this); // Sélectionne le bouton
            button.data("action", "view_cart").text("Voir le panier"); // Met à jour l'action et le texte du bouton
          });
        }
      },
    });
  });
});
