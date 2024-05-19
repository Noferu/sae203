<?php
require_once(__DIR__ . '/../vendor/autoload.php');

function init_twig()
{
    // Configuration du chargeur de templates pour Twig
    $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/../templates');

    // Initialisation de l'environnement Twig avec l'extension Debug
    $twig = new \Twig\Environment($loader, ['debug' => true]);
    $twig->addExtension(new \Twig\Extension\DebugExtension());

    // Détermination du chemin de base selon le script en cours d'exécution
    $script_name = basename($_SERVER['SCRIPT_FILENAME']);
    $base_path = ($script_name == 'index.php') ? '.' : '..';
    $twig->addGlobal('base_path', $base_path);

    // Démarrage de la session si ce n'est pas déjà fait
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Vérification si l'utilisateur est connecté
    $isLogged = isset($_SESSION['user_id']);
    $twig->addGlobal('isLogged', $isLogged);

    return $twig;
}
