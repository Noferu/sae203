<?php
require_once(__DIR__ . '/../vendor/autoload.php');

function init_twig()
{
    $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/../templates');

    $twig = new \Twig\Environment($loader, ['debug' => true]);
    $twig->addExtension(new \Twig\Extension\DebugExtension());

    // Détermination du chemin de base selon le script en cours d'exécution pour Twig
    $script_name = basename($_SERVER['SCRIPT_FILENAME']);
    $base_path = ($script_name == 'index.php') ? '.' : '..';
    $twig->addGlobal('base_path', $base_path);

    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Variable booléenne si l'utilisateur est connecté pour Twig
    $twig->addGlobal('isLogged', isset($_SESSION['user_id']));

    return $twig;
}
