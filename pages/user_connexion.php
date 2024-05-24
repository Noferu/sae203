<?php

require_once('../include/twig.php');

session_start();

$action = isset($_GET['action']) ? $_GET['action'] : 'show_login_form';

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

        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 1]);
        break;

    case 'show_register_form':

        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 2]);
        break;

    case 'show_logout_form':

        $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'John Doe';

        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 3, 'username' => $username]);
        break;

    default:

        $template = 'user_connexion.twig';
        $data = array_merge($data, ['mode' => 1]);
        break;
}

$twig = init_twig();
echo $twig->render($template, $data);