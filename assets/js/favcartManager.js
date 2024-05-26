function showToast(message) {
    var toastMessage = document.createElement("div");
    toastMessage.id = "toast-message";
    toastMessage.className = "show";
    toastMessage.innerText = message;
    document.body.appendChild(toastMessage);

    setTimeout(function () {
        toastMessage.className = toastMessage.className.replace("show", "");
        document.body.removeChild(toastMessage);
    }, 3500);
}

jQuery(document).ready(function() {
    // Fonction pour gérer les actions AJAX
    function handleAjaxAction(button, action, articleId) {
        if (action === 'view_cart') {
            // Redirection directe vers la page du panier
            window.location.href = basePath + '/pages/checkout';
            return;
        }

        jQuery.ajax({
            url: '../include/favcart_controller.php?action=' + action,
            type: 'POST',
            data: { article_id: articleId },
            dataType: 'json',
            success: function(response) {

                // Affiche le message toast
                showToast(response.message);

                if (response.status === 'success') {
                    if (action === 'add_favorite') {
                        button.data('action', 'remove_favorite').text('Retirer des favoris');
                    } else if (action === 'remove_favorite') {
                        button.data('action', 'add_favorite').text('Ajouter aux favoris');
                    } else if (action === 'add_to_cart') {
                        button.data('action', 'view_cart').text('Voir le panier');
                    } else if (action === 'remove_from_cart') {
                        button.data('action', 'add_to_cart').text('Ajouter au panier');
                    }
                }
            },
            error: function(xhr, status, error) {
                showToast('Une erreur est survenue');
            }
        });
    }

    // Attacher les événements aux boutons
    jQuery(document).on('click', '.favorite-btn, .cart-btn', function() {
        const button = jQuery(this);
        const action = button.data('action');
        const articleId = button.data('article-id');
        handleAjaxAction(button, action, articleId);
    });

    // Gestion du bouton "Tout ajouter au panier"
    jQuery('#add-all-to-cart').on('click', function() {
        jQuery.ajax({
            url: '../include/favcart_controller.php?action=add_all_to_cart',
            type: 'POST',
            dataType: 'json',
            success: function(response) {

                // Affiche le message toast
                showToast(response.message);

                if (response.status === 'success') {
                    jQuery('.cart-btn[data-action="add_to_cart"]').each(function() {
                        const button = jQuery(this);
                        button.data('action', 'view_cart').text('Voir le panier');
                    });
                }
            },
            error: function(xhr, status, error) {
                showToast('Une erreur est survenue');
            }
        });
    });
});
