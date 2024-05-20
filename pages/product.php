<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

$action = isset($_GET['action']) ? $_GET['action'] : 'list'; // Récupère l'action ou définit par défaut à 'list'

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

switch ($action) {
    case 'detail':
        // Afficher les détails d'un article
        $article_id = $_GET['article_id'];
        $sql = "SELECT * FROM articles WHERE article_id = :article_id";
        $params = [':article_id' => $article_id];
        $article = select_data($pdo, $sql, $params, false); // Récupère les détails de l'article

        // Jointure pour récupérer la catégorie actuelle
        $sql = "SELECT c.* FROM categories c
                JOIN subcategories s ON c.category_id = s.category_id
                JOIN articles a ON s.subcategory_id = a.subcategory_id
                WHERE a.article_id = :article_id";
        $current_category = select_data($pdo, $sql, $params, false);

        $sql = "SELECT s.* FROM sellers s
                JOIN articles a ON a.seller_id = s.seller_id
                WHERE a.article_id = :article_id";
        $seller = select_data($pdo, $sql, $params, false);

        echo $twig->render('product/product_detail.twig', [
            'article' => $article,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'current_category' => $current_category,
            'seller' => $seller
        ]);
        break;

    case 'list':
        // La séléction des articles est gérée par Javascript pour des filtres dynamiques

        // Afficher la liste des catégories
        echo $twig->render('product/product_list.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories
        ]);
        break;

    case 'grid':
        // Afficher les articles dans une grille pour une catégorie spécifique
        $category_id = $_GET['category_id'];
        $sql = "SELECT * 
                FROM articles 
                WHERE subcategory_id IN (
                    SELECT subcategory_id 
                    FROM subcategories 
                    WHERE category_id = :category_id
                )";
        $params = [':category_id' => $category_id];
        $articles = select_data($pdo, $sql, $params, true); // Récupère les articles de la catégorie

        // Récupère la catégorie actuelle
        $sql = "SELECT * FROM categories WHERE category_id = :category_id";
        $current_category = select_data($pdo, $sql, $params, false);

        if ($current_category) {
            // Récupère la catégorie précédente
            $sql = "SELECT * FROM categories WHERE category_id < :category_id ORDER BY category_id DESC LIMIT 1";
            $previous_category = select_data($pdo, $sql, $params, false);

            // Récupère la catégorie suivante
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
        // Rechercher des articles
        $search = $_GET['search'] ?? '';
        $search_safe = htmlspecialchars($search); // Sécurise la recherche

        if (empty($search_safe)) {
            // Si la recherche est vide, afficher un message d'erreur
            echo $twig->render('error.twig', [
                'message' => 'Veuillez entrer des mots-clés pour la recherche.',
                'categories' => $categories,
                'subcategories' => $subcategories
            ]);
            break;
        }

        // Sépare les mots de recherche en un tableau et limite à 5 mots
        $search_terms = array_slice(explode(' ', $search_safe), 0, 5);
        $search_query = implode(' ', $search_terms);

        // Requête SQL optimisée avec MATCH...AGAINST et LIKE
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

        // Exécute la requête avec les paramètres
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
        // Action inconnue
        echo $twig->render('error.twig', [
            'message' => 'Action inconnue',
            'categories' => $categories,
            'subcategories' => $subcategories,
        ]);
        break;
}
