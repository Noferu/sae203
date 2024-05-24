<?php

include('../include/connexion.php');

if (!isset($_SESSION['user_id'])) {
    header("Location: user_connexion.php?action=show_login_form");
    exit();
}

$user_id = $_SESSION['user_id'];
$article_id = $_POST['article_id'];
$action = $_GET['action'];

$pdo = connexion();

if ($action == 'add_favorite') {
    $sql = "INSERT INTO favorites (user_id, article_id) VALUES (:user_id, :article_id)";
    $stmt = $pdo->prepare($sql);
    if ($stmt->execute([':user_id' => $user_id, ':article_id' => $article_id])) {
        header("Location: {$_SERVER['HTTP_REFERER']}?favorite_added=true");
    } else {
        header("Location: {$_SERVER['HTTP_REFERER']}?favorite_added=false");
    }
} elseif ($action == 'remove_favorite') {
    $sql = "DELETE FROM favorites WHERE user_id = :user_id AND article_id = :article_id";
    $stmt = $pdo->prepare($sql);
    if ($stmt->execute([':user_id' => $user_id, ':article_id' => $article_id])) {
        header("Location: {$_SERVER['HTTP_REFERER']}?favorite_removed=true");
    } else {
        header("Location: {$_SERVER['HTTP_REFERER']}?favorite_removed=false");
    }
} elseif ($action == 'add_to_cart') {
    // Gestion de l'ajout au panier ici...
}

exit();