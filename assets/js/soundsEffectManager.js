document.addEventListener('DOMContentLoaded', function() {
    const volumeControl = document.querySelector('.volume-control');
    const audio = document.getElementById('myAudio');
    
    function playAudio() {
        audio.play().then(() => {
            document.body.removeEventListener('mousemove', playAudio);
            document.body.removeEventListener('touchstart', playAudio);
        }).catch(error => {
            console.log('Erreur de lecture audio:', error);
        });
    }
    
    if (volumeControl) {
        volumeControl.addEventListener('click', function(event) {
            event.preventDefault();
            volumeControl.classList.toggle('active');
        });
    }
    
    document.body.addEventListener('mousemove', playAudio);
    document.body.addEventListener('touchstart', playAudio);
});