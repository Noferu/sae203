<?php

require_once('connexion.php');
require_once('data_access.php');

$pdo = connexion();
session_start();

$action = isset($_GET['action']) ? $_GET['action'] : '';
$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;

$response = ['status' => 'error', 'message' => 'Une erreur est survenue'];

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $user_id) {
    $article_id = $_POST['article_id'] ?? null;

    switch ($action) {
        case 'add_favorite':
            $datetime = date('Y-m-d H:i:s');
            $exists = select_data($pdo, 'SELECT * FROM favorites WHERE user_id = :user_id AND article_id = :article_id', [
                ':user_id' => $user_id,
                ':article_id' => $article_id
            ], false);

            if (!$exists) {
                insert_data($pdo, 'favorites', [
                    'user_id' => $user_id,
                    'article_id' => $article_id,
                    'datetime' => $datetime
                ]);
                $response = ['status' => 'success', 'message' => 'Cet article a été ajouté aux favoris'];
            } else {
                $response = ['status' => 'info', 'message' => 'Cet article est déjà dans les favoris'];
            }
            break;

        case 'remove_favorite':
            $exists = select_data($pdo, 'SELECT * FROM favorites WHERE user_id = :user_id AND article_id = :article_id', [
                ':user_id' => $user_id,
                ':article_id' => $article_id
            ], false);

            if ($exists) {
                delete_data($pdo, 'favorites', [
                    'user_id' => $user_id,
                    'article_id' => $article_id
                ]);
                $response = ['status' => 'success', 'message' => 'Cet article a été retiré des favoris'];
            } else {
                $response = ['status' => 'info', 'message' => 'Cet article n\'est pas dans les favoris'];
            }
            break;

        case 'add_to_cart':
            $datetime = date('Y-m-d H:i:s');
            $exists = select_data($pdo, 'SELECT * FROM cart WHERE user_id = :user_id AND article_id = :article_id', [
                ':user_id' => $user_id,
                ':article_id' => $article_id
            ], false);

            if (!$exists) {
                insert_data($pdo, 'cart', [
                    'user_id' => $user_id,
                    'article_id' => $article_id,
                    'quantity' => 1,
                    'datetime' => $datetime
                ]);
                $response = ['status' => 'success', 'message' => 'Cet article a été ajouté au panier'];
            } else {
                $response = ['status' => 'info', 'message' => 'Cet article est déjà dans le panier'];
            }
            break;

        case 'remove_from_cart':
            $exists = select_data($pdo, 'SELECT * FROM cart WHERE user_id = :user_id AND article_id = :article_id', [
                ':user_id' => $user_id,
                ':article_id' => $article_id
            ], false);

            if ($exists) {
                delete_data($pdo, 'cart', [
                    'user_id' => $user_id,
                    'article_id' => $article_id
                ]);
                $response = ['status' => 'success', 'message' => 'Cet article a été retiré du panier'];
            } else {
                $response = ['status' => 'info', 'message' => 'Cet article n\'est pas dans le panier'];
            }
            break;

        case 'add_all_to_cart':

            $favorites = select_data($pdo, 'SELECT article_id FROM favorites WHERE user_id = :user_id', [
                ':user_id' => $user_id
            ], true);

            foreach ($favorites as $favorite) {
                $article_id = $favorite['article_id'];
                $datetime = date('Y-m-d H:i:s');
                $exists = select_data($pdo, 'SELECT * FROM cart WHERE user_id = :user_id AND article_id = :article_id', [
                    ':user_id' => $user_id,
                    ':article_id' => $article_id
                ], false);

                if (!$exists) {
                    insert_data($pdo, 'cart', [
                        'user_id' => $user_id,
                        'article_id' => $article_id,
                        'quantity' => 1,
                        'datetime' => $datetime
                    ]);
                }
            }
            $response = ['status' => 'success', 'message' => 'Tous les articles ont été ajoutés au panier'];
            break;

        default:
            $response = ['status' => 'error', 'message' => 'Action inconnue'];
            break;
    }
} else {
    if (!$user_id) {
        $response = ['status' => 'error', 'message' => 'Vous devez être connecté pour effectuer cette action'];
    }
}

header('Content-Type: application/json');
echo json_encode($response);
exit();