<?php

// Inclusion des fichiers nécessaires
include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

// Initialisation de la connexion PDO et de Twig
$pdo = connexion();
$twig = init_twig();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

// Détermination de l'étape à partir de la requête GET ou par défaut à 'basket'
$step = isset($_GET['step']) ? $_GET['step'] : 'basket';

// Démarrage de la session
session_start();

// Vérification si l'utilisateur est connecté, sinon redirection vers la page de connexion
if (!isset($_SESSION['username'])) {
    header("Location: userConnexion.php?action=login");
    exit();
}

// Récupération de l'identifiant utilisateur depuis la session
$user_id = $_SESSION['username'];

// Sélection de l'action à effectuer en fonction de l'étape
switch ($step) {
    case 'favorites':

        // Requête SQL pour récupérer les articles favoris de l'utilisateur
        $sql = "SELECT * 
                FROM articles a 
                JOIN favoris f ON a.article_id = f.article_id 
                JOIN users u ON f.user_id = u.user_id 
                WHERE f.user_id = :identifiant";

        $params = [':identifiant' => $user_id];

        // Exécution de la requête (les résultats ne sont pas utilisés pour le moment)
        $articles = select_data($pdo, $sql, $params);

        // Définition du template à utiliser
        $template = 'cart_and_favorites.twig';
        echo $twig->render($template, ['categories' => $categories,
        'subcategories' => $subcategories]);
        break;

    case 'basket':

        // Requête SQL pour récupérer les articles dans le panier de l'utilisateur
        $sql = "SELECT * 
                FROM articles a 
                JOIN basket b ON a.article_id = b.article_id 
                JOIN users u ON b.user_id = u.user_id 
                WHERE b.user_id = :identifiant";

        $params = [':identifiant' => $user_id];

        // Exécution de la requête (les résultats ne sont pas utilisés pour le moment)
        $articles = select_data($pdo, $sql, $params);

        // Affichage du template 'basket.twig' avec des données vides
        echo $twig->render('cart_and_favorites.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories
        ]);
        break;

    case 'payment':

        // Affichage du template 'payment_n_order.twig' pour l'étape de paiement avec des données vides
        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories
        ]);
        break;

    case 'command_finished':
        
        // Affichage du template 'payment_n_order.twig' pour l'étape de commande terminée avec des données vides
        echo $twig->render('payment_and_order.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories
        ]);
        break;
}