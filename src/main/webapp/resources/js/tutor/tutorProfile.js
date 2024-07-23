const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
const sixthCategory = sideCategory[5];
/*------------------------------------------------------------------------------------*/

secondCategory.classList.add('a-style');

/* 공통 끝 */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/* 낙네임 시작 */ /* 프로필 시작 */
const NchangeBtn = document.getElementById("Nchange-btnP")
const NhideArea = document.getElementById("Nhide-areaP")
const changeArea = document.getElementById("change-areaP")
const Ncheck = document.getElementById("NcheckP")
const Ncancel = document.getElementById("NcancelP")
const Nchangeinput = document.getElementById("Nchange-inputP")
const Nchangecount = document.getElementById("Nchange-countP")

NchangeBtn.addEventListener("click",function(){
    // changeArea.style.display ='none'
    NhideArea.style.display ='block'
    Nchangeinput.value = NP.innerText;
})

Ncancel.addEventListener("click",function(){
    // changeArea.style.display ='block'
    NhideArea.style.display ='none'
    Nchangeinput.value =""
})

Ncheck.addEventListener("click",function(){
    // changeArea.style.display ='block'
    NhideArea.style.display ='none'
    Nchangeinput.value =""
})

Nchangeinput.addEventListener("input",function(){
    Nchangecount.innerText = Nchangeinput.value.length
    if(Nchangeinput.value.length >= 12){
        Nchangecount.innerText ='12';
        Nchangecount.style.color ='red'
    }
    if(Nchangeinput.value.length == 12){
        Nchangecount.style.color ='red'
    } else{
        Nchangecount.style.color ='black'
    }
})

/* 낙네임 끝 */ 
/* -----------------------------------------------------------------------------------------------*/
/* 튜터 소개 시작 */ 

const changeIntro = document.getElementById("change-introduce")
const checkIntro = document.getElementById("check-introduce")
const cancelIntro = document.getElementById("cancel-introduce")
const introduce = document.getElementById("introduce")
const hiddenArea2 = document.getElementById("hiddenArea2")

changeIntro.addEventListener("click",function(){
    this.style.display = 'none';
    hiddenArea2.style.display = 'block';
    introduce.focus();
})

checkIntro.addEventListener("click",function(){
    hiddenArea2.style.display = 'none';

})

Infotextarea.addEventListener("keyup",function(){
    const length = Infotextarea.value.length;
    Infocount.innerText = length;

    if(length<250){
        Infocount.style.color = 'black'
    } else if(length<299){
        Infocount.style.color = 'orange'
    } else{
        Infocount.style.color = 'red'
    }

})

/* 튜터 소개 끝 */ 
/* -----------------------------------------------------------------------------------------------*/
