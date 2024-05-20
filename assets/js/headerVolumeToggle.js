document.addEventListener('DOMContentLoaded', function() {
    const volumeControl = document.querySelector('.volume-control');

    if (volumeControl) {
        volumeControl.addEventListener('click', function(event) {
            event.preventDefault();
            volumeControl.classList.toggle('active');
        });
    }
});