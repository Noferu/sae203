function magnify(imgID, zoom) {
    const img = document.getElementById(imgID);
    const glass = document.querySelector(".zoom-lens");
    const bw = 3;

    glass.style.position = "absolute";
    glass.style.backgroundImage = `url('${img.src}')`;
    glass.style.backgroundRepeat = "no-repeat";
    glass.style.backgroundSize = `${img.width * zoom}px ${img.height * zoom}px`;
    glass.style.borderRadius = "50%";
    glass.style.display = "none";
    glass.style.pointerEvents = "none";

    ["mousemove", "touchmove"].forEach(event => {
        img.addEventListener(event, moveMagnifier);
    });

    img.addEventListener("mouseenter", () => {
        glass.style.display = "block";
        img.style.cursor = "none";
    });
    img.addEventListener("mouseleave", () => {
        glass.style.display = "none";
        img.style.cursor = "default";
    });

    function moveMagnifier(e) {
        e.preventDefault();

        const pos = getCursorPos(e);
        const w = glass.offsetWidth / 2;
        const h = glass.offsetHeight / 2;
        let x = pos.x;
        let y = pos.y;

        if (x > img.width - w / zoom) x = img.width - w / zoom;
        if (x < w / zoom) x = w / zoom;
        if (y > img.height - h / zoom) y = img.height - h / zoom;
        if (y < h / zoom) y = h / zoom;

        glass.style.left = `${x - w}px`;
        glass.style.top = `${y - h}px`;
        glass.style.backgroundPosition = `-${(x * zoom - w + bw)}px -${(y * zoom - h + bw)}px`;
    }

    function getCursorPos(e) {
        const a = img.getBoundingClientRect();
        const x = e.pageX - a.left - window.scrollX;
        const y = e.pageY - a.top - window.scrollY;
        return { x, y };
    }
}

magnify("myimage", 3);