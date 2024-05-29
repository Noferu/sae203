<?php

include('../include/connexion.php');
include('../include/data_access.php');
include('../include/twig.php');

$pdo = connexion();
$twig = init_twig();

// Affichage d'un message toast s'il existe dans la session
if (isset($_SESSION['toast_message'])) {
    $toast_message = $_SESSION['toast_message'];
    echo "<script>showToast('$toast_message');</script>";
    unset($_SESSION['toast_message']); // Suppression du message de la session après affichage
}

$action = isset($_GET['action']) ? $_GET['action'] : 'list'; // Récupère l'action à effectuer, par défaut 'list'

$categories = select_data($pdo, 'SELECT * FROM categories', [], true);
$subcategories = select_data($pdo, 'SELECT * FROM subcategories', [], true);

switch ($action) {
    case 'detail':
        // Récupère les détails d'un article spécifique
        $article_id = $_GET['article_id'];
        $params = [':article_id' => $article_id];

        // Sélection des informations de l'article
        $article = select_data($pdo, "SELECT * FROM articles WHERE article_id = :article_id", $params, false);

        // Sélection de la catégorie actuelle de l'article
        $current_category = select_data($pdo, "SELECT c.* FROM categories c
                                                JOIN subcategories s ON c.category_id = s.category_id
                                                JOIN articles a ON s.subcategory_id = a.subcategory_id
                                                WHERE a.article_id = :article_id", $params, false);

        // Sélection des mots-clés associés à l'article
        $keywords = select_data($pdo, "SELECT k.* FROM keywords k
                                        JOIN articles_keywords ak ON k.keyword_id = ak.keyword_id
                                        JOIN articles a ON ak.article_id = a.article_id
                                        WHERE a.article_id = :article_id", $params, true);

        // Sélection du vendeur de l'article
        $seller = select_data($pdo, "SELECT s.* FROM sellers s
                                      JOIN articles a ON a.seller_id = s.seller_id
                                      WHERE a.article_id = :article_id", $params, false);

        // Sélection des commentaires afficheable en ordre dé-chronologique associés à l'article
        $comments = select_data($pdo, "SELECT c.*, u.username FROM comments c
        JOIN articles a ON a.article_id = c.article_id
        JOIN users u ON u.user_id = c.user_id
        WHERE c.display = 1 AND a.article_id = :article_id
        ORDER BY c.created_at DESC", $params, true);

        // Récupération des informations de l'utilisateur actuel
        $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : false;
        $username = isset($_SESSION['username']) ? $_SESSION['username'] : false;
        $favorites = $cart = $is_favorite = $is_in_cart = false;

        if ($user_id) {
            // Vérifie si l'article est dans les favoris ou le panier de l'utilisateur
            $user_params = [':user_id' => $user_id, ':article_id' => $article_id];
            $favorites = select_data($pdo, "SELECT article_id FROM favorites WHERE user_id = :user_id", [':user_id' => $user_id], false);
            $is_favorite = select_data($pdo, "SELECT COUNT(*) as count FROM favorites WHERE user_id = :user_id AND article_id = :article_id", $user_params, false)['count'] > 0;
            $cart = select_data($pdo, "SELECT article_id FROM cart WHERE user_id = :user_id", [':user_id' => $user_id], false);
            $is_in_cart = select_data($pdo, "SELECT COUNT(*) as count FROM cart WHERE user_id = :user_id AND article_id = :article_id", $user_params, false)['count'] > 0;
        }

        // Préparation des mots-clés pour la suggestion d'articles
        $keyword_ids = [];

        foreach ($keywords as $keyword) {
            $keyword_ids[] = $keyword['keyword_id'];
        }

        $placeholders = [];
        foreach ($keyword_ids as $id) {
            $placeholders[] = '?';
        }
        $placeholders_str = implode(',', $placeholders);

        // Sélection des articles suggérés en fonction des mots-clés communs et d'autres critères
        $sql = "SELECT a.*, COUNT(ak.keyword_id) as common_keywords, AVG(c.rating_score) as avg_rating
        FROM articles a
        LEFT JOIN articles_keywords ak ON a.article_id = ak.article_id
        LEFT JOIN comments c ON a.article_id = c.article_id
        LEFT JOIN (
            SELECT ak2.article_id, COUNT(*) as keyword_matches
            FROM articles_keywords ak2
            WHERE ak2.keyword_id IN ($placeholders_str)
            GROUP BY ak2.article_id
        ) km ON a.article_id = km.article_id
        WHERE a.article_id != ?
        GROUP BY a.article_id
        ORDER BY km.keyword_matches DESC, avg_rating DESC, ABS(a.sale_year - ?) ASC
        LIMIT 10;";

        $suggested_articles = select_data($pdo, $sql, array_merge($keyword_ids, [$article_id, $article['sale_year']]), true);

        // Affichage de la page de détail de l'article avec les informations récupérées
        echo $twig->render('product/product_detail.twig', [
            'article' => $article,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'current_category' => $current_category,
            'keywords' => $keywords,
            'seller' => $seller,
            'is_favorite' => $is_favorite,
            'is_in_cart' => $is_in_cart,
            'suggested_articles' => $suggested_articles,
            'comments' => $comments,
            'current_user' => ['id' => $user_id, 'name' => $username]
        ]);
        break;

    case 'list':
        // Affiche la liste des produits (l'affichage est géré par JavaScript)
        echo $twig->render('product/product_list.twig', [
            'categories' => $categories,
            'subcategories' => $subcategories
        ]);
        break;

    case 'grid':
        // Affiche les produits sous forme de grille pour une catégorie donnée
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

        // Sélection de la catégorie actuelle, précédente et suivante
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

        // Affichage de la page de grille de produits avec les informations récupérées
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
        // Recherche d'articles en fonction des mots-clés saisis
        $search = $_GET['search'] ?? '';
        $search_safe = htmlspecialchars($search);

        if (empty($search_safe)) {
            // Affiche un message d'erreur si aucun mot-clé n'a été saisi
            echo $twig->render('error.twig', [
                'message' => 'Veuillez entrer des mots-clés pour la recherche.',
                'categories' => $categories,
                'subcategories' => $subcategories
            ]);
            break;
        }

        // Préparation des termes de recherche
        $search_terms = array_slice(explode(' ', $search_safe), 0, 5);
        $search_query = implode(' ', $search_terms);

        // Requête pour trouver les articles correspondant aux mots-clés
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
            // Si un article correspondant est trouvé, récupère les informations détaillées
            $article_id = $article['article_id'];
            $params = [':article_id' => $article_id];

            $current_category = select_data($pdo, "SELECT c.* FROM categories c
                                                    JOIN subcategories s ON c.category_id = s.category_id
                                                    JOIN articles a ON s.subcategory_id = a.subcategory_id
                                                    WHERE a.article_id = :article_id", $params, false);

            $keywords = select_data($pdo, "SELECT k.* FROM keywords k
                                            JOIN articles_keywords ak ON k.keyword_id = ak.keyword_id
                                            JOIN articles a ON ak.article_id = a.article_id
                                            WHERE a.article_id = :article_id", $params, true);

            $seller = select_data($pdo, "SELECT s.* FROM sellers s
                                          JOIN articles a ON a.seller_id = s.seller_id
                                          WHERE a.article_id = :article_id", $params, false);

            $comments = select_data($pdo, "SELECT c.*, u.username 
            FROM comments c
            JOIN articles a ON a.article_id = c.article_id
            JOIN users u ON u.user_id = c.user_id
            WHERE a.article_id = :article_id", $params, true);

            $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : false;
            $favorites = $cart = $is_favorite = $is_in_cart = false;

            if ($user_id) {
                // Vérifie si l'article est dans les favoris ou le panier de l'utilisateur
                $user_params = [':user_id' => $user_id, ':article_id' => $article_id];
                $favorites = select_data($pdo, "SELECT article_id FROM favorites WHERE user_id = :user_id", [':user_id' => $user_id], false);
                $is_favorite = select_data($pdo, "SELECT COUNT(*) as count FROM favorites WHERE user_id = :user_id AND article_id = :article_id", $user_params, false)['count'] > 0;
                $cart = select_data($pdo, "SELECT article_id FROM cart WHERE user_id = :user_id", [':user_id' => $user_id], false);
                $is_in_cart = select_data($pdo, "SELECT COUNT(*) as count FROM cart WHERE user_id = :user_id AND article_id = :article_id", $user_params, false)['count'] > 0;
            }

            // Préparation des mots-clés pour la suggestion d'articles
            $keyword_ids = [];

            foreach ($keywords as $keyword) {
                $keyword_ids[] = $keyword['keyword_id'];
            }

            $placeholders = [];
            foreach ($keyword_ids as $id) {
                $placeholders[] = '?';
            }
            $placeholders_str = implode(',', $placeholders);

            // Sélection des articles suggérés en fonction des mots-clés communs et d'autres critères
            $sql = "SELECT a.*, COUNT(ak.keyword_id) as common_keywords, AVG(c.rating_score) as avg_rating
        FROM articles a
        LEFT JOIN articles_keywords ak ON a.article_id = ak.article_id
        LEFT JOIN comments c ON a.article_id = c.article_id
        LEFT JOIN (
            SELECT ak2.article_id, COUNT(*) as keyword_matches
            FROM articles_keywords ak2
            WHERE ak2.keyword_id IN ($placeholders_str)
            GROUP BY ak2.article_id
        ) km ON a.article_id = km.article_id
        WHERE a.article_id != ?
        GROUP BY a.article_id
        ORDER BY km.keyword_matches DESC, avg_rating DESC, ABS(a.sale_year - ?) ASC
        LIMIT 10;";

            $suggested_articles = select_data($pdo, $sql, array_merge($keyword_ids, [$article_id, $article['sale_year']]), true);

            // Affichage de la page de détail de l'article avec les informations récupérées
            echo $twig->render('product/product_detail.twig', [
                'article' => $article,
                'categories' => $categories,
                'subcategories' => $subcategories,
                'current_category' => $current_category,
                'keywords' => $keywords,
                'seller' => $seller,
                'is_favorite' => $is_favorite,
                'is_in_cart' => $is_in_cart,
                'suggested_articles' => $suggested_articles,
                'comments' => $comments
            ]);
            break;
        } else {
            // Affiche un message d'erreur si aucun article correspondant n'est trouvé
            echo $twig->render('error.twig', [
                'message' => 'Aucun article trouvé pour: ' . $search
            ]);
        }
        break;

    default:
        // Affiche un message d'erreur pour une action inconnue
        echo $twig->render('error.twig', [
            'message' => 'Action inconnue',
            'categories' => $categories,
            'subcategories' => $subcategories,
        ]);
        break;
}