<?php

include('../include/twig.php');
$twig = init_twig();

$step = isset($_GET['step']) ? $_GET['step'] : 'basket'; // Définir 'basket' comme valeur par défaut

$data = [];

switch ($step) {
    case 'basket':
        $data['products'] = [];
        echo $twig->render('basket.twig', $data);
        break;
    case 'payment':
        $data['total'] = 0;
        echo $twig->render('payment_n_order.twig', ['step' => 'payment', 'data' => $data]);
        break;
    case 'command_finished':
        $data['order_id'] = '';
        echo $twig->render('payment_n_order.twig', ['step' => 'command_finished', 'data' => $data]);
        break;
}

