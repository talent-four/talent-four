// 클래스 소개 더보기 버튼
document.getElementById("d-classInfoBtn").addEventListener("click", function(){
    const classIntro = document.querySelector(".classDetail");
    classIntro.classList.toggle("classDetailShow");
})