$(document).ready(function () {
  var urlParams = new URLSearchParams(window.location.search);
  var preselectedCategoryId = urlParams.get("category_id");
  var preselectedSubcategoryId = urlParams.get("subcategory_id");

  loadFilters(preselectedCategoryId, preselectedSubcategoryId);

  function loadFilters(preselectedCategoryId, preselectedSubcategoryId) {
    $.ajax({
      url: "../include/fetch_articles.php",
      type: "GET",
      success: function (data) {
        const response = JSON.parse(data);
        createCheckboxes(
          "#category-checkboxes",
          response.categories,
          "category",
          preselectedCategoryId
        );
        createCheckboxes(
          "#subcategory-checkboxes",
          response.subcategories,
          "subcategory",
          preselectedSubcategoryId
        );
        createCheckboxes("#seller-checkboxes", response.sellers, "seller");
        createCheckboxes("#keyword-checkboxes", response.keywords, "keyword");
        $("#minPrice").attr("placeholder", response.minPrice || "0");
        $("#maxPrice").attr("placeholder", response.maxPrice || "0");
        $("#minYear").attr("placeholder", response.minYear || null);
        $("#maxYear").attr("placeholder", response.maxYear || null);

        fetchAllData(); // Fetch initial data after setup
      },
      error: function () {
        alert("Erreur lors de la récupération des données pour les filtres.");
      },
    });
  }

  function createCheckboxes(containerId, items, name, preselectedId = null) {
    const container = $(containerId);
    container.empty();

    items.forEach((item) => {
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

      container.append(checkbox).append(label);
    });
  }

  $("#filters").on(
    "input",
    'input[type="checkbox"], input[type="number"]',
    fetchAllData
  );

  function getFilterValues(selector) {
    var values = $(selector + ":checked")
      .map(function () {
        return this.value;
      })
      .get();
    return values.length > 0 ? values.join(",") : "all";
  }

  function fetchAllData() {
    $.ajax({
      url: "../include/fetch_articles.php",
      type: "GET",
      data: {
        category: getFilterValues('input[name="category"]'),
        subcategory: getFilterValues('input[name="subcategory"]'),
        seller: getFilterValues('input[name="seller"]'),
        keyword: getFilterValues('input[name="keyword"]'),
        minPrice: $("#minPrice").val() || "all",
        maxPrice: $("#maxPrice").val() || "all",
        minYear: $("#minYear").val() || "all",
        maxYear: $("#maxYear").val() || "all",
      },
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
    console.log("Mise à jour des articles", articles);
    let html = "";
    articles.forEach((article) => {
      html += `<div class="article">
                    <a href="${article.url}"><img src="${article.image_url}" alt="${article.title}" /></a>
                    <a href="${article.url}"><h2>${article.title}</h2></a>
                    <p>${article.description}</p>
                    <p>Price: ${article.price}</p>
                    <p>Year: ${article.sale_year}</p>
                </div>`;
    });
    $("#articles").html(html);
    $("#article-count").html(articles.length + " article(s) trouvé(s)");
  }
});