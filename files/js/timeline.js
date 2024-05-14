// Fonction qui permet de rendre un élément HTML défilable par glissement avec la souris
function enableDragScroll(element) {
    let isDown = false;
    let startX;
    let scrollLeft;

    // Ajout d'un gestionnaire d'événements pour quand l'utilisateur clique sur l'élément
    element.addEventListener('mousedown', (e) => {
        isDown = true;
        startX = e.clientX; // Position horizontale initiale de la souris
        scrollLeft = element.scrollLeft;
        element.style.cursor = 'grabbing';
        e.preventDefault();
    });

    // Ajout d'un gestionnaire pour quand l'utilisateur relâche la souris n'importe où dans le document
    document.addEventListener('mouseup', () => {
        if (!isDown) return;
        isDown = false;
        element.style.cursor = 'grab';
    });

    // Ajout d'un gestionnaire pour le mouvement de la souris sur tout le document
    document.addEventListener('mousemove', (e) => {
        if (!isDown) return;
        e.preventDefault();
        const x = e.clientX; // Position horizontale actuelle de la souris
        const walk = (x - startX); // Calcul du déplacement fait par la souris
        element.scrollLeft = scrollLeft - walk; // Met à jour la position du scroll en fonction du déplacement
    });
}

function updateCurrentEpoch(epochs, container) {
    const centerPoint = container.offsetWidth / 2 + container.scrollLeft;
    let closestEpoch = null;
    let minDistance = Infinity;

    epochs.forEach(epoch => {
        const epochCenter = epoch.offsetLeft + epoch.offsetWidth / 2;
        const distance = Math.abs(epochCenter - centerPoint);

        if (distance < minDistance) {
            minDistance = distance;
            closestEpoch = epoch;
        }
    });

    if (closestEpoch) {
        updateLinkAndTheme(closestEpoch);
    }
}

// Fonction pour mettre à jour le lien et le thème basés sur l'époque
function updateLinkAndTheme(epoch) {
    const link = document.getElementById('epoch-link');
    const categoryId = epoch.dataset.id;

    // Log pour vérifier le category_id
    console.log('Category ID:', categoryId);

    if (categoryId) {
        // Utiliser base_path pour construire correctement l'URL
        link.href = `pages/product.php?action=grid&category_id=${epoch.dataset.id}`;
    } else {
        console.error('Category ID is missing');
    }

    const body = document.body;
    body.className = '';
    body.classList.add(`theme-${epoch.dataset.name.toLowerCase().replace(/\s+/g, '-')}`);
}

// Gestionnaire pour l'événement de chargement du contenu du document
document.addEventListener('DOMContentLoaded', function() {
    const container = document.getElementById('timeline-container');
    const epochs = document.querySelectorAll('.epoch');

    const title = document.querySelector('h1');
    if (title) {
        const letters = title.innerText.split(/(?!$)/u); // Split en conservant les espaces
        title.innerHTML = letters.map((letter, index) => {
            const delay = Math.random() * 2; // Délai aléatoire entre 0 et 2 secondes
            return `<span class="title-letter" style="animation-delay: ${delay}s;">${letter === ' ' ? '&nbsp;' : letter}</span>`;
        }).join('');
    }

    epochs.forEach(epoch => {
        const imageUrl = epoch.getAttribute('data-image');
        if (imageUrl) {
            epoch.style.backgroundImage = `url(${imageUrl})`;
        }
    });

    enableDragScroll(container); // Activation du défilement par glissement
    updateCurrentEpoch(epochs, container); // Mise à jour initiale de l'époque courante
    container.addEventListener('scroll', () => updateCurrentEpoch(epochs, container)); // Ajout d'un gestionnaire de scroll pour mettre à jour l'époque

    // Calcul initial pour centrer une époque spécifique dans le conteneur au chargement
    centerEpochOnLoad(epochs, container, 'Moyen-Âge');
});

// Fonction pour centrer une époque spécifique au chargement de la page
function centerEpochOnLoad(epochs, container, epochName) {
    const targetEpoch = Array.from(epochs).find(epoch => epoch.dataset.name.includes(epochName));
    if (targetEpoch) {
        const leftOffset = targetEpoch.offsetLeft; // Position horizontale de l'époque ciblée
        const centerOffset = leftOffset - (container.offsetWidth / 2) + (targetEpoch.offsetWidth / 2); // Calcul pour centrer l'époque
        container.scrollLeft = centerOffset; // Application du défilement pour centrer
    }
}
