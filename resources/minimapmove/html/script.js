let dragging = false;
let offsetX, offsetY;
const dragBox = document.getElementById("drag-box");

window.addEventListener("message", (event) => {
    if (event.data.action === "startDrag") {
        dragBox.style.display = "block";
        dragging = true;
    }
});

dragBox.addEventListener("mousedown", (e) => {
    if (dragging) {
        offsetX = e.clientX - dragBox.offsetLeft;
        offsetY = e.clientY - dragBox.offsetTop;
        document.addEventListener("mousemove", moveBox);
        document.addEventListener("mouseup", stopDrag);
    }
});

function moveBox(e) {
    dragBox.style.left = (e.clientX - offsetX) + "px";
    dragBox.style.top = (e.clientY - offsetY) + "px";
}

function stopDrag(e) {
    document.removeEventListener("mousemove", moveBox);
    document.removeEventListener("mouseup", stopDrag);

    dragBox.style.display = "none";

    // Convert screen position to minimap offsets (rough mapping)
    let x = (dragBox.offsetLeft / window.innerWidth) - 0.5;
    let y = ((window.innerHeight - dragBox.offsetTop) / window.innerHeight) - 1.0;

    fetch(`https://${GetParentResourceName()}/finishDrag`, {
        method: "POST",
        headers: { "Content-Type": "application/json; charset=UTF-8" },
        body: JSON.stringify({ x: x, y: y })
    });

    dragging = false;
}
