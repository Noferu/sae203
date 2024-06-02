document.addEventListener("DOMContentLoaded", () => {
  const bodyClass = document.body.className; // Récupère la classe du body pour déterminer le thème
  let frames; // Déclare la variable qui contiendra les chemins des icônes pour l'animation

  switch (bodyClass) {
    case "theme-néolithique":
      frames = ["🪨", "🛖", "🔥"];
      break;
    case "theme-antiquité":
      frames = ["🏛️", "🏺", "⚔️"];
      break;
    case "theme-moyen-âge":
      frames = ["🏰", "🛡️", "📜"];
      break;
    case "theme-renaissance":
      frames = ["🎨", "📚", "🏛️"];
      break;
    case "theme-époque-moderne":
      frames = ["🚲", "🖨️", "✈️"];
      break;
    case "theme-futur":
      frames = ["🚀", "🤖", "🌌"];
      break;
    case "theme-islamique":
      frames = ["🕌", "🕋", "🧭"];
      break;
    case "theme-hōken-seido":
      frames = ["🏯", "🎎", "🍣"];
      break;
    case "theme-western":
      frames = ["🏜️", "🔫", "🐎"];
      break;
    default:
      frames = ["🪨", "🏛️", "🕌", "🛡️", "🎨", "🍣", "🖨️", "🐎", "🌌"];
      break;
  }

  // Fonction pour changer le favicon
  function changeFavicon(emoji) {
    const link = document.getElementById("favicon");
    link.href = `data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 16 16%22><text y=%2214%22 font-size=%2214%22>${emoji}</text></svg>`;
  }

  // Fonction pour animer le favicon
  function animateFavicon(frames, interval) {
    let frameIndex = 0;
    setInterval(() => {
      changeFavicon(frames[frameIndex]); // Change le favicon à chaque intervalle
      frameIndex = (frameIndex + 1) % frames.length; // Passe au frame suivant, boucle au début si nécessaire
    }, interval);
  }

  animateFavicon(frames, 2000); // Lance l'animation avec les frames et un intervalle de 2000ms
});
