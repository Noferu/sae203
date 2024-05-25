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
        jQuery.ajax({
            url: '../include/favcart_controller.php?action=' + action,
            type: 'POST',
            data: { article_id: articleId },
            dataType: 'json',
            success: function(response) {
                console.log('AJAX response:', response);

                // Affiche le message toast
                showToast(response.message);

                if (response.status === 'success') {
                    if (action === 'add_favorite') {
                        button.data('action', 'remove_favorite').text('Retirer des favoris');
                    } else if (action === 'remove_favorite') {
                        button.data('action', 'add_favorite').text('Ajouter aux favoris');
                    } else if (action === 'add_to_cart') {
                        button.replaceWith('<a href="' + basePath + '/pages/checkout" class="button">Voir le panier</a>');
                    } else if (action === 'remove_from_cart') {
                        button.closest('.item').remove();
                    }
                }
            },
            error: function(xhr, status, error) {
                console.log('AJAX error:', status, error);
                showToast('Une erreur est survenue');
            }
        });
    }

    // Attacher les événements aux boutons
    jQuery('.favorite-btn, .cart-btn').on('click', function() {
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
                console.log('AJAX response:', response);

                // Affiche le message toast
                showToast(response.message);

                if (response.status === 'success') {
                    jQuery('.favorite-btn[data-action="add_to_cart"]').each(function() {
                        const button = jQuery(this);
                        button.replaceWith('<a href="' + basePath + '/pages/checkout" class="button">Voir le panier</a>');
                    });
                }
            },
            error: function(xhr, status, error) {
                console.log('AJAX error:', status, error);
                showToast('Une erreur est survenue');
            }
        });
    });
});
