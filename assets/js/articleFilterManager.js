// Fonctions principales

function loadFilters(preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId) {
  $.ajax({
      url: "../include/fetch_articles",
      type: "GET",
      success: function (data) {
          const response = JSON.parse(data);
          processFilters(response, preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId);
          setPlaceholders(response);
          fetchAllData();
      },
      error: function () {
          alert("Erreur lors de la récupération des données pour les filtres.");
      },
  });
}

function fetchAllData() {
  $.ajax({
      url: "../include/fetch_articles",
      type: "GET",
      data: collectFilterData(),
      success: function (data) {
          const response = JSON.parse(data);
          updateArticles(response.articles);
      },
      error: function () {
          alert("Erreur lors de la récupération des articles.");
      },
  });
}

function updateArticles(articles) {
  let html = "";
  articles.forEach((article) => {
      if (article.image_url && article.title) {
          html += generateArticleHtml(article);
      } else {
          console.warn("L'article manque de propriétés 'image_url' ou 'title'", article);
      }
  });
  $("#articles").html(html);
  $("#article-count").html(articles.length + " article" + (articles.length > 1 ? "s" : "") + " trouvé" + (articles.length > 1 ? "s" : ""));
}

// Fonctions utilitaires

function processFilters(response, preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId) {
  createCheckboxes("#category-checkboxes", response.categories, "category", preselectedCategoryId);
  createCheckboxes("#subcategory-checkboxes", response.subcategories, "subcategory", preselectedSubcategoryId);
  createCheckboxes("#seller-checkboxes", response.sellers, "seller", preselectedSellerId);
  createCheckboxes("#keyword-checkboxes", response.keywords, "keyword", preselectedKeywordId);
}

function setPlaceholders(response) {
  $("#minPrice").attr("placeholder", response.minPrice || "0");
  $("#maxPrice").attr("placeholder", response.maxPrice || "0");
  $("#minYear").attr("placeholder", response.minYear || null);
  $("#maxYear").attr("placeholder", response.maxYear || null);
}

function createCheckboxes(containerId, items, name, preselectedId = null) {
  const container = $(containerId);
  container.empty();
  items.forEach((item) => {
      container.append(generateCheckboxHtml(item, name, preselectedId));
  });
}

function generateCheckboxHtml(item, name, preselectedId) {
  const id = `${name}-${item.id}`;
  const checked = item.id == preselectedId ? true : false;
  const checkbox = $("<input>", {
      type: "checkbox",
      id: id,
      value: item.id,
      name: name,
      checked: checked,
  });

  const label = $("<label>", { text: item.name, for: id });

  const checkboxContainer = $("<div>", { class: "checkbox-container" });
  checkboxContainer.append(checkbox).append(label);

  return checkboxContainer;
}

function collectFilterData() {
  return {
      category: getFilterValues('input[name="category"]'),
      subcategory: getFilterValues('input[name="subcategory"]'),
      seller: getFilterValues('input[name="seller"]'),
      keyword: getFilterValues('input[name="keyword"]'),
      minPrice: $("#minPrice").val() || "all",
      maxPrice: $("#maxPrice").val() || "all",
      minYear: $("#minYear").val() || "all",
      maxYear: $("#maxYear").val() || "all",
  };
}

function getFilterValues(selector) {
  var values = $(selector + ":checked").map(function () {
      return this.value;
  }).get();
  return values.length > 0 ? values.join(",") : "all";
}

function generateArticleHtml(article) {
  const imageUrl = `../assets/images/articles/${article.image_url}`;
  let shortDescription = article.description.length > 100 ? getShortDescription(article.description, 100) : article.description;

  return `
      <div class="article">
          <a class="image" href="${article.url}">
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
      .replace(/[ç]/g, "c");
}

function getShortDescription(description, maxLength) {
  if (description.length <= maxLength) {
      return description;
  }

  let trimmedDescription = description.substring(0, maxLength);

  if (description.charAt(maxLength) !== " " && trimmedDescription.indexOf(" ") !== -1) {
      let lastSpaceIndex = trimmedDescription.lastIndexOf(" ");
      trimmedDescription = trimmedDescription.substring(0, lastSpaceIndex);
  }

  if (trimmedDescription.endsWith(".")) {
      trimmedDescription = trimmedDescription.slice(0, -1);
      trimmedDescription += "...";
  } else {
      trimmedDescription += "...";
  }

  return trimmedDescription;
}

// Initialisation

$(document).ready(function () {
  var urlParams = new URLSearchParams(window.location.search);
  var preselectedCategoryId = urlParams.get("category_id");
  var preselectedSubcategoryId = urlParams.get("subcategory_id");
  var preselectedKeywordId = urlParams.get("keyword_id");
  var preselectedSellerId = urlParams.get("seller_id");

  loadFilters(preselectedCategoryId, preselectedSubcategoryId, preselectedKeywordId, preselectedSellerId);

  $("#filters").on("input", 'input[type="checkbox"], input[type="number"]', function () {
      fetchAllData();
  });
});