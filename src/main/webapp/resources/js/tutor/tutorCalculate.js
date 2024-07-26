const sideCategory = document.querySelectorAll('.activeP'); /* 사이드 카테고리 영역 모음 */
/* ---------------------------------------------------------------------------------- */
const firstCategory = sideCategory[0]; /* 카테고리 영역 첫 번째 */
const secondCategory = sideCategory[1];
const thirdCategory = sideCategory[2];
const fourthCategory = sideCategory[3];
const fifthCategory = sideCategory[4];
/*------------------------------------------------------------------------------------*/
fifthCategory.classList.add('a-style');
/*-******************************************************************************/ 
/*-******************************************************************************/ 
/* 정산하기 시작 */

const calbtn = document.getElementById("calculate-btnP")

calbtn.addEventListener("click",function(){

    $.ajax({

        url : "calculate?cp=2",
        type : "POST",
        dataType : "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환

        success : function(){
            console.log("제발 되라")

            const calArea = document.getElementById("cal-all-rows"); // ul 태그
            calArea.innerHTML="";

        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }

    })



})


/* 정산요청 버튼 까지는 끝 */
/*  --------------------------------------------------------------------------------------------- */
/* 정산 리스트 영역 */
const moneyList = document.getElementsByName("money")
const titlecheck = document.getElementById("title-checkP")

titlecheck.addEventListener("click",function(){
    for(let i = 0; i<moneyList.length; i++){
        moneyList[i].checked = titlecheck.checked;
    }
})

this.addEventListener("click",function(e){
    for(let i=0; i<moneyList.length; i++){

        if(moneyList[i] == e.target){ 
            if(titlecheck.checked && !moneyList[i].checked){
                titlecheck.checked = false
            }

            let flag = true; 
            for(let j=0; j<moneyList.length; j++){ 
                if(!moneyList[j].checked){ 
                    flag = false
                }
            }
            if(!titlecheck.checked && flag){
                titlecheck.checked = true;
            }
        }
    }
})

//--------------------------------------------------------------------------------
// 정산 타입 변경 js
document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('.status-link');
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const currentCp = urlParams.get('cp');

    if (currentCp) {
        document.querySelectorAll('.status-link').forEach(link => {
            link.parentElement.classList.remove('choiced');
            if (link.dataset.id === currentCp) {
                link.parentElement.classList.add('choiced');
            }
        });
    }

    links.forEach(link => {
        link.addEventListener('click', function() {
            links.forEach(l => {
                l.parentElement.classList.remove('choiced');
            });
            link.parentElement.classList.add('choiced');
        });
    });
});

