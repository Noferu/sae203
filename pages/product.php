<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();


$action = isset($_GET['action']) ? $_GET['action'] : 'list';

$sql = 'SELECT * FROM categories';
$categories = select_data($pdo, $sql, [], true);

switch ($action) {
    case 'detail':
        $article_id = $_GET['article_id'];
        $sql = "SELECT * FROM articles WHERE article_id = :article_id";
        $params = [':article_id' => $article_id];
        $article = select_data($pdo, $sql, $params, false);

        echo $twig->render('product_detail.twig', [
            'article' => $article,
            'categories' => $categories
        ]);
        break;

    case 'list':
        echo $twig->render('product_list.twig', [
            'categories' => $categories
        ]);
        break;

    case 'grid':
        $category_id = $_GET['category_id'];
        $sql = "SELECT * 
                FROM articles 
                WHERE subcategory_id IN (
                    SELECT subcategory_id 
                    FROM subcategories 
                    WHERE category_id = :category_id
                )";
        $params = [':category_id' => $category_id];
        $articles = select_data($pdo, $sql, $params, true);

        echo $twig->render('product_grid.twig', [
            'articles' => $articles,
            'categories' => $categories
        ]);
        break;
    case 'searching':
        $search = $_GET['search'] ?? '';
        $search_safe = htmlspecialchars($search);

        $sql = "SELECT * FROM articles 
                    WHERE title LIKE CONCAT('%', :search, '%') OR 
                          description LIKE CONCAT('%', :search, '%') 
                    ORDER BY (CASE WHEN title LIKE CONCAT('%', :search, '%') THEN 1 ELSE 2 END), 
                             LENGTH(description) ASC 
                    LIMIT 1";
        $params = [':search' => $search_safe];
        $article = select_data($pdo, $sql, $params, false);

        if ($article) {
            echo $twig->render('product_detail.twig', [
                'article' => $article,
                'categories' => $categories
            ]);
        } else {
            echo $twig->render('error.twig', [
                'message' => 'Aucun article trouvé pour: ' . $search
            ]);
        }
        break;
    default:
        echo $twig->render('error.twig', [
            'message' => 'Action inconnue'
        ]);
        break;
}
