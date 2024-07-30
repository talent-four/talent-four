<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>회원가입</title>
            <link rel="stylesheet" href="${contextPath}/resources/css/sign/signUp.css">
            <script src="https://kit.fontawesome.com/6c46ba8282.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        </head>

        <body>
            <form action="${contextPath}/signUp" method="POST">
                <a href="index.jsp"><img src="${contextPath}/resources/img/logo.png" id="signLogo"></a>

                <div class="formRow fpemail-confirm">
                    <div class="signUp-space">
                        <span>닉네임</span>
                    </div>
                    <div class="formCol" id="nicknameBox">
                        <input type="text" id="inputId" name="inputid" autocomplete="off" confirm maxlength="30">
                        <button type="button" class="Confirmbtn" id="ck-idBtn">중복 확인</button>
                    </div>
                    <div id="idCkText" class="sign-font">한글로만 2~8글자 입력</div>
                </div>


                <div class="formRow">
                    <div class="signUp-space">
                        <span>비밀번호</span>
                    </div>
                    <div class="formCol">
                        <input type="password" class="col1" name="password" id="inputPw" autocomplete="off" confirm
                            maxlength="30">
                    </div>
                    <div id="pwCkText" class="sign-font">영문+숫자+특수문자(!,_,~)를 포함한 5~15자</div>
                </div>

                <div class="formRow">
                    <div class="signUp-space">
                        <span>비밀번호 확인</span>
                    </div>
                    <div class="formCol">
                        <input type="password" class="col1" autocomplete="off" id="inputPw2" maxlength="30">
                    </div>
                    <div id="pw2CkText" class="sign-font"></div>
                </div>


                <div class="formRow">
                    <div class="signUp-space">
                        <span>가입할 이메일을 입력해 주세요. 아이디로 사용됩니다.</span>
                    </div>
                    <div class="formCol" id="emailBox">
                        <input type="email" id="inputEmail" name="email" autocomplete="off">
                        <button type="button" class="Confirmbtn" id="ck-numBtn">인증번호 받기</button>
                    </div>
                    <div id="nickNameCkText" class="sign-font"></div>
                </div>

                <div class="formRow">
                    <div class="signUp-space">
                        <span>이메일 인증번호 입력</span>
                    </div>
                    <div class="formCol" id="verifyBox">
                        <input type="text" class="col1" id="verifyEmail" name="confirm" autocomplete="off"
                            maxlength="10">
                        <button type="button" class="Confirmbtn" id="ck-numBtn1">인증번호 체크</button>
                    </div>
                </div>

                <div class="formRow">
                    <div class="signUp-space">
                        <span>보안문자</span>
                    </div>
                    <div class="formCol">
                        <canvas id="captchaCanvas" width="200" height="50"></canvas>
                        <button id="refreshCaptcha" class="Confirmbtn">새로고침</button>
                    </div>
                </div>

                <div class="formRow">
                    <div class="signUp-space">
                        <span>보안문자</span>
                    </div>
                    <div class="formCol" id="captchaBox">
                        <input type="text" id="captchaInput" placeholder="보안문자 입력">
                        <button type="button" class="Confirmbtn" id="checkCaptcha">확인</button>
                    </div>
                    <div id="result"></div>
                </div>

                <div class="formRow noBottomLine">
                    <ul class="agreeCk">
                        <li><input type="checkbox" name="agree2" value="age14" id="agree2">만 14세 이상입니다(필수)</li>
                        <li><input type="checkbox" name="agree3" value="serviceAgree" id="agree3">개인정보 수집/이용에 동의합니다.(필수)</li>
                    </ul>
                </div>
                <div class="formRow noBottomLine">
                    <button type="submit" class="Confirmbtn" id="sinupBtn">가입하기</button>
                </div>
            </form>
            <script>
                const contextPath = "${contextPath}";
            </script>
            <script src="${contextPath}/resources/js/sign/signUp.js"></script>
        </body>

        </html>