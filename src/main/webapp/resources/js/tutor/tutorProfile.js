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
/* 전화번호 수정하기 */ 

const telInfo = document.getElementById("tel-info")
const telInput = document.getElementById("tel-input")

function showWarning() {
    telInfo.style.display = "block";
}

function hideWarning() {
    telInfo.style.display = "none";
}
/*------------------------------------------------------------------------------------------------ */
/* 튜터소개 수정하기 */ 
const introduce = document.getElementById("introduce")
const countArea = document.getElementById("countArea")
const Infocount = document.getElementById("Infocount")

function showCount() {
    document.getElementById('countArea').style.display = 'block';
    updateCount();  
}

function hideCount() {
    document.getElementById('countArea').style.display = 'none';
}

function updateCount() {
    var textarea = document.getElementById('introduce');
    var count = textarea.value.length;
    document.getElementById('Infocount').innerText = count;
}

document.addEventListener('DOMContentLoaded', (event) => {
    updateCount();
});

introduce.addEventListener("input",function(){
    const length = introduce.value.length;
    Infocount.innerText = length;

    if(length<250){
        Infocount.style.color = 'black'
    } else if(length<299){
        Infocount.style.color = 'orange'
    } else{
        Infocount.style.color = 'red'
    }

})

/* -----------------------------------------------------------------------------------------------*/
/* 전체 수정하기 */ 

function updateValidate(){

    const regExp1 = /^([a-z]|[0-9]|[가-힣]){2,10}$/;
    // const regExp1 = /^([a-zA-Z0-9가-힣]){2,10}$/;
    const regExp2 = /^[0-9]{10,11}$/;
    // const regExp2 = /^0(1[079]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;


    if(nickname.value.trim().length == 0){
        return printAlert(nickname, "닉네임을 입력해 주세요")
    } else if(!regExp1.test(nickname.value)){
        return printAlert(nickname, "닉네임은 영어/숫자/한글 2~10글자 사이로 작성해 주세요.")
    }

    if(tel.value.trim().length == 0){
        return printAlert(tel, "전화번호를 입력해 주세요(- 제외)");
    } else if(!regExp2.test(tel.value)){
        return printAlert(tel, "전화번호 형식이 올바르지 않습니다.");
        
    }
    return true;

}

function printAlert(el, message){ // 매개변수 el은 요소 
    alert(message);
    el.focus();
    return false
}

/*------------------------------------------------------------------------------------ */
/*취소하기 버튼 누르기 */
function resetForm() {
    location.reload();
}