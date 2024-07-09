// 무한 슬라이드
$(function(){
    var $slides = $("#categoryBar").find('li');
    const $contentSlider = $(".infinitySlider > ul");
    const slideCount = $slides.length;
    console.log(slideCount);
    let currentIndex = 0;
    const slideWidth = 1280;
    setInterval(showNextSlide, 2000);

    function showNextSlide() {
        var nextIndex = (currentIndex + 1) % slideCount;
  
        let translateValue = -slideWidth * currentIndex + "px";
        $contentSlider.css("transform", `translateX(${translateValue})`);
        currentIndex = nextIndex;
      }
  })
  
  


