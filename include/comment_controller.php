<?php

require_once('connexion.php');
require_once('data_access.php');
require_once('UserService.php');

$pdo = connexion();

// Création d'une instance objet du service utilisateur.
$userService = new UserService($pdo);

session_start();

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action) {
    case 'submit_comment':
        // Soumettre un commentaire
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $articleId = filter_input(INPUT_POST, 'article_id', FILTER_VALIDATE_INT);
            $userId = $_SESSION['user_id'];
            $content = filter_input(INPUT_POST, 'comment', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $rating = filter_input(INPUT_POST, 'rating', FILTER_VALIDATE_INT);

            if (empty($content) || empty($rating)) {
                $_SESSION['toast_message'] = 'Veuillez écrire un commentaire et sélectionner une note.';
                header("Location: ../pages/product?action=detail&article_id=$articleId#lower-part");
                exit();
            }

            $result = $userService->addComment($articleId, $userId, $content, $rating);

            if ($result) {
                $_SESSION['toast_message'] = 'Commentaire ajouté avec succès.';
            } else {
                $_SESSION['toast_message'] = 'Erreur lors de l\'ajout du commentaire.';
            }
            header("Location: ../pages/product?action=detail&article_id=$articleId#lower-part");
            exit();
        }
        break;

    case 'delete_comment':
        // Supprimer un commentaire
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $articleId = filter_input(INPUT_POST, 'article_id', FILTER_VALIDATE_INT);
            $comment_id = filter_input(INPUT_POST, 'comment_id', FILTER_VALIDATE_INT);
            $author_id = filter_input(INPUT_POST, 'author_id', FILTER_VALIDATE_INT);
            $userId = $_SESSION['user_id'];

            if ($author_id != $userId) {
                $_SESSION['toast_message'] = 'Vous n\'êtes pas l\'auteur de ce commentaire.';
                header("Location: ../pages/product?action=detail&article_id=$articleId#lower-part");
                exit();
            } else {
                $result = $userService->deleteComment($comment_id);
            }

            if ($result) {
                $_SESSION['toast_message'] = 'Commentaire supprimé avec succès.';
            } else {
                $_SESSION['toast_message'] = 'Erreur lors de la suppression du commentaire.';
            }
            header("Location: ../pages/product?action=detail&article_id=$articleId#lower-part");
            exit();
        }
        break;

    default:
        // Rediriger vers la page de détails de l'article
        header("Location: ../pages/product?action=detail&article_id=$articleId");
        exit();
}
