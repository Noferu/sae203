<?php
// Définir le fuseau horaire
date_default_timezone_set('Europe/Paris'); // Remplacez par le fuseau horaire souhaité

// Tableau des codes d'accès et des noms associés
$access_codes = [
    '789123' => 'Cazier, Robin, Lou et Marco',
    '192190' => 'Nolan',
    '939812' => 'Thibault'
];

// Fonction pour enregistrer les tentatives
function log_attempt($status, $access_code) {
    global $access_codes;
    $ip = $_SERVER['REMOTE_ADDR'];
    $hostname = gethostbyaddr($ip);
    $time = date('Y-m-d H:i:s');
    $names = isset($access_codes[$access_code]) ? $access_codes[$access_code] : 'Inconnu';
    $log_entry = sprintf("%s - %-15s - %-20s - %-30s - %-10s - %s\n", $time, $ip, $hostname, $names, $access_code, $status);
    file_put_contents('access_log.txt', $log_entry, FILE_APPEND);
}

// Vérification du code
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['access_code'])) {
        // Utiliser filter_input pour une meilleure sécurité
        $access_code = filter_var($_POST['access_code'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        if (array_key_exists($access_code, $access_codes)) {
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