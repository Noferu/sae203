document.addEventListener('DOMContentLoaded', function() {
    const volumeControl = document.querySelector('.volume-control'); // Sélectionne l'élément de contrôle du volume
    const audio = document.getElementById('myAudio'); // Sélectionne l'élément audio par son ID

    // Fonction pour jouer l'audio
    function playAudio() {
        audio.play().then(() => {
            document.body.removeEventListener('click', playAudio); // Supprime l'événement après la première lecture
        }).catch(error => {
            console.error("Error playing audio:", error); // Gère les erreurs de lecture
        });
    }

    // Vérifie si l'élément de contrôle du volume existe
    if (volumeControl) {
        volumeControl.addEventListener('click', function(event) {
            event.preventDefault(); // Empêche le comportement par défaut du clic
            volumeControl.classList.toggle('active'); // Bascule la classe 'active' pour l'élément de contrôle du volume

            // Bascule le mode muet de l'audio
            audio.muted = !audio.muted;
        });
    }

    // Ajoute un événement pour jouer l'audio au premier clic sur le body
    document.body.addEventListener('click', playAudio);
});