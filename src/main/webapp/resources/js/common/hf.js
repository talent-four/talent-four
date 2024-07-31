// 로그인시, 메뉴 드롭 박스
const headerBoxBtn = document.getElementById("headerBoxBtn");
const headerBox = document.getElementById("headerBox");

if(headerBoxBtn != null){
    headerBoxBtn.addEventListener("click", function(){
        if (headerBox.style.display === "flex") {
            headerBox.style.display = "none";
            headerBoxBtn.style.backgroundColor = "";
        } else {
            headerBoxBtn.style.backgroundColor = "#219EBC";
            headerBox.style.display = "flex";
        }
    })
}