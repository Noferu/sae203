document.addEventListener('DOMContentLoaded', () => {
    const bodyClass = document.body.className;
    let frames;

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
                `${basePath}/assets/images/icons/amphora.ico`,
                `${basePath}/assets/images/icons/crossed_swords.ico`,
                `${basePath}/assets/images/icons/classical_building.ico`
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
                `${basePath}/assets/images/icons/amphora.ico`,
                `${basePath}/assets/images/icons/european_castle.ico`,
                `${basePath}/assets/images/icons/art.ico`,
                `${basePath}/assets/images/icons/bike.ico`,
                `${basePath}/assets/images/icons/robot_face.ico`
            ];
            break;
    }

    function changeFavicon(src) {
        const link = document.getElementById('favicon');
        link.href = src;
    }

    function animateFavicon(frames, interval) {
        let frameIndex = 0;
        setInterval(() => {
            changeFavicon(frames[frameIndex]);
            frameIndex = (frameIndex + 1) % frames.length;
        }, interval);
    }

    animateFavicon(frames, 1000); // Change every 1000 ms (1 second)
});
