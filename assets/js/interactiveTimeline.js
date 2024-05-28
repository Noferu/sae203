function enableDragScroll(element) {
  let isDown = false;
  let startX;
  let scrollLeft;

  element.addEventListener("mousedown", (e) => {
    isDown = true;
    startX = e.clientX;
    scrollLeft = element.scrollLeft;
    element.style.cursor = "grabbing";
    e.preventDefault();
  });

  document.addEventListener("mouseup", () => {
    if (!isDown) return;
    isDown = false;
    element.style.cursor = "grab";
  });

  document.addEventListener("mousemove", (e) => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.clientX;
    const walk = x - startX;
    element.scrollLeft = scrollLeft - walk;
  });
}

function updateCurrentEpoch(epochs, container) {
  const centerPoint = container.offsetWidth / 2 + container.scrollLeft;
  let closestEpoch = null;
  let minDistance = Infinity;

  epochs.forEach((epoch) => {
    const epochCenter = epoch.offsetLeft + epoch.offsetWidth / 2;
    const distance = Math.abs(epochCenter - centerPoint);

    if (distance < minDistance) {
      minDistance = distance;
      closestEpoch = epoch;
    }
  });

  if (closestEpoch) {
    epochs.forEach((epoch) => {
      epoch.classList.remove("center", "adjacent");
    });

    closestEpoch.classList.add("center");

    const closestEpochIndex = Array.from(epochs).indexOf(closestEpoch);
    if (closestEpochIndex > 0) {
      epochs[closestEpochIndex - 1].classList.add("adjacent");
    }
    if (closestEpochIndex < epochs.length - 1) {
      epochs[closestEpochIndex + 1].classList.add("adjacent");
    }

    updateLinkAndTheme(closestEpoch);
  }
}

function updateLinkAndTheme(epoch) {
  const link = document.getElementById("epoch-link");
  const categoryId = epoch.dataset.id;

  if (categoryId) {
    link.href = `pages/product?action=grid&category_id=${epoch.dataset.id}`;
  }

  const body = document.body;
  const newClass = `theme-${epoch.dataset.name.toLowerCase().replace(/\s+/g, "-")}`;
  if (!body.classList.contains(newClass)) {
    body.className = "";
    body.classList.add(newClass);
    fadeOutAudio(newClass);
  }
}

function fadeOutAudio(newClass) {
  const audio = document.getElementById('myAudio');
  const fadeOutInterval = setInterval(() => {
    if (audio.volume > 0.1) {
      audio.volume -= 0.1;
    } else {
      clearInterval(fadeOutInterval);
      audio.volume = 0;
      updateAudioSource(newClass);
    }
  }, 100);
}

function updateAudioSource(newClass) {
  const audio = document.getElementById('myAudio');
  const audioSource = document.getElementById('audioSource');
  const musicLinks = {
    "theme-néolithique": "https://dl.dropboxusercontent.com/scl/fi/yqo7f1iir57xxr550sk7j/stone_world.mp3?rlkey=00m1p3ngrbahfcqdm8f91yn89&st=9qircazs",
    "theme-antiquité": "https://dl.dropboxusercontent.com/scl/fi/cttsenqi2ia5dg8p3tao7/ac_theflight.mp3?rlkey=9wsgb7ah6gxs6jytvvnjss6ph&st=08xlj5gy",
    "theme-futur": "https://dl.dropboxusercontent.com/scl/fi/dvxrmbfymb7lnw56c3ukk/cyberpunk_spoiler.mp3?rlkey=l0tt2knbzj3t4od6f867xtlz9&st=2j8xqkxd",
    "theme-moyen-âge": "https://dl.dropboxusercontent.com/scl/fi/t7xc6he771v59gmt93n0w/medieval_tavern.mp3?rlkey=exbc97mr0a2rwf32hlrwgaw0b&st=bl13shb3",
    "theme-époque-moderne": "https://dl.dropboxusercontent.com/scl/fi/kdp7d9y8xsa40tgrxckva/howls_movingcastle.mp3?rlkey=dc461wk883n4yrhk0qb9yhq1l&st=kmelccqp",
    "theme-renaissance": "https://dl.dropboxusercontent.com/scl/fi/sulqbspaeerwtvz7ulgfv/kingdom_dance.mp3?rlkey=ftq10tuw4c0gyjxjqkydezrgj&st=uhke63bx",
  };

  if (musicLinks[newClass]) {
    audioSource.src = musicLinks[newClass];
    audio.load();
    audio.volume = 1;
    audio.play();
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const container = document.getElementById("timeline-container");
  const epochs = document.querySelectorAll(".epoch");

  epochs.forEach((epoch) => {
    const imageUrl = epoch.getAttribute("data-image");
    if (imageUrl) {
      epoch.style.backgroundImage = `url(${imageUrl})`;
    }
  });

  enableDragScroll(container);
  updateCurrentEpoch(epochs, container);
  container.addEventListener("scroll", () => updateCurrentEpoch(epochs, container));

  centerEpochOnLoad(epochs, container, "Moyen-Âge");
});

function centerEpochOnLoad(epochs, container, epochName) {
  const targetEpoch = Array.from(epochs).find((epoch) =>
    epoch.dataset.name.includes(epochName)
  );
  if (targetEpoch) {
    const leftOffset = targetEpoch.offsetLeft;
    const centerOffset =
      leftOffset - container.offsetWidth / 2 + targetEpoch.offsetWidth / 2;
    container.scrollLeft = centerOffset;
  }
}
