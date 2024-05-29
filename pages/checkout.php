<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$step = isset($_GET['step']) ? $_GET['step'] : 'cart'; // Récupère l'étape du processus, par défaut 'cart'

// Vérifie si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    // Si l'utilisateur n'est pas connecté, ouvre la page de connexion dans une nouvelle fenêtre et revient en arrière
    echo '<script>
        window.open("user_connexion.php?action=show_login_form", "_blank");
        window.history.back();
    </script>';
    exit();
}

$user_id = $_SESSION['user_id']; // Récupère l'ID de l'utilisateur connecté

switch ($step) {
    case 'favorites':
        // Affiche les articles favoris de l'utilisateur
        $sql = "SELECT * 
                FROM articles a 
                JOIN favorites f ON a.article_id = f.article_id 
                JOIN users u ON f.user_id = u.user_id 
                WHERE f.user_id = :identifiant";

        $articles = select_data($pdo, $sql, [':identifiant' => $user_id]);

        // Rend la vue pour les favoris avec les articles récupérés
        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'favorites',
            'favorite_items' => $articles
        ]);
        break;

    case 'cart':
        // Affiche le panier de l'utilisateur
        $sql = "SELECT * 
                FROM articles a 
                JOIN cart c ON a.article_id = c.article_id 
                JOIN users u ON c.user_id = u.user_id 
                WHERE c.user_id = :identifiant";

        $params = [':identifiant' => $user_id];

        $articles = select_data($pdo, $sql, $params);

        // Calcul du total du panier
        $cart_total = 0;
        foreach ($articles as $article) {
            $cart_total += $article['price'] * $article['quantity'];
        }

        // Rend la vue pour le panier avec les articles et le total du panier
        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'cart',
            'cart_items' => $articles,
            'cart_total' => $cart_total
        ]);
        break;

    case 'payment':
        // Affiche la page de paiement
        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'payment'
        ]);
        break;

    case 'command_finished':
        // Affiche la page de confirmation de commande terminée
        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'command_finished'
        ]);
        break;
}