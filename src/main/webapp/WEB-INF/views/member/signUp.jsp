<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/sign/signUp.css">
    <script src="https://kit.fontawesome.com/6c46ba8282.js" crossorigin="anonymous"></script>
</head>
<body>
	<form action="#" >
        <a href="index.jsp"><img src="${contextPath}/resources/img/logo.png" id="signLogo"></a>

        <div class="formRow fpemail-confirm">
            <div class="signUp-space">
                <span>아이디</span>
            </div>
            <div class="formCol">
                <input type="text" id="inputId" name="inputid" autocomplete="off" confirm maxlength="30">
                <button type="button" class="Confirmbtn" id="ck-idBtn">중복 확인</button>
            </div>
            <div id="idCkText" class="sign-font">영문+숫자 5~15자</div>
        </div>


        <div class="formRow">
            <div class="signUp-space">
                <span>비밀번호</span>
            </div>
            <div class="formCol">
                <input type="password" class="col1" name="password" id="inputPw" autocomplete="off" confirm maxlength="30">
            </div>
            <div id="pwCkText" class="sign-font">영문+숫자+특수문자(!,_,~)를 포함한 5~15자</div>
        </div>

        <div class="formRow">
            <div class="signUp-space">
                <span>비밀번호 확인</span>
            </div>
            <div class="formCol">
                <input type="password" class="col1" autocomplete="off" id="inputPw2" confirm maxlength="30">
            </div>
            <div id="pw2CkText" class="sign-font"></div>
        </div>

        <div class="formRow">
            <div class="signUp-space">
                <span>닉네임</span>
            </div>
            <div class="formCol">
                <input type="text" autocomplete="off"  id="nickName" confirm maxlength="30">
                <button type="button" class="Confirmbtn" id="ck-idBtn">닉네임 중복 확인</button>
            </div>
            <div id="nickNameCkText" class="sign-font">한글로만 2~8글자 입력</div>
        </div>


        <div class="formRow">
            <div class="signUp-space">
                <span>가입한 이메일을 입력해 주세요. 인증번호를 보내드립니다.</span>
            </div>
            <div class="formCol">
                <input type="email" id="inputEmail" name="email" autocomplete="off" confirm >
                <button type="button" class="Confirmbtn" id="ck-numBtn">인증번호 받기</button>
            </div>
            <div id="nickNameCkText" class="sign-font">한글로만 2~8글자 입력</div>
        </div>
        
        <div class="formRow">
            <div class="signUp-space">
                <span>이메일 인증번호 입력</span>
            </div>
            <div class="formCol">
                <input type="text" class="col1" id="confirmNum" name="confirm"  autocomplete="off" confirm maxlength="10">
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
            <div class="formCol">
                <input type="text" id="captchaInput" placeholder="보안문자 입력">
                <button type="button" class="Confirmbtn" id="checkCaptcha">확인</button>
            </div>
            <div id="result"></div>
        </div>

        <div class="formRow noBottomLine">
            <ul class="agreeCk">
                <li><input type="checkbox" name="agree" value="allAgree">모두 동의합니다.</li>
                <li><input type="checkbox" name="agree" value="age14">만 14세 이상입니다(필수)</li>
                <li><input type="checkbox" name="agree" value="serviceAgree">개인정보 수집/이용에 동의합니다.(필수)</li>
                <li><input type="checkbox" name="agree" value="add">마케팅 수신. 홍보 목표의 개인정보 수집 및 이용에 동의합니다.(선택)</li>
            </ul>
        </div>
        <div class="formRow noBottomLine">
            <button type="submit" class="Confirmbtn" id="sinupBtn">가입하기</button>
        </div>
    </form>
    <script src="${contextPath}/resources/js/sign/signUp.js"></script>
</body>
</html>