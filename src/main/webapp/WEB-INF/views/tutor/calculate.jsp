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
                        <span id="all-calculate-moneyP">0</span>
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
                    <button id="change-account-btnP"><i class="fa-regular fa-pen-to-square"></i></button>
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
                        <tr class="cal-each-rows">
                            <td><input type="checkbox" name="money"></td>
                            <td><div class="cal-status">정산미신청</div></td>
                            <td>김재능</td>
                            <td>좋아하는 영화로 영어회화 따라잡기</td>
                            <td>36,346원</td>
                            <td>20%</td>
                            <td>2024.07.15</td>
                        </tr>
                        <tr class="cal-each-rows">
                            <td><input type="checkbox" name="money"></td>
                            <td><div class="cal-status ing">정산진행중</div></td>
                            <td>김재능</td>
                            <td>좋아하는 영화로 영어회화 따라잡기</td>
                            <td>36,346원</td>
                            <td>20%</td>
                            <td>2024.07.15</td>
                        </tr>
                        <tr class="cal-each-rows">
                            <td><input type="checkbox" name="money"></td>
                            <td><div class="cal-status finished">정산완료</div></td>
                            <td>김재능</td>
                            <td>좋아하는 영화로 영어회화 따라잡기</td>
                            <td>36,346원</td>
                            <td>20%</td>
                            <td>2024.07.15</td>
                        </tr>
                        <tr class="cal-each-rows">
                            <td><input type="checkbox" name="money"></td>
                            <td><div class="cal-status">정산미신청</div></td>
                            <td>김재능</td>
                            <td>좋아하는 영화로 영어회화 따라잡기</td>
                            <td>36,346원</td>
                            <td>20%</td>
                            <td>2024.07.15</td>
                        </tr>
                        
                    </tbody>
                </table>
            </article>
            <div class="pagination-area">

                <!-- 페이지네이션 a 태그에 사용될 공통 주소를 저장할 변수 선언 -->
                <c:set var="url" value="list?type=${param.type}&cp="/>

                <ul class="pagination">
                    <li><a href="${url}1">&lt;&lt;</a></li>
                    <li><a href="${url}${pagination.prevPage}">&lt;</a></li>

                    <!-- 범위가 정해진 일반 for문 사용 -->                    
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <li><a class="current">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${url}${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    <!-- 위의 cp는 currentPage의 약자 -->
                    <li><a href="${url}${pagination.nextPage}">&gt;</a></li>
                    <li><a href="${url}${pagination.maxPage}">&gt;&gt;</a></li>
                </ul>
            </div>
        </section>
       
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorCalculate.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>