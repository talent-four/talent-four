const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
/*------------------------------------------------------------------------------------*/

secondCategory.classList.add('a-style');

/* 공통 끝 */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/* 전화번호 시작 */




/* 전화번호 끝 */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
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
