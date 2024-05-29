<?php
require_once('connexion.php');
require_once('data_access.php');

$pdo = connexion();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Vérifier si la requête est POST
    $data = json_decode(file_get_contents('php://input'), true);
    $keyword = $data['keyword'];
    $articleId = $data['article_id'];

    if (!empty($keyword)) {
        // Vérifier si le mot-clé existe déjà
        $existKw = select_data($pdo, "SELECT keyword_id FROM keywords WHERE name = :keyword", ['keyword' => $keyword], false);

        if ($existKw) {
            // Mot-clé existe, vérifier le lien avec l'article
            $kwId = $existKw['keyword_id'];
            $existLink = select_data($pdo, "SELECT * FROM articles_keywords WHERE article_id = :article_id AND keyword_id = :keyword_id", ['article_id' => $articleId, 'keyword_id' => $kwId], false);

            if (!$existLink) {
                // Lien n'existe pas, l'ajouter
                insert_data($pdo, 'articles_keywords', ['article_id' => $articleId, 'keyword_id' => $kwId]);
                echo json_encode(['success' => true, 'keyword_id' => $kwId]);
            } else {
                // Lien déjà présent
                echo json_encode(['success' => false, 'message' => 'Keyword already linked to this article']);
            }
        } else {
            // Mot-clé n'existe pas, l'ajouter et créer le lien
            $kwId = insert_data($pdo, 'keywords', ['name' => $keyword]);
            if ($kwId) {
                insert_data($pdo, 'articles_keywords', ['article_id' => $articleId, 'keyword_id' => $kwId]);
                echo json_encode(['success' => true, 'keyword_id' => $kwId]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Failed to add keyword']);
            }
        }
    } else {
        // Mot-clé vide
        echo json_encode(['success' => false, 'message' => 'Keyword is empty']);
    }
} else {
    // Méthode de requête non valide
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
}
