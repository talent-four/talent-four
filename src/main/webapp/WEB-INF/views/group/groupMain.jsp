<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디 메인</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/group/groupMain.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main>
        <section>
            <span>같이 공부해요</span>
        </section>
        <section class="choice-type-area">
            <div>
                <span id="type-all" class="choice-type choiced"><a href="${contextPath}/groupMain?type=2">전체</a></span>
                <span id="type-ing" class="choice-type"><a href="${contextPath}/groupMain?type=2&status=N">모집중</a></span>
                <span id="type-finished" class="choice-type"><a href="${contextPath}/groupMain?type=2&status=Y">모집완료</a></span>
            </div>
            <a href="${contextPath}/group/groupCreate">모집하기</a>
        </section>
        <jsp:include page="/WEB-INF/views/group/groupChoice.jsp"></jsp:include>
        <section class="content-area">
            <c:choose>
            	<c:when test="${empty GroupBoardList}"> 
	                <!-- 게시글 목록 조회 결과가 비어있다면(없다면)  -->
	            	<h1>게시글이 존재하지 않습니다.</h1>
	            </c:when>
	            <c:otherwise>
	            	<c:forEach var="GroupBoardList"  items="${GroupBoardList}">
			            <a href="">
			                <article class="each-board">
			                    <div>
                                    <c:if test="${GroupBoardList.studyStatus == 'Y'}">
                                        <div class="group-type finished">모집완료</div>
                                    </c:if>
                                    <c:if test="${GroupBoardList.studyStatus =='N'}">
                                        <div class="group-type ing">모집중</div>
                                    </c:if>
			                        <div class="group-locate">${GroupBoardList.location}</div>
			                    </div>
			                    <div class="group-date">
			                        <i class="fa-regular fa-calendar"></i><span>${GroupBoardList.startDate}</span>
			                    </div>
			                    <div class="group-title">
			                        <span class="group-content">${GroupBoardList.boardContent}</span>
			                    </div>
			                    <div class="etc-info">
			                        <div class="nick-num-area">
			                            <span>${GroupBoardList.memberNickname}</span>
			                            <span>모집인원 : <span>${GroupBoardList.studyNumber}</span>명</span>
			                        </div>
			                        <div class="view-area">
			                            <i class="fa-regular fa-eye"></i>
			                            <span>${GroupBoardList.readCount}</span>
			                        </div>
			                    </div>
			                </article>
			            </a>
	            	</c:forEach>
	            </c:otherwise>
            </c:choose>
        </section>
        <section class="pagination">
            <!-- 페이지네이션 a 태그에 사용될 공통 주소를 저장할 변수 선언 -->
            <c:set var="url" value="groupMain?&cp="/>

            <ul class="pagination">
                <li><a href="${url}1${sURL}">&lt;&lt;</a></li>
                <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>

                <!-- 범위가 정해진 일반 for문 사용 -->                    
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                    <c:choose>
                        <c:when test="${i == pagination.currentPage}">
                            <li><a class="current">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${url}${i}${sURL}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
                <!-- 위의 cp는 currentPage의 약자 -->
                <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>
                <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>
            </ul>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/group/groupMain.js"></script>
</body>
</html>