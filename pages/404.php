<?php

include(__DIR__ . '/include/connexion.php');
include(__DIR__ . '/include/data_access.php');
include(__DIR__ . '/include/twig.php');

$twig = init_twig();
$pdo = connexion();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$message = 'Erreur 404, tu t\'es trompé d\'époque';

echo $twig->render('error.twig', [
    'message' => $message
]);