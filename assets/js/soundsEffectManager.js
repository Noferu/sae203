document.addEventListener('DOMContentLoaded', function() {

    const volumeControl = document.querySelector('.volume-control');
    const audio = document.getElementById('myAudio');

    function playAudio() {
        audio.play().then(() => {
            document.body.removeEventListener('click', playAudio);
        })
    }
    if (volumeControl) {
        volumeControl.addEventListener('click', function(event) {
            event.preventDefault();
            volumeControl.classList.toggle('active');

            if (audio.muted) {
                audio.muted = false;
            } else {
                audio.muted = true;
            }
        });
    }
    document.body.addEventListener('click', playAudio);
});
