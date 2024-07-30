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
                <table class="classSell-table">
                    <thead>
                        <tr>
                             <th>신청 시간</th>
                             <th>수강생명</th>
                             <th>클래스명</th>
                             <th>결제상태</th>
                        </tr> 
                    </thead>
                    <tbody class="sell-all-rows">
                        <c:choose>
                            <c:when test="${empty tutorclassSell}">
                                <tr>
                                    <th colspan="4"><h1>판매된 클래스가 존재하지 않습니다.</h1></th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="tutorclassSell"  items="${tutorclassSell}">
                                    <tr class="sell-each-rows">
                                        <td>${tutorclassSell.startDate}</td>
                                        <td>${tutorclassSell.memberNickname}</td>
                                        <td>${tutorclassSell.boardTitle}</td>
                                        <td><div>${tutorclassSell.paymentStatus}</div></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </article>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorClassSell.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>