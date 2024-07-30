<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 메시지</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorMessage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
    <jsp:include page="/WEB-INF/views/tutor/tutorside.jsp"></jsp:include>
        <section class="mainsectionsP" id="messageP"> <!-- 매세지 -->
            <article>
                <div id="message-boxP">
                    <div><span>메시지함</span></div>
                    <div><span>아직 주고 받은 메시지가 없어요</span></div>
                    <div><button id="call-chattingP">과거 체팅 내역 요구하기</button></div>
                </div>
                <div id="chatting-areaP">
                    <span>채팅방을 선택해주세요</span>
                </div>
            </article>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorMessage.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>