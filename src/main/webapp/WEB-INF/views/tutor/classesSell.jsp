<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 클래스 판매 현황</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorClassSell.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
    <jsp:include page="/WEB-INF/views/tutor/tutorside.jsp"></jsp:include>
    
        <section class="mainsectionsP" id="classsellP"> <!-- 클래스 판매 현황 -->
            <article class="titleP"><span>클래스 판매 현황</span></article>
            <article class="sell-class-areaP">
                <div class="sell-class-menuP">
                    <div><span>신청서 번호</span></div>
                    <div><span>신청 시간</span></div>
                    <div><span>수강생명</span></div>
                    <div><span>클래스명</span></div>
                    <div><span>수강권</span></div>
                    <div><span>결제 상태</span></div>
                </div>
                <div class="sell-class-textP">
                    <div class="sell-class-rowP">
                        <div><span>240630</span></div>
                        <div><span>2024-06-30</span></div>
                        <div><span>김재능</span></div>
                        <div><a href="#">DB연동 많이 힘들거같은데</a></div>
                        <div><span>12개월</span></div>
                        <div><span>결제 완료</span></div>
                    </div>
                </div>
                <div class="sell-class-btn-areaP">
                    <span>총 </span>
                    <span id="sell-class-countP">O</span>
                    <span>개, </span>
                    <span id="sell-class-page-countP">O</span>
                    <span>페이지</span>
                    <button><i class="fa-solid fa-angle-left"></i></button>
                    <button><i class="fa-solid fa-angle-right"></i></button>
                </div>
            </article>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorClassSell.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>