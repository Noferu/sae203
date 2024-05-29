<?php

require_once('../include/twig.php');

session_start();

$action = isset($_GET['action']) ? $_GET['action'] : 'show_login_form'; // Récupère l'action à effectuer, par défaut 'show_login_form'

// Si l'utilisateur est déjà connecté, change l'action pour afficher le formulaire de déconnexion
if (isset($_SESSION['user_id'])) {
    $action = 'show_logout_form';
}

$error_message = null; // Initialise le message d'erreur à null
if (isset($_GET['error'])) {
    $error_message = urldecode($_GET['error']); // Décode l'erreur passée par URL s'il y en a une
}

$template = '';
$data = ['error_message' => $error_message];

switch ($action) {
    case 'show_login_form':
        // Affiche le formulaire de connexion
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 1]); // Ajoute le mode 1 pour le formulaire de connexion
        break;

    case 'show_register_form':
        // Affiche le formulaire d'inscription
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 2]); // Ajoute le mode 2 pour le formulaire d'inscription
        break;

    case 'show_logout_form':
        // Affiche le formulaire de déconnexion
        $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'John Doe'; // Récupère le nom d'utilisateur ou utilise 'John Doe' par défaut
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 3, 'username' => $username]); // Ajoute le mode 3 pour le formulaire de déconnexion et le nom d'utilisateur
        break;

    default:
        // Affiche par défaut le formulaire de connexion
        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 1]);
        break;
}

$twig = init_twig();
echo $twig->render($template, $data);