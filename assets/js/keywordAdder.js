$(document).ready(function () {
    const addKeywordBtn = $("#add-keyword-btn");
    const articleId = addKeywordBtn.data("article-id");
  
    addKeywordBtn.on("click", function (event) {
      event.preventDefault();
  
      if ($("#keyword-input").length === 0) {
        const input = $("<input>", {
          type: "text",
          id: "keyword-input",
          placeholder: "Ajouter un mot-clé",
        });
  
        input.on("keydown", function (event) {
          if (event.key === "Enter") {
            event.preventDefault();
            addKeywordToDatabase(input.val(), articleId);
            input.remove();
          }
        });
        addKeywordBtn.after(input);
        input.focus();
      }
    });
  
    function addKeywordToDatabase(keyword, articleId) {
      if (keyword.trim() !== "") {
        $.ajax({
          url: "../include/add_keyword.php",
          method: "POST",
          contentType: "application/json",
          data: JSON.stringify({ keyword: keyword, article_id: articleId }),
          success: function (response) {
            let data;
            try {
              data = typeof response === "string" ? JSON.parse(response) : response;
            } catch (e) {
              console.error("Parsing error:", e);
              return;
            }
  
            if (data && data.success) {
              location.reload();
            } else {
              console.error("Error:", data ? data.message : "No message returned");
            }
          },
          error: function (xhr, status, error) {
            console.error("AJAX request error:", status, error);
            console.error("XHR:", xhr.responseText);
          },
        });
      }
    }
  });
  