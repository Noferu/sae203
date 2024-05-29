function magnify(imgID, zoom) {
    const img = document.getElementById(imgID); // Sélectionne l'image à agrandir
    const glass = document.querySelector(".zoom-lens"); // Sélectionne la lentille de zoom
    const bw = 3; // Largeur de la bordure de la lentille

    // Configure les styles de la lentille de zoom
    glass.style.position = "absolute";
    glass.style.backgroundImage = `url('${img.src}')`; // Utilise l'image comme fond de la lentille
    glass.style.backgroundRepeat = "no-repeat";
    glass.style.backgroundSize = `${img.width * zoom}px ${img.height * zoom}px`; // Ajuste la taille du fond en fonction du zoom
    glass.style.borderRadius = "50%"; // Rend la lentille circulaire
    glass.style.display = "none"; // Masque la lentille par défaut
    glass.style.pointerEvents = "none"; // Désactive les interactions de la souris avec la lentille

    // Ajoute les écouteurs d'événements pour le déplacement de la souris et du toucher
    ["mousemove", "touchmove"].forEach(event => {
        img.addEventListener(event, moveMagnifier);
    });

    // Affiche la lentille lors de l'entrée de la souris dans l'image
    img.addEventListener("mouseenter", () => {
        glass.style.display = "block";
        img.style.cursor = "none"; // Masque le curseur de la souris
    });

    // Cache la lentille lors de la sortie de la souris de l'image
    img.addEventListener("mouseleave", () => {
        glass.style.display = "none";
        img.style.cursor = "default"; // Restaure le curseur par défaut
    });

    function moveMagnifier(e) {
        e.preventDefault(); // Empêche les actions par défaut

        const pos = getCursorPos(e); // Obtient la position du curseur par rapport à l'image
        const w = glass.offsetWidth / 2; // Moitié de la largeur de la lentille
        const h = glass.offsetHeight / 2; // Moitié de la hauteur de la lentille
        let x = pos.x;
        let y = pos.y;

        // Limite la position de la lentille pour qu'elle ne sorte pas de l'image
        if (x > img.width - w / zoom) x = img.width - w / zoom;
        if (x < w / zoom) x = w / zoom;
        if (y > img.height - h / zoom) y = img.height - h / zoom;
        if (y < h / zoom) y = h / zoom;

        // Positionne la lentille
        glass.style.left = `${x - w}px`;
        glass.style.top = `${y - h}px`;
        // Positionne le fond de la lentille pour agrandir la partie de l'image sous la lentille
        glass.style.backgroundPosition = `-${(x * zoom - w + bw)}px -${(y * zoom - h + bw)}px`;
    }

    function getCursorPos(e) {
        const a = img.getBoundingClientRect(); // Obtient la position de l'image dans la page
        const x = e.pageX - a.left - window.scrollX; // Calcule la position X du curseur par rapport à l'image
        const y = e.pageY - a.top - window.scrollY; // Calcule la position Y du curseur par rapport à l'image
        return { x, y };
    }
}

// Initialisation de la fonction de zoom sur l'image avec l'ID 'myimage' et un facteur de zoom de 1.5
magnify("myimage", 1.5);
