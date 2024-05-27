document.addEventListener('DOMContentLoaded', function() {
    const volumeControl = document.querySelector('.volume-control');
    const music = document.getElementById("background-music");

    if (volumeControl) {
        volumeControl.addEventListener('click', function(event) {
            event.preventDefault();
            volumeControl.classList.toggle('active');
            if (music.paused) {
                music.play();
            } else {
                music.pause();
            }
        });
    }
});
