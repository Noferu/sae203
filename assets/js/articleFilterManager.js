// Fonctions principales

function loadFilters(preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId) {
    $.ajax({
        url: "../include/fetch_articles", // URL pour récupérer les articles
        type: "GET",
        success: function (data) {
            const response = JSON.parse(data); // Parse les données JSON reçues
            processFilters(response, preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId);
            setPlaceholders(response); // Définit les placeholders pour les filtres de prix et d'année
            fetchAllData(); // Récupère et affiche tous les articles
        },
        error: function () {
            alert("Erreur lors de la récupération des données pour les filtres."); // Alerte en cas d'erreur
        },
    });
  }
  
  function fetchAllData() {
    $.ajax({
        url: "../include/fetch_articles", // URL pour récupérer les articles filtrés
        type: "GET",
        data: collectFilterData(), // Envoie les données des filtres sélectionnés
        success: function (data) {
            const response = JSON.parse(data); // Parse les données JSON reçues
            updateArticles(response.articles); // Met à jour l'affichage des articles
        },
        error: function () {
            alert("Erreur lors de la récupération des articles."); // Alerte en cas d'erreur
        },
    });
  }
  
  function updateArticles(articles) {
    let html = "";
    articles.forEach((article) => {
        if (article.image_url && article.title) {
            html += generateArticleHtml(article); // Génère le HTML pour chaque article
        } else {
            console.warn("L'article manque de propriétés 'image_url' ou 'title'", article); // Avertissement si les propriétés manquent
        }
    });
    $("#articles").html(html); // Met à jour le conteneur des articles avec le HTML généré
    $("#article-count").html(articles.length + " article" + (articles.length > 1 ? "s" : "") + " trouvé" + (articles.length > 1 ? "s" : "")); // Affiche le nombre d'articles trouvés
  }
  
  // Fonctions utilitaires
  
  function processFilters(response, preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId) {
    createCheckboxes("#category-checkboxes", response.categories, "category", preselectedCategoryId); // Crée les cases à cocher pour les catégories
    createCheckboxes("#subcategory-checkboxes", response.subcategories, "subcategory", preselectedSubcategoryId); // Crée les cases à cocher pour les sous-catégories
    createCheckboxes("#seller-checkboxes", response.sellers, "seller", preselectedSellerId); // Crée les cases à cocher pour les vendeurs
    createCheckboxes("#keyword-checkboxes", response.keywords, "keyword", preselectedKeywordId); // Crée les cases à cocher pour les mots-clés
  }
  
  function setPlaceholders(response) {
    $("#minPrice").attr("placeholder", response.minPrice || "0"); // Définit le placeholder pour le prix minimum
    $("#maxPrice").attr("placeholder", response.maxPrice || "0"); // Définit le placeholder pour le prix maximum
    $("#minYear").attr("placeholder", response.minYear || null); // Définit le placeholder pour l'année minimum
    $("#maxYear").attr("placeholder", response.maxYear || null); // Définit le placeholder pour l'année maximum
  }
  
  function createCheckboxes(containerId, items, name, preselectedId = null) {
    const container = $(containerId); // Sélectionne le conteneur pour les cases à cocher
    container.empty(); // Vide le conteneur
    items.forEach((item) => {
        container.append(generateCheckboxHtml(item, name, preselectedId)); // Ajoute les cases à cocher au conteneur
    });
  }
  
  function generateCheckboxHtml(item, name, preselectedId) {
    const id = `${name}-${item.id}`; // Génère l'ID unique pour chaque case à cocher
    const checked = item.id == preselectedId ? true : false; // Vérifie si l'item est présélectionné
    const checkbox = $("<input>", {
        type: "checkbox",
        id: id,
        value: item.id,
        name: name,
        checked: checked,
    });
  
    const label = $("<label>", { text: item.name, for: id });
  
    const checkboxContainer = $("<div>", { class: "checkbox-container" });
    checkboxContainer.append(checkbox).append(label); // Ajoute la case à cocher et son label au conteneur
  
    return checkboxContainer; // Retourne le conteneur avec la case à cocher
  }
  
  function collectFilterData() {
    return {
        category: getFilterValues('input[name="category"]'), // Récupère les valeurs sélectionnées pour les catégories
        subcategory: getFilterValues('input[name="subcategory"]'), // Récupère les valeurs sélectionnées pour les sous-catégories
        seller: getFilterValues('input[name="seller"]'), // Récupère les valeurs sélectionnées pour les vendeurs
        keyword: getFilterValues('input[name="keyword"]'), // Récupère les valeurs sélectionnées pour les mots-clés
        minPrice: $("#minPrice").val() || "all", // Récupère la valeur du prix minimum ou "all" si vide
        maxPrice: $("#maxPrice").val() || "all", // Récupère la valeur du prix maximum ou "all" si vide
        minYear: $("#minYear").val() || "all", // Récupère la valeur de l'année minimum ou "all" si vide
        maxYear: $("#maxYear").val() || "all", // Récupère la valeur de l'année maximum ou "all" si vide
    };
  }
  
  function getFilterValues(selector) {
    var values = $(selector + ":checked").map(function () {
        return this.value;
    }).get(); // Récupère les valeurs des cases à cocher sélectionnées
    return values.length > 0 ? values.join(",") : "all"; // Retourne les valeurs jointes par des virgules ou "all" si aucune sélection
  }
  
  function generateArticleHtml(article) {
    const imageUrl = `../assets/images/articles/${article.image_url}`; // Génère l'URL de l'image de l'article
    let shortDescription = article.description.length > 100 ? getShortDescription(article.description, 100) : article.description; // Tronque la description si elle est trop longue
  
    return `
        <div class="article">
            <a class="image" href="${article.url}" aria-label="${article.title}">
                <img src="${imageUrl}" alt="${article.title}"/>
            </a>
            <div class="right-part">
                <div class="text-infos">
                    <a href="${article.url}">
                        <h2>${article.title}</h2>
                    </a>
                    <p>${shortDescription}</p>
                    <p><span>Prix :</span> ${article.price} €</p>
                    <p><span>Année de vente :</span> ${article.sale_year}</p>
                </div>
                <div class="btns">
                    <a class="learn-more" href="${article.url}">En savoir plus</a>
                    <a class="put-in-cart cart-btn" href="#" data-action="add_to_cart" data-article-id="${article.article_id}">Ajouter au panier</a>
                </div>
            </div>
        </div>
    `;
  }
  
  function formatString(str) {
    return str
        .toLowerCase()
        .replace(/[\s']/g, "-")
        .replace(/[éèêë]/g, "e")
        .replace(/[àâä]/g, "a")
        .replace(/[îï]/g, "i")
        .replace(/[ôö]/g, "o")
        .replace(/[ùûü]/g, "u")
        .replace(/[ç]/g, "c"); // Formate la chaîne de caractères pour les URL
  }
  
  function getShortDescription(description, maxLength) {
    if (description.length <= maxLength) {
        return description; // Retourne la description si elle est suffisamment courte
    }
  
    let trimmedDescription = description.substring(0, maxLength); // Tronque la description à la longueur maximale
  
    if (description.charAt(maxLength) !== " " && trimmedDescription.indexOf(" ") !== -1) {
        let lastSpaceIndex = trimmedDescription.lastIndexOf(" ");
        trimmedDescription = trimmedDescription.substring(0, lastSpaceIndex); // Tronque au dernier espace si nécessaire
    }
  
    if (trimmedDescription.endsWith(".")) {
        trimmedDescription = trimmedDescription.slice(0, -1);
        trimmedDescription += "..."; // Ajoute "..." à la fin de la description
    } else {
        trimmedDescription += "..."; // Ajoute "..." à la fin de la description
    }
  
    return trimmedDescription; // Retourne la description tronquée
  }
  
  // Initialisation
  
  $(document).ready(function () {
    var urlParams = new URLSearchParams(window.location.search); // Récupère les paramètres de l'URL
    var preselectedCategoryId = urlParams.get("category_id"); // Récupère la catégorie présélectionnée
    var preselectedSubcategoryId = urlParams.get("subcategory_id"); // Récupère la sous-catégorie présélectionnée
    var preselectedKeywordId = urlParams.get("keyword_id"); // Récupère le mot-clé présélectionné
    var preselectedSellerId = urlParams.get("seller_id"); // Récupère le vendeur présélectionné
  
    loadFilters(preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId); // Charge les filtres avec les présélections
  
    $("#filters").on("input", 'input[type="checkbox"], input[type="number"]', function () {
        fetchAllData(); // Récupère tous les articles à chaque changement de filtre
    });
  });
  