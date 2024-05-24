<?php

// include(__DIR__ . '/include/security_gate.php');

include(__DIR__ . '/include/connexion.php');
include(__DIR__ . '/include/data_access.php');

include(__DIR__ . '/include/twig.php');
$twig = init_twig();

$pdo = connexion();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$login_msg = null;
$username = null;

if (isset($_SESSION['message']) && isset($_SESSION['username'])) {
    $login_msg = $_SESSION['message'];
    $username = $_SESSION['username'];
    unset($_SESSION['message']);
}

// Requête pour obtenir les deux articles les mieux notés
$top_articles = select_data($pdo, '
    SELECT a.title, AVG(c.rating_score) AS moyenne_note
    FROM articles a
    JOIN comments c ON a.article_id = c.article_id
    GROUP BY a.article_id
    ORDER BY moyenne_note DESC
    LIMIT 2
', [], true);

// Lancement du moteur Twig avec les données
echo $twig->render('home.twig', [
    'categories' => $categories,
    'subcategories' => $subcategories,
    'top_articles' => $top_articles,
    'login_msg' => $login_msg,
    'username' => $username
]);