<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

$message = 'Erreur 404 Page non trouvée ! Vous semblez perdu dans le temps.';

echo $twig->render('error.twig', [
    'message' => $message,
    'categories' => $categories,
    'subcategories' => $subcategories
]);
