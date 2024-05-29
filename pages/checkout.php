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
            'step' => 'favorites',
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
        $cart_total = array_reduce($articles, function($total, $article) {
            return $total + $article['price'] * $article['quantity'];
        }, 0);

        // Rend la vue pour le panier avec les articles et le total du panier
        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'step' => 'cart',
            'cart_items' => $articles,
            'cart_total' => $cart_total
        ]);
        break;

    case 'quantity_change':
        // Affiche le panier de l'utilisateur
        $sql = "SELECT * 
                FROM articles a 
                JOIN cart c ON a.article_id = c.article_id 
                JOIN users u ON c.user_id = u.user_id 
                WHERE c.user_id = :identifiant";

        $params = [':identifiant' => $user_id];
        $articles = select_data($pdo, $sql, $params);

        // Calcul du total du panier
        $cart_total = array_reduce($articles, function($total, $article) {
            return $total + $article['price'] * $article['quantity'];
        }, 0);

        // Vérifie si une requête POST a été envoyée pour changer la quantité
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $articleId = null;
            $action = null;

            // Identifie l'action (augmentation ou diminution de la quantité)
            if (isset($_POST['increase_quantity'])) {
                $articleId = $_POST['increase_quantity'];
                $action = 'increase';
            } elseif (isset($_POST['decrease_quantity'])) {
                $articleId = $_POST['decrease_quantity'];
                $action = 'decrease';
            }

            if ($articleId && $action) {
                // Récupère la quantité actuelle de l'article dans le panier
                $sql = "SELECT quantity FROM cart WHERE user_id = :user_id AND article_id = :article_id";
                $params = ['user_id' => $user_id, 'article_id' => $articleId];
                $current_quantity = select_data($pdo, $sql, $params, false);

                if ($current_quantity) {
                    $current_quantity = $current_quantity['quantity'];

                    // Ajuste la quantité en fonction de l'action
                    $new_quantity = $action === 'increase' ? $current_quantity + 1 : max(1, $current_quantity - 1);

                    // Met à jour la quantité dans la base de données
                    $data = ['quantity' => $new_quantity];
                    $conditions = ['user_id' => $user_id, 'article_id' => $articleId];
                    update_data($pdo, 'cart', $data, $conditions);
                }
            } else {
                echo "Aucune action valide n'a été soumise.";
            }
        } else {
            echo "Aucune donnée POST reçue.";
        }

        // Rend la vue pour le panier avec les articles et le total du panier
        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'step' => 'cart',
            'cart_items' => $articles,
            'cart_total' => $cart_total
        ]);
        break;

    case 'payment':
        // Affiche la page de paiement
        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'step' => 'payment'
        ]);
        break;

    case 'command_finished':
        // Affiche la page de confirmation de commande terminée
        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'step' => 'command_finished'
        ]);
        break;
}