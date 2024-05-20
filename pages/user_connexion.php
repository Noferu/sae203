<?php

require_once('../include/twig.php');

// Démarrage de la session.
session_start();

// Récupération de l'action à effectuer (par défaut, afficher le formulaire de connexion).
$action = isset($_GET['action']) ? $_GET['action'] : 'show_login_form';

// Si l'utilisateur est déjà connecté, rediriger vers la déconnexion.
if (isset($_SESSION['user_id'])) {
    $action = 'show_logout_form';
}

$error_message = null;
if (isset($_GET['error'])) {
    $error_message = urldecode($_GET['error']);
}

$template = '';
$data = ['error_message' => $error_message];

switch ($action) {
    case 'show_login_form':
        // Afficher le formulaire de connexion
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 1]);
        break;

    case 'show_register_form':
        // Afficher le formulaire d'inscription
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 2]);
        break;

    case 'show_logout_form':
        // Afficher le formulaire de déconnexion
        $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'John Doe';

        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 3, 'username' => $username]);
        break;

    default:
        // Par défaut, afficher le formulaire de connexion
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 1]);
        break;
}

// Initialisation de Twig et rendu du template.
$twig = init_twig();
echo $twig->render($template, $data);
