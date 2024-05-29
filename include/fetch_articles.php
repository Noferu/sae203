<?php

include 'connexion.php';
include 'data_access.php';

$pdo = connexion();

// Récupération des filtres depuis les paramètres GET
$category = isset($_GET['category']) && $_GET['category'] != 'all' ? explode(',', $_GET['category']) : 'all';
$subcategory = isset($_GET['subcategory']) && $_GET['subcategory'] != 'all' ? explode(',', $_GET['subcategory']) : 'all';
$seller = isset($_GET['seller']) && $_GET['seller'] != 'all' ? explode(',', $_GET['seller']) : 'all';
$keyword = isset($_GET['keyword']) && $_GET['keyword'] != 'all' ? explode(',', $_GET['keyword']) : 'all';
$minPrice = $_GET['minPrice'] ?? 'all';
$maxPrice = $_GET['maxPrice'] ?? 'all';
$minYear = $_GET['minYear'] ?? 'all';
$maxYear = $_GET['maxYear'] ?? 'all';

// Construction de la requête SQL pour récupérer les articles
$sql_articles = "SELECT a.* FROM articles a ";
$params = [];
$whereConditions = [];

// Ajout des conditions pour les catégories
if ($category !== 'all') {
    $sql_articles .= "JOIN subcategories sc ON a.subcategory_id = sc.subcategory_id ";
    $sql_articles .= "JOIN categories c ON sc.category_id = c.category_id ";
    $placeholders = implode(',', array_fill(0, count($category), '?'));
    $whereConditions[] = "c.category_id IN ($placeholders)";
    $params = array_merge($params, $category);
}

// Ajout des conditions pour les sous-catégories
if ($subcategory !== 'all') {
    $placeholders = implode(',', array_fill(0, count($subcategory), '?'));
    $whereConditions[] = "a.subcategory_id IN ($placeholders)";
    $params = array_merge($params, $subcategory);
}

// Ajout des conditions pour les vendeurs
if ($seller !== 'all') {
    $placeholders = implode(',', array_fill(0, count($seller), '?'));
    $whereConditions[] = "a.seller_id IN ($placeholders)";
    $params = array_merge($params, $seller);
}

// Ajout des conditions pour les mots-clés
if ($keyword !== 'all') {
    $sql_articles .= "JOIN articles_keywords ak ON a.article_id = ak.article_id ";
    $placeholders = implode(',', array_fill(0, count($keyword), '?'));
    $whereConditions[] = "ak.keyword_id IN ($placeholders)";
    $params = array_merge($params, $keyword);
}

// Ajout des conditions pour les prix et années de vente
if ($minPrice !== 'all') {
    $whereConditions[] = "a.price >= ?";
    $params[] = $minPrice;
}
if ($maxPrice !== 'all') {
    $whereConditions[] = "a.price <= ?";
    $params[] = $maxPrice;
}
if ($minYear !== 'all') {
    $whereConditions[] = "a.sale_year >= ?";
    $params[] = $minYear;
}
if ($maxYear !== 'all') {
    $whereConditions[] = "a.sale_year <= ?";
    $params[] = $maxYear;
}

// Ajout des conditions WHERE si nécessaire
if (!empty($whereConditions)) {
    $sql_articles .= " WHERE " . implode(' AND ', $whereConditions);
}

// Ajout de la clause ORDER BY pour trier par date de vente (ou sale_year)
$sql_articles .= " ORDER BY a.sale_year ASC";

// Exécution de la requête pour récupérer les articles
$articles = select_data($pdo, $sql_articles, $params);

// Ajout de l'URL pour chaque article
foreach ($articles as &$article) {
    $article['url'] = "product.php?action=detail&article_id=" . $article['article_id'];
}

// Récupération des catégories, sous-catégories, mots-clés et vendeurs pour les filtres
$categories = select_data($pdo, 'SELECT * FROM categories ORDER BY date ASC', [], true);
$subcategories = select_data($pdo, "SELECT subcategory_id AS id, name FROM subcategories");

$keywords = select_data($pdo, "
    SELECT k.keyword_id AS id, k.name 
    FROM keywords k 
    JOIN articles_keywords ak ON k.keyword_id = ak.keyword_id 
    GROUP BY k.keyword_id, k.name 
    HAVING COUNT(DISTINCT ak.article_id) >= 2
");

$sellers = select_data($pdo, "
    SELECT s.seller_id AS id, s.name 
    FROM sellers s 
    JOIN articles a ON s.seller_id = a.seller_id 
    GROUP BY s.seller_id, s.name 
    HAVING COUNT(DISTINCT a.article_id) >= 2
");

// Récupération des prix minimum et maximum, et des années de vente
$minPrice = select_data($pdo, "SELECT MIN(price) AS minPrice FROM articles")[0];
$maxPrice = select_data($pdo, "SELECT MAX(price) AS maxPrice FROM articles")[0];
$minYear = select_data($pdo, "SELECT MIN(sale_year) AS minYear FROM articles")[0];
$maxYear = select_data($pdo, "SELECT MAX(sale_year) AS maxYear FROM articles")[0];

// Envoi des résultats en JSON
echo json_encode([
    'articles' => $articles,
    'categories' => $categories,
    'sellers' => $sellers,
    'subcategories' => $subcategories,
    'keywords' => $keywords,
    'minPrice' => $minPrice['minPrice'],
    'maxPrice' => $maxPrice['maxPrice'],
    'minYear' => $minYear['minYear'],
    'maxYear' => $maxYear['maxYear']
]);