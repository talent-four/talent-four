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

const tel = document.getElementById('tel-input')
const accountName = document.getElementById('accountName')
const accountNumber = document.getElementById('accountNumber')

function updateValidate(){

    // const regExp2 = /^[0-9]{10,11}$/;
    const regExp1 = /^0(1[079]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호
    const regExp2 = /^[가-힣]{2,16}$/; // 예금주명
    const regExp3 = /^(?:\d{1,4}-?){0,3}\d{6,10}$/; // 계좌번호
    const regExp4 = /^.{10,300}$/; // 튜터 소개

    if(tel.value.trim().length == 0){
        return printAlert(tel, "전화번호를 입력해 주세요(- 제외)");
    } else if(!regExp1.test(tel.value)){
        return printAlert(tel, "전화번호 형식이 올바르지 않습니다.");
    }

    if(accountName.value.trim().length == 0){
        return printAlert(accountName, "예금주명을 입력해주세요");
    } else if(!regExp2.test(accountName.value)){
        return printAlert(accountName, "예금주명을 다시한번 확인해주세요.");
    }

    if(accountNumber.value.trim().length == 0){
        return printAlert(accountNumber, "계좌번호를 입력해주세요");
    } else if(!regExp3.test(accountNumber.value)){
        return printAlert(accountNumber, "계좌번호를 다시한번 확인해주세요.");
    }

    if(introduce.value.trim().length == 0){
        return printAlert(introduce, "튜터 소개를 입력해주세요");
    } else if(!regExp4.test(introduce.value)){
        return printAlert(introduce, "튜터 소개글은 10글자 이상 작성해주세요.");
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