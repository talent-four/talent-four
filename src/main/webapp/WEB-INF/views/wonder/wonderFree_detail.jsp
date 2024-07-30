<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>궁금해요!</title>
    <link rel="stylesheet" href="${contextPath}/resources//css/wonderBoard/wonderClass-detail.css">
    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources//css/common/hf.css">
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
          
    
    <main class="wonder-main" id="wonder-main">
            <h1>궁금해요 !!</h1>
           
                     
        <c:if test="${not empty sessionScope.loginMember}">
            <form action="${contextPath}/wonder/write" method="post">
                <input type="hidden" name="memberNo" value="${sessionScope.loginMember.memberNo}">
                <input type="text" id="title" name="title" placeholder="제목을 입력하세요." required>
                <input type="text" id="tags" name="tags" placeholder="#태그입력(10글자이하,띄어쓰기대신-사용)">
                <textarea id="content" name="content" placeholder="내용입력" required></textarea>

                <div class="wonder-button">
                    <button type="submit" class="register-btn">등록</button>
                    <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
                </div>
            </form>
        </c:if>
        <c:if test="${empty sessionScope.loginMember}">
            <script>
                alert("로그인을 해주세요.");
            </script>
        </c:if>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>