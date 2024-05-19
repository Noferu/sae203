<?php

require_once('connexion.php');
require_once('data_access.php');
require_once('UserService.php');

// Utilisation de UserService
use Services\UserService;

$pdo = connexion();

// Création d'une instance objet du service utilisateur.
$userService = new UserService($pdo);

// Démarrage de la session.
session_start();

// Récupération de l'action à effectuer (par défaut, aucune action).
$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action) {
    case 'logout':
        // Déconnexion de l'utilisateur.
        session_unset();
        session_destroy();
        header("Location: ../index.php");
        exit();

    case 'handle_register':
        // Traitement de l'inscription de l'utilisateur.
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Récupération et filtrage des données du formulaire.
            $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
            $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            // Validation des données.
            $validation_error = $userService->validateRegistration($username, $email, $password);
            if ($validation_error) {
                header("Location: ../pages/user_connexion.php?action=show_register_form&error=" . urlencode($validation_error));
                exit();
            }

            // Vérification de l'existence de l'utilisateur.
            if ($userService->userExists($username, $email)) {
                header("Location: ../pages/user_connexion.php?action=show_register_form&error=" . urlencode('Nom d\'utilisateur ou email déjà utilisé'));
                exit();
            }

            // Enregistrement du nouvel utilisateur.
            $new_user_id = $userService->registerUser($username, $email, $password);
            if ($new_user_id) {
                $_SESSION['user_id'] = $new_user_id;
                $_SESSION['username'] = $username;
                $_SESSION['message'] = 'Vous êtes connecté en tant que ' . $username;
                header("Location: ../index.php");
                exit();
            } else {
                header("Location: ../pages/user_connexion.php?action=show_register_form&error=" . urlencode('Erreur d\'insertion des données'));
                exit();
            }
        }
        break;

    case 'handle_login':
        // Traitement de la connexion de l'utilisateur.
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Récupération et filtrage des données du formulaire.
            $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            // Vérification des informations de connexion.
            $user = $userService->loginUser($username, $password);
            if ($user) {
                session_regenerate_id(true);
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['message'] = 'Vous êtes connecté en tant que ' . $user['username'];
                header("Location: ../index.php");
                exit();
            } else {
                header("Location: ../pages/user_connexion.php?action=show_login_form&error=" . urlencode('Identifiants incorrects'));
                exit();
            }
        }
        break;

    default:
        // Redirection vers le formulaire de connexion par défaut.
        header("Location: ../pages/user_connexion.php?action=show_login_form");
        exit();
}