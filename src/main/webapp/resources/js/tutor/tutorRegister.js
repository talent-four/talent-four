// 소개 글자수 세기
const inputIntroduce = document.getElementById("inputIntroduce")
const inputIntroduceCount = document.getElementById("inputIntroduceCount")

inputIntroduce.addEventListener("input",function(){
    inputIntroduceCount.innerText = inputIntroduce.value.length
    if(inputIntroduce.value.length >= 300){
        inputIntroduceCount.innerText ='300';
        inputIntroduceCount.style.color ='red'
    }
    if(inputIntroduce.value.length == 300){
        inputIntroduceCount.style.color ='red'
    } else{
        inputIntroduceCount.style.color ='black'
    }
})



const tel1 = document.getElementById('input-telP')
const accountName1 = document.getElementById('accountName1')
const accountNumber1 = document.getElementById('account1')
const university = document.getElementsByClassName('.university')

console.log(university)
function updateValidate1(){

    const regExp1 = /^[0-9]{10,11}$/;
    // const regExp1 = /^0(1[079]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/; // 전화번호
    const regExp2 = /^[가-힣]{2,16}$/; // 예금주명
    const regExp3 = /^(?:\d{1,4}-?){0,3}\d{6,10}$/; // 계좌번호
    const regExp4 = /^.{10,300}$/; // 튜터 소개

    if(tel1.value.trim().length == 0){
        return printAlert(tel1, "전화번호를 입력해 주세요(- 제외)");
    } else if(!regExp1.test(tel1.value)){
        return printAlert(tel1, "전화번호 형식이 올바르지 않습니다.");
    }

    if(inputIntroduce.value.trim().length == 0){
        return printAlert(inputIntroduce, "튜터 소개를 입력해주세요");
    } 

    if(accountName1.value.trim().length == 0){
        return printAlert(accountName1, "예금주명을 입력해주세요");
    } else if(!regExp2.test(accountName1.value)){
        return printAlert(accountName1, "예금주명을 다시한번 확인해주세요.");
    }

    if(accountNumber1.value.trim().length == 0){
        return printAlert(accountNumber1, "계좌번호를 입력해주세요");
    } else if(!regExp3.test(accountNumber1.value)){
        return printAlert(accountNumber1, "계좌번호를 다시한번 확인해주세요.");
    }

    if(university.value.trim().length == 0){
        return printAlert(university, "학력을 입력해주세요");
    } else if(!regExp4.test(university.value)){
        return printAlert(university, "학력정보 다시한번 확인해주세요.");
    }


    return true;

}

function printAlert(el, message){ // 매개변수 el은 요소 
    alert(message);
    el.focus();
    return false
}