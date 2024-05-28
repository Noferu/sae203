document.addEventListener("DOMContentLoaded", function () {
  let audio = document.getElementById("myAudio");
  audio.volume = 0;
  audio.pause();
  setTimeout(() => {
    audio.play();
    let vol = 0,
      fadeIn = setInterval(() => {
        if (vol < 1) audio.volume = vol += 0.1;
        else clearInterval(fadeIn);
      }, 100);
  }, 500);

  const button = document.getElementById("epoch-link");
  const hoverSound = document.getElementById("hoverSound");

  button.addEventListener("mouseenter", function () {
    hoverSound.muted = false;
    setTimeout(hoverSound.play(), 150);
  });

  button.addEventListener("mouseleave", function () {
    hoverSound.pause();
    hoverSound.currentTime = 0;
  });

});
