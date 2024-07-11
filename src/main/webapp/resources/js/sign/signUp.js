// 캡차

const canvas = document.getElementById('captchaCanvas');
const ctx = canvas.getContext('2d');
const refreshButton = document.getElementById('refreshCaptcha');
const checkButton = document.getElementById('checkCaptcha');
const captchaInput = document.getElementById('captchaInput');
const resultDiv = document.getElementById('result');
let captchaText = '';

function generateCaptcha() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const length = 6;
    let captcha = '';
    for (let i = 0; i < length; i++) {
        captcha += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return captcha;
}

function drawCaptcha() {
    captchaText = generateCaptcha();
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.font = '30px Arial';
    ctx.strokeText(captchaText, 50, 35);
}

refreshButton.addEventListener('click', () => {
    drawCaptcha();
});

checkButton.addEventListener('click', () => {
   
    const userInput = captchaInput.value;
    if (userInput === captchaText) {
        resultDiv.textContent = '보안문자가 일치합니다!';
        resultDiv.style.color='green';
        resultDiv.style.fontSize='10px';
  
    } else {
        resultDiv.textContent = '보안문자가 일치하지 않습니다. 다시 시도하세요.';
        resultDiv.style.color='red';
        resultDiv.style.fontSize='10px';
       
    }


});

captchaInput.addEventListener("keyup",function(){
    if(this.value.length==0){
        resultDiv.innerText="";
    }
})

drawCaptcha();


// id 유효성검사
document.getElementById("inputId").addEventListener("keyup",function(){
    const idCkText = document.getElementById("idCkText");
    const regExp =/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,15}$/;

    if(this.value.trim().length==0){
        idCkText.innerText ="영문+숫자 5~15자로 입력";
        idCkText.classList.remove("sign-green"); 
        idCkText.classList.remove("sign-red"); 
        return;
    }

    if(regExp.test(this.value)){
        idCkText.innerText="유효한 id 입니다.";
        idCkText.classList.add("sign-green");
        idCkText.classList.remove("sign-red"); 
    }else{
        idCkText.innerText="형식을 확인해주세요.영문+숫자 5~15자로 입력!";
        idCkText.classList.add("sign-red");

    }



});

//password 유효성검사
const pwCkText = document.getElementById("pwCkText");

document.getElementById("inputPw").addEventListener("keyup",function(){

   
    const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!~_])[A-Za-z\d!~_]{5,15}$/;

    if(this.value.trim().length==0){
        pwCkText.innerText="영문+숫자+특수문자(!,_,~)를  포함한 5~15자";
        pwCkText.classList.remove("sign-green"); 
        pwCkText.classList.remove("sign-red"); 
        return;
    }

    if(regExp.test(this.value)){
        pwCkText.innerText="유효한 비밀번호 입니다.";
        pwCkText.classList.add("sign-green");
        pwCkText.classList.remove("sign-red"); 
    }else{
        pwCkText.innerText="형식을 확인해주세요.영문+숫자+특수문자(!,_,~)를  포함한 5~15자";
        pwCkText.classList.add("sign-red");

    }

})

//password 일치 검사
const inputPw = document.getElementById("inputPw");
const inputPw2 = document.getElementById("inputPw2")
const pw2CkText = document.getElementById("pw2CkText")
inputPw2.addEventListener("keyup",function(){
    if(inputPw.value == inputPw2.value){
        pw2CkText.innerText="비밀번호 일치";
        pw2CkText.classList.add("sign-green");
        pw2CkText.classList.remove("sign-red");
    }   else{
        pw2CkText.innerText="비밀번호 불일치";
        pw2CkText.classList.add("sign-red");
        pw2CkText.classList.remove("sign-green");
    }

    if(this.value.length==0){
        pw2CkText.innerText="";
    }
})

// eamil 형식 검사
document.getElementById("inputEmail").addEventListener("keyup",function(){
    const emailCkText = document.getElementById("emailCkText");
    const regExp =/\w+@(\w+\.)+\w+/;

    if(this.value.trim().length==0){
        emailCkText.innerText ="";
        emailCkText.classList.remove("sign-green"); 
        emailCkText.classList.remove("sign-red"); 
        return;
    }

    if(regExp.test(this.value)){
        emailCkText.innerText="유효한 이메일 입니다.";
        emailCkText.classList.add("sign-green");
        emailCkText.classList.remove("sign-red"); 

    }else{
        emailCkText.innerText="이메일을 확인하세요.(aa@aa.com형식)";
        emailCkText.classList.add("sign-red");

    }

});

//닉네임 유효성 검사
document.getElementById("nickName").addEventListener("keyup",function(){
    const nickNameCkText = document.getElementById("nickNameCkText");
    const regExpNick = /^[가-힣]{2,8}$/;

    if(this.value.trim().length==0){
        nickNameCkText.innerText ="";
        nickNameCkText.classList.remove("sign-green"); 
        nickNameCkText.classList.remove("sign-red"); 
        return;
    }

    if(regExpNick.test(this.value)){
        nickNameCkText.innerText="유효한 닉네임 입니다.";
        nickNameCkText.classList.add("sign-green");
        nickNameCkText.classList.remove("sign-red"); 

    }else{
        nickNameCkText.innerText="닉네임을 확인하세요.";
        nickNameCkText.classList.add("sign-red");
    }
})

