<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="calculate-upP">
                            <span>총 정산 금액</span>
                        </div>
                    </div>
                    <div class="calculate-downP">
                        <span id="all-calculate-moneyP">
                            0
                        </span>
                        <span>원</span>
                    </div>
                </div>
                <div>
                    <div class="calculate-upP">
                        <span>정산 신청 가능 금액</span>
                    </div>
                    <div class="calculate-downP">
                        <span id="now-calculate-moneyP">0</span>
                        <span>원</span>
                    </div>
                </div>
            </article>

            
            <article>
                <div class="btn-info-area">
                    <button id="calculate-btnP">정산 요청</button>
                    <div>
                        <i class="fa-regular fa-credit-card"></i>
                        <span id="account-infoP">재능은행 111-111-11111 김재능</span>
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

            <article class="calculate-all-areaP">
                <table class="calculate-table">
                    <thead>
                        <tr>
                             <th><input type="checkbox" id="title-checkP"></th>
                             <th>정산상태</th>
                             <th>수강생명</th>
                             <th>클래스명</th>
                             <th>정산 예정 금액</th>
                             <th>수수료율</th>
                             <th>정산 신청 시간</th>
                        </tr> 
                    </thead>
                    <tbody class="cal-all-rows">
                        <c:choose>
                            <c:when test="${empty tutorcalculateList}">
                                <tr>
                                    <th colspan="7"><h1>정산이 완료된 클래스가 없습니다.</h1></th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="tutorcalculateList"  items="${tutorcalculateList}">
                                    <tr class="cal-each-rows">
                                        <td><input type="checkbox" name="money"></td>
                                        <td>
                                            <c:if test="${tutorcalculateList.settleStatus == 1}">
                                                <div class="cal-status">정산미신청</div>
                                            </c:if>
                                            <c:if test="${tutorcalculateList.settleStatus == 2}">
                                                <div class="cal-status fin">정산완료</div>
                                            </c:if>
                                        </td>
                                        <td>${tutorcalculateList.memberNickname}</td>
                                        <td>${tutorcalculateList.boardTitle}</td>
                                        <td>${tutorcalculateList.classPrice}</td>
                                        <td>${tutorcalculateList.commission}</td>
                                        <td>
                                            <c:if test="${tutorcalculateList.settleStatus == 1}">
                                                -
                                            </c:if>
                                            <c:if test="${tutorcalculateList.settleStatus == 2}">
                                                ${tutorcalculateList.settleDate}
                                            </c:if>
                                        </td>
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
    <script src="${contextPath}/resources/js/tutor/tutorCalculate.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>