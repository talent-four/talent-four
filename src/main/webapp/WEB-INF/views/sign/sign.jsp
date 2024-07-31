<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/sign/login.css">
    <script src="https://kit.fontawesome.com/6c46ba8282.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 세션 스코프 메시지 알림 -->
	<c:if test="${!empty sessionScope.message }">
	<script>
		alert("${message}")
	</script>
	<c:remove var="message" scope="session"/>
	</c:if>

    <main id="tlogin">
        <fieldset>
            <h3><a href="index.jsp">재능사조</a></h3>
            <p>간편하게 로그인하고<br>
            다양한 클래스를 만나보세요</p>
           
            <form action="#" method="post">
                <div class="tlogin-space">
                    <span>아이디</span>
                    <span><a href="#">아이디를 잊어버렸어요</a></span>
                   
                </div>

                <div class="tlogin-border">
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="id" autocomplete="off" >
                 
                </div>

                <div class="tlogin-space">
                    <span>비밀번호</span>
                    <span><a href="#">비밀번호를 잊어버렸어요</a></span>
                </div>

                <div class="tlogin-border">
                    <i class="fa-solid fa-key"></i>
                    <input type="password" name="pw"  autocomplete="off">
              
                </div>
            <button type="submit" name="login" id="tloginBtn">로그인</button>
            </form>
            <span class="tlogin-join">아직 재능사조 회원이 아니시라면, <a href="#" >회원가입</a> 해보세요</span>
        </fieldset>
    </main>

</body>
</html>