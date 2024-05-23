<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$step = isset($_GET['step']) ? $_GET['step'] : 'cart';

if (!isset($_SESSION['user_id'])) {
    header("Location: user_connexion.php?action=show_login_form");
    exit();
}

$user_id = $_SESSION['user_id'];

switch ($step) {
    case 'favorites':

        $sql = "SELECT * 
                FROM articles a 
                JOIN favorites f ON a.article_id = f.article_id 
                JOIN users u ON f.user_id = u.user_id 
                WHERE f.user_id = :identifiant";

        $articles = select_data($pdo, $sql, [':identifiant' => $user_id]);

        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'favorites',
            'favorite_items' => $articles
        ]);
        break;

    case 'cart':

        $sql = "SELECT * 
                FROM articles a 
                JOIN cart c ON a.article_id = c.article_id 
                JOIN users u ON c.user_id = u.user_id 
                WHERE c.user_id = :identifiant";

        $params = [':identifiant' => $user_id];

        $articles = select_data($pdo, $sql, $params);

        $cart_total = 0;
        foreach ($articles as $article) {
            $cart_total += $article['price'] * $article['quantity'];
        }

        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'cart',
            'cart_items' => $articles,
            'cart_total' => $cart_total
        ]);
        break;

    case 'payment':

        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'payment'
        ]);
        break;

    case 'command_finished':

        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'display' => 'command_finished'
        ]);
        break;
}
