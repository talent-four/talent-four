// 캡차

const canvas = document.getElementById('captchaCanvas');
const ctx = canvas.getContext('2d');
const refreshButton = document.getElementById('refreshCaptcha');
const checkButton = document.getElementById('checkCaptcha');
const captchaInput = document.getElementById('captchaInput');
const resultDiv = document.getElementById('result');
let captchaText = '';
let verifyCode;
let isEmailChecked = false;
let isNicknameChecked = false;
let isCaptchaChecked = false;

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
        resultDiv.style.color = 'green';
        resultDiv.style.fontSize = '10px';
        let value = document.querySelector("#captchaInput").value;
        document.querySelector("#captchaBox").innerHTML="";
        document.querySelector("#captchaBox").insertAdjacentHTML("afterbegin", 

            `<input type="text" id="captchaInput" placeholder="보안문자 입력" value=${value} readonly/>
            <button type="button" class="Confirmbtn" id="checkCaptcha">확인</button>`

        )


        isCaptchaChecked = true;

    } else {
        resultDiv.textContent = '보안문자가 일치하지 않습니다. 다시 입력해주세요.';
        resultDiv.style.color = 'red';
        resultDiv.style.fontSize = '10px';

    }


});

captchaInput.addEventListener("keyup", function () {
    if (this.value.length == 0) {
        resultDiv.innerText = "";
    }
})

drawCaptcha();


// id 유효성검사
document.getElementById("inputId").addEventListener("keyup", function () {
    const idCkText = document.getElementById("idCkText");
    const regExp = /^[가-힣0-9]{2,8}$/;

    if (this.value.trim().length == 0) {
        idCkText.innerText = "한글 숫자 2-8글자 입력";
        idCkText.classList.remove("sign-green");
        idCkText.classList.remove("sign-red");
        return;
    }

    if (regExp.test(this.value)) {
        idCkText.innerText = "유효한 닉네임 입니다.";
        idCkText.classList.add("sign-green");
        idCkText.classList.remove("sign-red");
    } else {
        idCkText.innerText = "한글 숫자 2-8글자 입력";
        idCkText.classList.add("sign-red");

    }



});

//password 유효성검사
const pwCkText = document.getElementById("pwCkText");

document.getElementById("inputPw").addEventListener("keyup", function () {


    const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!~_])[A-Za-z\d!~_]{5,15}$/;

    if (this.value.trim().length == 0) {
        pwCkText.innerText = "영문+숫자+특수문자(!,_,~)를  포함한 5~15자";
        pwCkText.classList.remove("sign-green");
        pwCkText.classList.remove("sign-red");
        return;
    }

    if (regExp.test(this.value)) {
        pwCkText.innerText = "유효한 비밀번호 입니다.";
        pwCkText.classList.add("sign-green");
        pwCkText.classList.remove("sign-red");
    } else {
        pwCkText.innerText = "형식을 확인해주세요.영문+숫자+특수문자(!,_,~)를  포함한 5~15자";
        pwCkText.classList.add("sign-red");

    }

})

//password 일치 검사
const inputPw = document.getElementById("inputPw");
const inputPw2 = document.getElementById("inputPw2")
const pw2CkText = document.getElementById("pw2CkText")
inputPw2.addEventListener("keyup", function () {
    if (inputPw.value == inputPw2.value) {
        pw2CkText.innerText = "비밀번호 일치";
        pw2CkText.classList.add("sign-green");
        pw2CkText.classList.remove("sign-red");
    } else {
        pw2CkText.innerText = "비밀번호 불일치";
        pw2CkText.classList.add("sign-red");
        pw2CkText.classList.remove("sign-green");
    }

    if (this.value.length == 0) {
        pw2CkText.innerText = "";
    }
})

// eamil 형식 검사
// document.getElementById("inputEmail").addEventListener("keyup",function(){
//     const emailCkText = document.getElementById("emailCkText");
//     const regExp =/\w+@(\w+\.)+\w+/;

//     if(this.value.trim().length==0){
//         emailCkText.innerText ="";
//         emailCkText.classList.remove("sign-green"); 
//         emailCkText.classList.remove("sign-red"); 
//         return;
//     }

//     if(regExp.test(this.value)){
//         emailCkText.innerText="유효한 이메일 입니다.";
//         emailCkText.classList.add("sign-green");
//         emailCkText.classList.remove("sign-red"); 

//     }else{
//         emailCkText.innerText="이메일을 확인하세요.(aa@aa.com형식)";
//         emailCkText.classList.add("sign-red");

//     }

// });




// 닉네임 중복검사
document.querySelector("#ck-idBtn").addEventListener("click", function () {

    checkId(document.querySelector("#inputId").value);

});

// 이메일 인증번호 전송
document.querySelector("#ck-numBtn").addEventListener("click", function () {

    sendVerifyEmail(document.querySelector("#inputEmail").value).then((val) => {
        verifyCode = val;
    });
    alert("해당 이메일로 인증번호가 전송 되었습니다.")
});

// 인증번호 체크
document.querySelector("#ck-numBtn1").addEventListener("click", function () {

    if (document.querySelector("#verifyEmail").value == verifyCode) {
        isEmailChecked = true;
        alert("이메일이 인증 되었습니다.");
        let value1 = document.querySelector("#inputEmail").value;
        document.querySelector("#emailBox").innerHTML="";
        document.querySelector("#emailBox").insertAdjacentHTML("afterbegin", 
            `<input type="email" id="inputEmail" name="email" autocomplete="off" value="${value1}" readonly/>
            <button type="button" class="Confirmbtn" id="ck-numBtn">인증번호 받기</button>`
        )

        let value2 = document.querySelector("#verifyEmail").value;
        document.querySelector("#verifyBox").innerHTML="";
        document.querySelector("#verifyBox").insertAdjacentHTML("afterbegin", 
            `<input type="text" class="col1" id="verifyEmail" name="confirm" autocomplete="off" maxlength="10" value="${value2}" readonly/>`
        )

    } else {
        alert("인증 번호가 틀렸습니다.");
    }

});

function checkId(id) {

    const regExpNick = /^[가-힣0-9]{2,8}$/;

    if (regExpNick.test(id)) {

        $.ajax({

            url: contextPath + "/signUp/checkId",
            data: {
                "id": id,
            },
            success(res) {
                if (res == 1) {
                    alert("중복된 닉네임 입니다.");

                } else {
                    alert("사용 가능한 닉네임 입니다.");
                    isNicknameChecked = true;
                    let value = document.querySelector("#inputId").value;
                    document.querySelector("#nicknameBox").innerHTML="";
                    document.querySelector("#nicknameBox").insertAdjacentHTML("afterbegin", 
                
                        `<input type="text" id="inputId" name="inputid" autocomplete="off" confirm maxlength="30" value="${value}" readonly/>
                        <button type="button" class="Confirmbtn" id="ck-idBtn">중복 확인</button>`
                
                    )
                }
            },
            error() {
                console.log("에러임");
            }

        });

    } else {
        alert("사용 불가능한 아이디 입니다. 한글/숫자 2-8글자를 입력해주세요.");
    }
}


// 폼 제출 관리

document.querySelector("#sinupBtn").addEventListener("click", function (e) {
    console.log("버튼은 눌러졌음")
    if (!isNicknameChecked) {
        e.preventDefault();
        alert("닉네임을 체크해주세요");
        document.querySelector("#inputId").focus();
        return;
    }

    if (!isEmailChecked) {
        e.preventDefault();
        alert("이메일 인증을 해주세요");
        document.querySelector("#inputEmail").focus();
        return;
    }

    if (!isCaptchaChecked) {
        e.preventDefault();
        alert("보안문자를 확인 해주세요");
        document.querySelector("#captchaInput").focus();
        return;
    }

    if (document.querySelector("#inputPw").value == document.querySelector("#inputPw2").value) {
        console.log("회원 가입 서블릿 확인");
    } else {
        e.preventDefault();
        alert("비밀 번호와 비밀번호 확인이 일치하지 않습니다.");
        document.querySelector("#inputPw").focus();
        return;
    }

    const allAgree = document.querySelector("#agree1").checked;
    const age14 = document.querySelector("#agree2").checked;
    const serviceAgree = document.querySelector("#agree3").checked;

    if (!allAgree && !age14 && !serviceAgree) {
        alert("체크 박스를 확인해주세요.");
        document.querySelector(".agreeCk").focus()
        e.preventDefault();
        return;
    }


});




// 이메일 인증번호 전송

async function sendVerifyEmail(emailAddress) {

    let verifyCode = 10000 + (Math.floor(Math.random() * 89999));
    let data = {
        service_id: 'service_8lls798',
        template_id: 'template_uywyx8m',
        user_id: '5Vm42iOtNtSnQK34-',
        template_params: {
            to_email: emailAddress,
            message: verifyCode
        }
    };

    try {
        await fetch('https://api.emailjs.com/api/v1.0/email/send', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })

            .then(function (res) {
                if (res.ok) {
                    console.log('보내짐');
                } else {
                    console.log('실패함' + res.statusText);
                }
            })

    } catch (err) {
        console.log('err발생', err);
    }
    console.log(verifyCode)
    return verifyCode;

}
