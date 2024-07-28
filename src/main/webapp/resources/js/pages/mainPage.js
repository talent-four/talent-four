// 무한 슬라이드
(function () {
  var $slides = $("#categoryBar").find("li");
  const $contentSlider = $(".infinitySlider > ul");
  const slideCount = $slides.length;
  let currentIndex = 0;
  const slideWidth = 1280;
  setInterval(showNextSlide, 3000);

  function showNextSlide() {
    var nextIndex = (currentIndex + 1) % slideCount;

    let translateValue = -slideWidth * currentIndex + "px";
    $contentSlider.css("transform", `translateX(${translateValue})`);
    currentIndex = nextIndex;
  }
})();

// 클래스 화면 바꾸는 창
(function () {
  const contentBoxes = document.querySelectorAll(".gridFadecontentBox");
  const fadeLeft = document.getElementById("fadeLeft");
  const fadeRight = document.getElementById("fadeRight");
  const currentPage = document.getElementById("currentPage");
  const totalPages = contentBoxes.length;
  let currentIndex = 0;

  function updateContent() {
    contentBoxes.forEach((box, index) => {
      box.classList.toggle("active", index === currentIndex);
    });
    currentPage.textContent = currentIndex + 1;
  }

  fadeLeft.addEventListener("click", function () {
    currentIndex = (currentIndex - 1 + totalPages) % totalPages;
    updateContent();
  });

  fadeRight.addEventListener("click", function () {
    currentIndex = (currentIndex + 1) % totalPages;
    updateContent();
  });

  document.getElementById("pages").textContent = totalPages;
  updateContent();
})();
