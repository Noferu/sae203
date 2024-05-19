<?php
session_start();

// Code d'accès requis
$access_code = '789123';

// Vérification du code
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['access_code']) && $_POST['access_code'] === $access_code) {
        $_SESSION['access_granted'] = true;
    } else {
        $error_msg = 'Code incorrect. Veuillez réessayer.';
    }
}

// Affichage du formulaire si l'accès n'est pas encore accordé
if (!isset($_SESSION['access_granted'])) {
    // Formulaire de saisie du code
    echo '<!DOCTYPE html>
    <html>
    <head>
        <title>Accès sécurisé</title>
    </head>
    <body>
        <h1>Veuillez entrer le code d\'accès</h1>
        <form method="post" action="">
            <label for="access_code">Code d\'accès :</label>
            <input type="password" id="access_code" name="access_code" required>
            <button type="submit">Soumettre</button>
        </form>';
    if (isset($error_msg)) {
        echo '<p style="color: red;">' . $error_msg . '</p>';
    }
    echo '</body>
    </html>';
    exit;
}