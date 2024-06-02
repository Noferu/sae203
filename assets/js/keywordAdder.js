$(document).ready(function () {
  const addKeywordBtn = $("#add-keyword-btn");
  const articleId = addKeywordBtn.data("article-id"); // Récupère l'ID de l'article depuis les données du bouton

  addKeywordBtn.on("click", function (event) {
    event.preventDefault(); // Empêche le comportement par défaut du bouton

    // Vérifie si l'input de mot-clé n'existe pas déjà
    if ($("#keyword-input").length === 0) {
      const input = $("<input>", {
        type: "text",
        id: "keyword-input",
        placeholder: "Ajouter un mot-clé", // Crée un nouvel input pour ajouter un mot-clé
      });

      input.on("keydown", function (event) {
        if (event.key === "Enter") { // Vérifie si la touche "Enter" est pressée
          event.preventDefault(); // Empêche le comportement par défaut de l'input
          addKeywordToDatabase(input.val(), articleId); // Appelle la fonction pour ajouter le mot-clé à la base de données
          input.remove(); // Supprime l'input après l'ajout
        }
      });
      addKeywordBtn.after(input); // Ajoute l'input après le bouton
      input.focus(); // Donne le focus à l'input
    }
  });

  // Fonction pour ajouter le mot-clé à la base de données
  function addKeywordToDatabase(keyword, articleId) {
    if (keyword.trim() !== "") { // Vérifie si le mot-clé n'est pas vide
      $.ajax({
        url: "../include/add_keyword.php", // URL de l'endpoint pour ajouter un mot-clé
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({ keyword: keyword, article_id: articleId }), // Envoie le mot-clé et l'ID de l'article en JSON
        success: function (response) {
          let data;
          try {
            data = typeof response === "string" ? JSON.parse(response) : response; // Parse la réponse JSON
          } catch (e) {
            console.error("Parsing error:", e); // Affiche une erreur si le parsing échoue
            return;
          }

          if (data && data.success) {
            location.reload(); // Recharge la page si l'ajout est un succès
          } else {
            console.error("Error:", data ? data.message : "No message returned"); // Affiche un message d'erreur si l'ajout échoue
          }
        },
        error: function (xhr, status, error) {
          console.error("AJAX request error:", status, error); // Affiche les erreurs de la requête AJAX
          console.error("XHR:", xhr.responseText);
        },
      });
    }
  }
});
