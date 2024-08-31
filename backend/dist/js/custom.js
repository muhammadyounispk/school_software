function showImage(imageName) {
    const hoveredImage = document.getElementById("hoveredImage");
    hoveredImage.src = imageName;
    hoveredImage.style.display = "block";
}

function hideImage() {
    const hoveredImage = document.getElementById("hoveredImage");
    hoveredImage.style.display = "none";
}