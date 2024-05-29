<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$message = 'Erreur 403 Accès interdit ! Vous ne possédez pas les droits nécessaires pour explorer cette époque.';

echo $twig->render('error.twig', [
    'message' => $message,
    'categories' => $categories,
    'subcategories' => $subcategories
]);
