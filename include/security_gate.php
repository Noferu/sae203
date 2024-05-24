<?php

// Tableau des codes d'accès
$access_codes = [
    '789123', // Cazier, Robin, Lou et Marco
    '192190', // Nolan
    '939812'  // Personne
];

// Fonction pour enregistrer les tentatives
function log_attempt($status, $access_code) {
    $ip = $_SERVER['REMOTE_ADDR'];
    $time = date('Y-m-d H:i:s');
    file_put_contents('access_log.txt', "$time - $ip $access_code - $status\n", FILE_APPEND);
}

// Vérification du code
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['access_code'])) {
        $access_code = htmlspecialchars($_POST['access_code']);

        if (in_array($access_code, $access_codes)) {
            $_SESSION['access_granted'] = true;
            log_attempt('SUCCESS', $access_code);
        } else {
            $error_msg = 'Code incorrect. Veuillez réessayer.';
            log_attempt('FAIL', $access_code);
        }
    } else {
        $error_msg = 'Remplissez le(s) champ(s).';
    }
}

// Affichage du formulaire si l'accès n'est pas encore accordé
if (!isset($_SESSION['access_granted'])) {
    echo '<!DOCTYPE html>
    <html>
    <head>
        <title>Accès sécurisé</title>
    </head>
    <body>
        <h1>Veuillez entrer le code d\'accès</h1>
        <form method="post" action="">
            <br>
            <label for="access_code">Code d\'accès :</label>
            <input type="password" id="access_code" name="access_code" required>
            <br>
            <button type="submit">Soumettre</button>
        </form>';
    if (!empty($error_msg)) {
        echo '<p style="color: red;">' . $error_msg . '</p>';
    }
    echo '</body>
    </html>';
    exit;
}