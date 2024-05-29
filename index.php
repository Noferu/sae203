<?php

include(__DIR__ . '/include/connexion.php');
include(__DIR__ . '/include/data_access.php');

include(__DIR__ . '/include/twig.php');
$twig = init_twig();

$pdo = connexion();

// Récupération des catégories et sous-catégories depuis la base de données
$categories = select_data($pdo, 'SELECT * FROM categories ORDER BY date ASC', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$login_msg = null; // Initialisation du message de connexion à null
$username = null; // Initialisation du nom d'utilisateur à null

// Vérification et récupération du message de session et du nom d'utilisateur
if (isset($_SESSION['message']) && isset($_SESSION['username'])) {
    $login_msg = $_SESSION['message']; // Stockage du message de session
    $username = $_SESSION['username']; // Stockage du nom d'utilisateur
    unset($_SESSION['message']); // Suppression du message de session
}

// Sélection des deux articles les mieux notés
$top_articles = select_data($pdo, '
    SELECT a.*, AVG(c.rating_score) AS moyenne_note
    FROM articles a
    JOIN comments c ON a.article_id = c.article_id
    GROUP BY a.article_id
    ORDER BY moyenne_note DESC
    LIMIT 2
', [], true);

// Lancement du moteur Twig avec les données
echo $twig->render('home.twig', [
    'categories' => $categories, // Envoi des catégories à Twig
    'subcategories' => $subcategories, // Envoi des sous-catégories à Twig
    'top_articles' => $top_articles, // Envoi des articles les mieux notés à Twig
    'login_msg' => $login_msg, // Envoi du message de connexion à Twig
    'username' => $username // Envoi du nom d'utilisateur à Twig
]);