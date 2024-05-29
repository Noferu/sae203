document.addEventListener('DOMContentLoaded', () => {
    const bodyClass = document.body.className; // Récupère la classe du body pour déterminer le thème
    let frames; // Déclare la variable qui contiendra les chemins des icônes pour l'animation

    switch(bodyClass) {
        case 'theme-néolithique':
            frames = [
                `${basePath}/assets/images/icons/ear_of_rice.ico`,
                `${basePath}/assets/images/icons/meat_on_bone.ico`,
                `${basePath}/assets/images/icons/fire.ico`
            ];
            break;
        case 'theme-antiquité':
            frames = [
                `${basePath}/assets/images/icons/classical_building.ico`,
                `${basePath}/assets/images/icons/amphora.ico`,
                `${basePath}/assets/images/icons/crossed_swords.ico`,
            ];
            break;
        case 'theme-moyen-âge':
            frames = [
                `${basePath}/assets/images/icons/european_castle.ico`,
                `${basePath}/assets/images/icons/shield.ico`,
                `${basePath}/assets/images/icons/scroll.ico`
            ];
            break;
        case 'theme-renaissance':
            frames = [
                `${basePath}/assets/images/icons/art.ico`,
                `${basePath}/assets/images/icons/books.ico`,
                `${basePath}/assets/images/icons/classical_building.ico`
            ];
            break;
        case 'theme-époque-moderne':
            frames = [
                `${basePath}/assets/images/icons/bike.ico`,
                `${basePath}/assets/images/icons/printer.ico`,
                `${basePath}/assets/images/icons/airplane.ico`
            ];
            break;
        case 'theme-futur':
            frames = [
                `${basePath}/assets/images/icons/robot_face.ico`,
                `${basePath}/assets/images/icons/flying_saucer.ico`,
                `${basePath}/assets/images/icons/diamond_shape_with_a_dot_inside.ico`
            ];
            break;
        default:
            frames = [
                `${basePath}/assets/images/icons/ear_of_rice.ico`,
                `${basePath}/assets/images/icons/classical_building.ico`,
                `${basePath}/assets/images/icons/european_castle.ico`,
                `${basePath}/assets/images/icons/art.ico`,
                `${basePath}/assets/images/icons/bike.ico`,
                `${basePath}/assets/images/icons/robot_face.ico`
            ];
            break;
    }

    // Fonction pour changer le favicon
    function changeFavicon(src) {
        const link = document.getElementById('favicon'); // Sélectionne l'élément du favicon par son ID
        link.href = src; // Change l'URL du favicon
    }

    // Fonction pour animer le favicon
    function animateFavicon(frames, interval) {
        let frameIndex = 0; // Initialise l'index du frame
        setInterval(() => {
            changeFavicon(frames[frameIndex]); // Change le favicon à chaque intervalle
            frameIndex = (frameIndex + 1) % frames.length; // Passe au frame suivant, boucle au début si nécessaire
        }, interval);
    }

    animateFavicon(frames, 2000); // Lance l'animation avec les frames et un intervalle de 2000ms
});
