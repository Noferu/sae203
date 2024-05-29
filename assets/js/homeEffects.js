document.addEventListener("DOMContentLoaded", function () {
  let audio = document.getElementById("myAudio"); // Sélectionne l'élément audio par son ID
  audio.volume = 0; // Initialise le volume de l'audio à 0
  audio.pause(); // Met l'audio en pause

  // Attend 500ms avant de commencer la lecture et l'augmentation progressive du volume
  setTimeout(() => {
    audio.play(); // Démarre la lecture de l'audio
    let vol = 0,
      fadeIn = setInterval(() => {
        if (vol < 1) {
          audio.volume = vol += 0.1; // Augmente progressivement le volume par incréments de 0.1
        } else {
          clearInterval(fadeIn); // Arrête l'intervalle lorsque le volume atteint 1
        }
      }, 100); // Intervalle de 100ms pour chaque incrément de volume
  }, 500); // Délai de 500ms avant de démarrer la lecture de l'audio
});
