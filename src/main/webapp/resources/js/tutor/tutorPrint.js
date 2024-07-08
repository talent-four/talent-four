const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
const mainSection = document.querySelectorAll('.mainsectionsP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
const sixthCategory = sideCategory[5];
const seventhCategory = sideCategory[6];
/*------------------------------------------------------------------------------------*/
const dashboard = mainSection[0]; /* 각 메인 영역들 */
const profileP = mainSection[1];
const classesP = mainSection[2];
const classsellP = mainSection[3];
const reviewP = mainSection[4];
const calculateP = mainSection[5];
const messageP = mainSection[6];

/*------------------------------------------------------------------------------------*/ 
function restyle(){
    for(let i =0; i<sideCategory.length; i++){
        sideCategory[i].classList.remove('a-style');
    }
    for(let i =0; i<mainSection.length; i++){
        mainSection[i].style.display='none';
    }
}

/* 사이드 카테고리 선택 JS */

firstCategory.addEventListener('click', function() {
    restyle()
    dashboard.style.display='block';
    this.classList.add('a-style');
});

secondCategory.addEventListener('click', function() {
    restyle()
    profileP.style.display='block';
    this.classList.add('a-style');
});

thirdCategory.addEventListener('click', function() {
    restyle()
    classesP.style.display='block';
    this.classList.add('a-style');
});

fourthCategory.addEventListener('click', function() {
    restyle()
    classsellP.style.display='block';
    this.classList.add('a-style');
});

fifthCategory.addEventListener('click', function() {
    restyle()
    reviewP.style.display='block';
    this.classList.add('a-style');
});

sixthCategory.addEventListener('click', function() {
    restyle()
    calculateP.style.display='block';
    this.classList.add('a-style');
});

seventhCategory.addEventListener('click', function() {
    restyle()
    messageP.style.display='block';
    this.classList.add('a-style');
});

/* 공통 끝 */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
/*------------------------------------------------------------------------------------------------ */
