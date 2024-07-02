// 슬라이드 바
$(function () {
    $(".slideContentWrapper").each(function () {
      let $wrapper = $(this);
      let $contentSlider = $wrapper.find(".contentBoxs");
      let $leftButton = $wrapper.find("#leftButton");
      let $rightButton = $wrapper.find("#rightButton");
      let currentIndex = 0;
      // let slideWidth = $wrapper.width();
      let slideWidth = 1280;
  
      function slide() {
        let translateValue = -slideWidth * currentIndex + "px";
        $contentSlider.css("transform", `translateX(${translateValue})`);
      }
  
      $leftButton.on("click", function () {
        if (currentIndex > 0) {
          currentIndex--;
          slide();
        }
      });
  
      $rightButton.on("click", function () {
        let maxIndex = Math.ceil($contentSlider[0].scrollWidth / slideWidth) - 1;
        if (currentIndex < maxIndex) {
          currentIndex++;
          slide();
        }
      });
    });
});