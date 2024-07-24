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
                         <span>총 정산 금액</span>
                    </div>
                    <div class="calculate-downP">
                        <span id="all-calculate-moneyP">
                            0
                        </span>
                        <span>원</span>
                        <span>(</span>
                        <span id="all-calculate-countP">0</span>
                        <span>)건</span>
                    </div>
                </div>
                <div>
                    <div class="calculate-upP">
                        <span>정산 신청 가능 금액</span>
                    </div>
                    <div class="calculate-downP">
                        <span id="now-calculate-moneyP">0</span>
                        <span>원</span>
                        <span>(</span>
                        <span id="now-calculate-countP">0</span>
                        <span>)건</span>
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

                <div class="hidden-area">
                    <div class="background-div" id="background-div"></div>
                    <div id="account-input-areaP">
                        <span>계좌정보</span>
                        <div>
                            <form action="#">
                                <div>
                                    <span>은행</span>
                                    <select name="banknameP" id="banknameP">
                                        <option value="국민은행">국민은행</option>
                                        <option value="농협은행">농협은행</option>
                                        <option value="신한은행">신한은행</option>
                                        <option value="IBK기업은행">IBK기업은행</option>
                                        <option value="우리은행">우리은행</option>
                                    </select>
                                </div>
                                <div>
                                    <span>정산 계좌</span><input type="text" id="accountP" name="accountP">
                                </div>
                                <div>
                                    <span>예금주</span><input type="text" id="usernameP" name="usernameP">
                                </div>
                            </form>
                        </div>
                        <div>
                            <button id="save-btnP">저장</button>
                            <button id="cancel-btnP">취소</button>
                        </div>
                    </div>
                </div>

                <div class="type-area">
                    <div class="calculate-status choiced">
                        <span>정산중</span>
                    </div>
                    <div class="calculate-status">
                        <span>정산완료</span>
                    </div>
                </div>

            </article>

            <article class="calculate-all-areaP">
                <table>
                    <thead>
                        <tr>
                             <th><input type="checkbox" id="title-checkP"></th>
                             <th>정산상태</th>
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
            

                    <tbody>
                        <tr>
                            
                        </tr>
                    </tbody>
                </table>
                
                <div>
                    <div class="calculate-each-contentP">
                        <div><input type="checkbox" name="money"></div>
                        <div><div class="calculate-borderP" id="calculate-borderP"><div class="circleP" id="circleP"></div><span>정산 미신청</span></div></div>
                        <div><span>탈잉</span></div>
                        <div><span>좋아하는 영화로 영어회화 따라잡기</span></div>
                        <div><span>36,346원</span></div>
                        <div><span>20%</span></div>
                        <div><span>2024.02.16</span></div>
                    </div>
                    
                    
                </div>
            </article>
            <div class="cal-btn-areaP">
                <span>총 </span>
                <span id="calculate-countP">O</span>
                <span>개, </span>
                <span id="calculate-page-countP">O</span>
                <span>페이지</span>
                <button id="cal-page-left-btnP" class="cal-page-change-btnP"><i class="fa-solid fa-angle-left"></i></button>
                <button id="cal-page-right-btnP" class="cal-page-change-btnP"><i class="fa-solid fa-angle-right"></i></button>
            </div>

        </section>
       
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorCalculate.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>