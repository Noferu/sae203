<?php

include('../include/twig.php');
$twig = init_twig();

$action = isset($_GET['action']) ? $_GET['action'] : 'login';

$data = [];

switch ($action) {
    case 'favorites':
        $data['favorites'] = [];
        $template = 'favorites.twig';
        break;
    case 'login':
        $template = 'login.twig';
        break;
}

echo $twig->render($template, $data);