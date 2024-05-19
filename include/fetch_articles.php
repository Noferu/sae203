<?php
include 'connexion.php';
include 'data_access.php';

$pdo = connexion();

$category = isset($_GET['category']) && $_GET['category'] != 'all' ? explode(',', $_GET['category']) : 'all';
$subcategory = isset($_GET['subcategory']) && $_GET['subcategory'] != 'all' ? explode(',', $_GET['subcategory']) : 'all';
$seller = isset($_GET['seller']) && $_GET['seller'] != 'all' ? explode(',', $_GET['seller']) : 'all';
$keyword = isset($_GET['keyword']) && $_GET['keyword'] != 'all' ? explode(',', $_GET['keyword']) : 'all';
$minPrice = $_GET['minPrice'] ?? 'all';
$maxPrice = $_GET['maxPrice'] ?? 'all';
$minYear = $_GET['minYear'] ?? 'all';
$maxYear = $_GET['maxYear'] ?? 'all';

$sql_articles = "SELECT a.* FROM articles a ";
$params = [];
$whereConditions = [];

if ($category !== 'all') {
    $sql_articles .= "JOIN subcategories sc ON a.subcategory_id = sc.subcategory_id ";
    $sql_articles .= "JOIN categories c ON sc.category_id = c.category_id ";
    $placeholders = implode(',', array_fill(0, count($category), '?'));
    $whereConditions[] = "c.category_id IN ($placeholders)";
    $params = array_merge($params, $category);
}

if ($subcategory !== 'all') {
    $placeholders = implode(',', array_fill(0, count($subcategory), '?'));
    $whereConditions[] = "a.subcategory_id IN ($placeholders)";
    $params = array_merge($params, $subcategory);
}

if ($seller !== 'all') {
    $placeholders = implode(',', array_fill(0, count($seller), '?'));
    $whereConditions[] = "a.seller_id IN ($placeholders)";
    $params = array_merge($params, $seller);
}

if ($keyword !== 'all') {
    $sql_articles .= "JOIN articles_keywords ak ON a.article_id = ak.article_id ";
    $placeholders = implode(',', array_fill(0, count($keyword), '?'));
    $whereConditions[] = "ak.keyword_id IN ($placeholders)";
    $params = array_merge($params, $keyword);
}

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

if (!empty($whereConditions)) {
    $sql_articles .= " WHERE " . implode(' AND ', $whereConditions);
}

$articles = select_data($pdo, $sql_articles, $params);

foreach ($articles as &$article) {
    $article['url'] = "product.php?action=detail&article_id=" . $article['article_id'];
}

$categories = select_data($pdo, "SELECT category_id AS id, name FROM categories");
$sellers = select_data($pdo, "SELECT seller_id AS id, name FROM sellers");
$subcategories = select_data($pdo, "SELECT subcategory_id AS id, name FROM subcategories");
$keywords = select_data($pdo, "SELECT keyword_id AS id, name FROM keywords");
$minPrice = select_data($pdo, "SELECT MIN(price) AS minPrice FROM articles")[0];
$maxPrice = select_data($pdo, "SELECT MAX(price) AS maxPrice FROM articles")[0];
$minYear = select_data($pdo, "SELECT MIN(sale_year) AS minYear FROM articles")[0];
$maxYear = select_data($pdo, "SELECT MAX(sale_year) AS maxYear FROM articles")[0];

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