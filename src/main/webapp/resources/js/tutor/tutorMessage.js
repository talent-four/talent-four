// 카테고리 바
$("#showCategoryBar").on("click", function(){
    if ($(".categoryBar").css("display") == "none"){
        $(".categoryBar").slideDown(200);
    } else {
        $(".categoryBar").slideUp(200);
    }
})

const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
const sixthCategory = sideCategory[5];
const seventhCategory = sideCategory[6];
/*------------------------------------------------------------------------------------*/
seventhCategory.classList.add('a-style');
/* 공통 끝 */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
