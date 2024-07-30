<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 정산 신청</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorCalculate.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
    <jsp:include page="/WEB-INF/views/tutor/tutorside.jsp"></jsp:include>
    
        <section class="mainsectionsP" id="calculateP"> <!-- 정산 신청 -->
            <article class="titleP"><span>정산</span></article>
            <article>
                <div>
                    <div class="calculate-upP">
                        <span>정산 신청 가능 금액</span>
                    </div>
                    <div class="calculate-downP">
                        <span id="now-calculate-moneyP"><fmt:formatNumber value="${tutorcalculate.ingsum}" pattern="#,###원" /></span>
                    </div>
                </div>
                <div>
                    <div class="calculate-upP">
                        <span>정산 완료한 금액</span>
                    </div>
                    <div class="calculate-downP">
                        <span id="fin-calculate-moneyP"><fmt:formatNumber value="${tutorcalculate.finsum}" pattern="#,###원" /></span>
                    </div>
                </div>
                <div>
                    <div class="calculate-upP">
                        <span>총 정산 금액</span>
                    </div>
                    <div class="calculate-downP">
                        <span id="all-calculate-moneyP"><fmt:formatNumber value="${tutorcalculate.allsum}" pattern="#,###원" /></span>
                    </div>
                </div>
            </article>

            <form action="calculate?cp=1" method="post">
                <article>
                    <div class="btn-info-area">
                        <button id="calculate-btnP">정산 요청</button>
                        <div>
                            <i class="fa-regular fa-credit-card"></i>
                            <span id="account-infoP">${tutorcalculate.bankName} ${tutorcalculate.account} ${tutorcalculate.accountName}</span>
                        </div>
                    </div>

                    <div class="type-area">
                        <div class="calculate-status choiced">
                            <a href="${contextPath}/tutor/calculate?cp=1" class="status-link" data-id="1">정산중</a>
                        </div>
                        <div class="calculate-status">
                            <a href="${contextPath}/tutor/calculate?cp=2" class="status-link" data-id="2">정산완료</a>
                        </div>
                    </div>

                </article>

                <jsp:include page="/WEB-INF/views/tutor/calculateList.jsp"></jsp:include>
            </form>
        </section>
    </main>
    
    <c:if test="${!empty sessionScope.message}">
        <script>
            alert("${message}");
            
            // EL 작성시 scope를 지정하지 않으면 
            // page -> request -> session -> application 순서대로 검색하여
            // 일치하는 속성이 있으면 출력
            
        </script>
        
        <!-- message 1회 출력 후 session에서 제거 -->
        <c:remove var="message" scope="session"/>
    </c:if>

    <script>
        const contextPath = "${contextPath}";
        const tutorcalculateList = "${tutorcalculateList}";

    </script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorCalculate.js"></script>
    <script src="${contextPath}/resources/js/tutor/calculateList.js"></script>
</body>
</html>