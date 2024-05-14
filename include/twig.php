<?php
require_once(__DIR__ . '/../vendor/autoload.php');

function init_twig()
{
    $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/../templates');

    $twig = new \Twig\Environment($loader, ['debug' => true]);
    $twig->addExtension(new \Twig\Extension\DebugExtension());

    // Déterminez le chemin de base selon le script en cours d'exécution
    $script_name = basename($_SERVER['SCRIPT_FILENAME']);
    $base_path = ($script_name == 'index.php') ? '.' : '..';
    $twig->addGlobal('base_path', $base_path);

    return $twig;
}
