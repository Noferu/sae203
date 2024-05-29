<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

// Récupération des catégories et sous-catégories depuis la base de données
$categories = select_data($pdo, 'SELECT * FROM categories ORDER BY date ASC', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

// Détermination du message d'erreur en fonction du code
$error_code = isset($_GET['code']) ? $_GET['code'] : 404; // Par défaut, on suppose une erreur 404
$title = '';
$detail_message = '';

switch ($error_code) {
    case 400:
        $title = 'Erreur 400';
        $detail_message = 'Requête incorrecte ! Votre machine temporelle semble avoir envoyé une requête erronée.';
        break;
    case 401:
        $title = 'Erreur 401';
        $detail_message = 'Non autorisé ! Vous devez prouver votre identité pour accéder à cette époque.';
        break;
    case 403:
        $title = 'Erreur 403';
        $detail_message = 'Accès interdit ! Vous ne possédez pas les droits nécessaires pour explorer cette période.';
        break;
    case 404:
        $title = 'Erreur 404';
        $detail_message = 'Page non trouvée ! Il semble que vous ayez perdu votre chemin dans le continuum espace-temps.';
        break;
    case 500:
        $title = 'Erreur 500';
        $detail_message = 'Erreur interne du serveur ! Une anomalie temporelle a été détectée. Veuillez réessayer plus tard.';
        break;
    default:
        $title = 'Erreur inconnue';
        $detail_message = 'Une erreur inattendue s\'est produite lors de votre voyage dans le temps.';
        break;
}

echo $twig->render('error.twig', [
    'title' => $title,
    'detail_message' => $detail_message,
    'categories' => $categories,
    'subcategories' => $subcategories,
    'code' => $error_code
]);