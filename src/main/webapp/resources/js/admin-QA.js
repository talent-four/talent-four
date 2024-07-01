document.getElementById("showCategoryBar").addEventListener("click", function() {
    var categoryBar = document.querySelector(".categoryBar");
    if (window.getComputedStyle(categoryBar).display === "none") {
        categoryBar.style.display = "block";
        categoryBar.style.height = "0";
        categoryBar.style.overflow = "hidden";
        var height = categoryBar.scrollHeight;
        categoryBar.style.transition = "height 200ms ease";
        requestAnimationFrame(function() {
            categoryBar.style.height = height + "px";
        });
    } else {
        categoryBar.style.height = categoryBar.scrollHeight + "px";
        categoryBar.style.transition = "height 200ms ease";
        requestAnimationFrame(function() {
            categoryBar.style.height = "0";
        });
        categoryBar.addEventListener("transitionend", function() {
            if (categoryBar.style.height === "0px") {
                categoryBar.style.display = "none";
                categoryBar.style.height = "";
                categoryBar.style.transition = "";
            }
        }, { once: true });
    }
});