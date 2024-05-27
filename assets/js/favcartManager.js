function addAnimationClass(button, className) {
    button.addClass(className);
    setTimeout(function() {
        button.removeClass(className);
    }, 800);
}

jQuery(document).ready(function() {
    function handleAjaxAction(button, action, articleId) {
        if (action === 'view_cart') {
            window.location.href = basePath + '/pages/checkout';
            return;
        }

        jQuery.ajax({
            url: '../include/favcart_controller.php?action=' + action,
            type: 'POST',
            data: { article_id: articleId },
            dataType: 'json',
            success: function(response) {
                showToast(response.message);

                if (response.status === 'success') {
                    addAnimationClass(button, 'clicked');

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
            }
        });
    }

    jQuery(document).on('click', '.favorite-btn, .cart-btn', function() {
        const button = jQuery(this);
        addAnimationClass(button, 'clicked');
        const action = button.data('action');
        const articleId = button.data('article-id');
        handleAjaxAction(button, action, articleId);
    });

    jQuery('#add-all-to-cart').on('click', function() {
        jQuery.ajax({
            url: '../include/favcart_controller.php?action=add_all_to_cart',
            type: 'POST',
            dataType: 'json',
            success: function(response) {
                showToast(response.message);

                if (response.status === 'success') {
                    jQuery('.cart-btn[data-action="add_to_cart"]').each(function() {
                        const button = jQuery(this);
                        button.data('action', 'view_cart').text('Voir le panier');
                    });
                }
            }
        });
    });
});
