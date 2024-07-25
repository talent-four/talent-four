// 클래스 소개 더보기 버튼
document.getElementById("d-classInfoBtn").addEventListener("click", function(){
    const classIntro = document.querySelector(".classDetail");
    classIntro.classList.toggle("classDetailShow");

    // 버튼 텍스트 변경
    if (classIntro.classList.contains("classDetailShow")) {
        this.textContent = "클래스 소개 접기";
    } else {
        this.textContent = "클래스 소개 더보기";
    }


})