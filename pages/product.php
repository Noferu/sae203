<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

$action = isset($_GET['action']) ? $_GET['action'] : 'list';

$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : false;
if ($user_id) {
    $favorites = select_data($pdo, "SELECT article_id FROM favorites WHERE user_id = :user_id", [':user_id' => $user_id], true);
}
$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

switch ($action) {
    case 'detail':
        $article_id = $_GET['article_id'];
        $sql = "SELECT * FROM articles WHERE article_id = :article_id";
        $params = [':article_id' => $article_id];
        $article = select_data($pdo, $sql, $params, false);

        $sql = "SELECT c.* FROM categories c
                JOIN subcategories s ON c.category_id = s.category_id
                JOIN articles a ON s.subcategory_id = a.subcategory_id
                WHERE a.article_id = :article_id";
        $current_category = select_data($pdo, $sql, $params, false);

        $sql = "SELECT k.* FROM keywords k
                JOIN articles_keywords ak ON k.keyword_id = ak.keyword_id
                JOIN articles a ON ak.article_id = a.article_id
                WHERE a.article_id = :article_id";
        $keywords = select_data($pdo, $sql, $params, true);

        $sql = "SELECT s.* FROM sellers s
                JOIN articles a ON a.seller_id = s.seller_id
                WHERE a.article_id = :article_id";
        $seller = select_data($pdo, $sql, $params, false);

        echo $twig->render('product/product_detail.twig', [
            'article' => $article,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'current_category' => $current_category,
            'keywords' => $keywords,
            'seller' => $seller,
            'favorites' => $favorites
        ]);
        break;

    case 'list':

        echo $twig->render('product/product_list.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories
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

        $sql = "SELECT * FROM categories WHERE category_id = :category_id";
        $current_category = select_data($pdo, $sql, $params, false);

        if ($current_category) {

            $sql = "SELECT * FROM categories WHERE category_id < :category_id ORDER BY category_id DESC LIMIT 1";
            $previous_category = select_data($pdo, $sql, $params, false);

            $sql = "SELECT * FROM categories WHERE category_id > :category_id ORDER BY category_id ASC LIMIT 1";
            $next_category = select_data($pdo, $sql, $params, false);
        } else {
            $previous_category = null;
            $next_category = null;
        }

        echo $twig->render('product/product_grid.twig', [
            'articles' => $articles,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'current_category' => $current_category,
            'previous_category' => $previous_category,
            'next_category' => $next_category
        ]);
        break;

    case 'searching':

        $search = $_GET['search'] ?? '';
        $search_safe = htmlspecialchars($search);

        if (empty($search_safe)) {

            echo $twig->render('error.twig', [
                'message' => 'Veuillez entrer des mots-clés pour la recherche.',
                'categories' => $categories,
                'subcategories' => $subcategories
            ]);
            break;
        }

        $search_terms = array_slice(explode(' ', $search_safe), 0, 5);
        $search_query = implode(' ', $search_terms);

        $sql = "SELECT a.*, 
                       MATCH(a.title, a.description) AGAINST(:search_query IN NATURAL LANGUAGE MODE) AS score_fulltext,
                       (CASE
                            WHEN a.title LIKE :like_query THEN 1
                            WHEN a.description LIKE :like_query THEN 2
                            WHEN k.name LIKE :like_query THEN 3
                            ELSE 4
                        END) AS score_partial_match
                FROM articles a
                LEFT JOIN articles_keywords ak ON a.article_id = ak.article_id
                LEFT JOIN keywords k ON ak.keyword_id = k.keyword_id
                WHERE MATCH(a.title, a.description) AGAINST(:search_query IN NATURAL LANGUAGE MODE)
                   OR a.title LIKE :like_query
                   OR a.description LIKE :like_query
                   OR k.name LIKE :like_query
                ORDER BY score_fulltext DESC, score_partial_match, LENGTH(a.description) ASC
                LIMIT 1";

        $params = [
            ':search_query' => $search_query,
            ':like_query' => '%' . $search_safe . '%'
        ];

        $article = select_data($pdo, $sql, $params, false);

        if ($article) {
            echo $twig->render('product/product_detail.twig', [
                'article' => $article,
                'categories' => $categories,
                'subcategories' => $subcategories
            ]);
        } else {
            echo $twig->render('error.twig', [
                'message' => 'Aucun article trouvé pour: ' . $search
            ]);
        }
        break;

    default:
        echo $twig->render('error.twig', [
            'message' => 'Action inconnue',
            'categories' => $categories,
            'subcategories' => $subcategories,
        ]);
        break;
}
