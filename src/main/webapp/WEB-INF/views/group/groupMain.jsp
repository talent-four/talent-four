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
            <!-- <a href="detail?no=${GroupBoardList.boardNo}&type=${param.type}&cp=${pagination.currentPage}"> -->
            <c:choose>
            	<c:when test="${empty GroupBoardList}"> 
	                <!-- 게시글 목록 조회 결과가 비어있다면(없다면)  -->
	            	<!-- <h1>게시글이 존재하지 않습니다.</h1> -->
	            </c:when>
	            <c:otherwise>
	            	<c:forEach var="GroupBoardList"  items="${GroupBoardList}">
			            <a href="detail?no=${GroupBoardList.boardNo}&type=${param.type}">
			                <article class="each-board">
			                    <div>
			                        <div class="group-type finished">${GroupBoardList.studyStatus}</div>
			                        <div class="group-locate">${GroupBoardList.tagName}</div>
			                    </div>
			                    <div class="group-date">
			                        <i class="fa-regular fa-calendar"></i><span>${GroupBoardList.startDate}</span>
			                    </div>
			                    <div class="group-title">
			                        <span class="group-content">${GroupBoardList.boardContent}</span>
			                    </div>
			                    <div class="tag-area">
			                        ${GroupBoardList.tagName}
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
            <a href="${contextPath}/group/groupDetail">
                <article class="each-board">
                    <div>
                        <div class="group-type ing">모집중</div>
                        <div class="group-locate">서울 강남구</div>
                    </div>
                    <div class="group-date">
                        <i class="fa-regular fa-calendar"></i><span>7월 15일 오전 10시</span>
                    </div>
                    <div class="group-title">
                        <span class="group-content">스터디 모집 게시글 작성 내용입니다.</span>
                    </div>
                    <div class="tag-area">
                        
                    </div>
                    <div class="etc-info">
                        <div class="nick-num-area">
                            <span>작성자 닉네임</span>
                            <span>모집인원 : <span>0</span>명</span>
                        </div>
                        <div class="view-area">
                            <i class="fa-regular fa-eye"></i>
                            <span>10</span>
                        </div>
                    </div>
                </article>
            </a>
            
            <a href="#">
                <article class="each-board">
                    <div>
                        <div class="group-type ing">모집중</div>
                        <div class="group-locate">서울 강남구</div>
                    </div>
                    <div class="group-date">
                        <i class="fa-regular fa-calendar"></i><span>7월 15일 오전 10시</span>
                    </div>
                    <div class="group-title">
                        <span class="group-content">스터디 모집 게시글 작성 내용입니다.</span>
                    </div>
                    <div class="tag-area">
                    </div>
                    <div class="etc-info">
                        <div class="nick-num-area">
                            <span>작성자 닉네임</span>
                            <span>모집인원 : <span>0</span>명</span>
                        </div>
                        <div class="view-area">
                            <i class="fa-regular fa-eye"></i>
                            <span>10</span>
                        </div>
                    </div>
                </article>
            </a>
            <a href="#">
                <article class="each-board">
                    <div>
                        <div class="group-type ing">모집중</div>
                        <div class="group-locate">서울 강남구</div>
                    </div>
                    <div class="group-date">
                        <i class="fa-regular fa-calendar"></i><span>7월 15일 오전 10시</span>
                    </div>
                    <div class="group-title">
                        <span class="group-content">스터디 모집 게시글 작성 내용입니다.</span>
                    </div>
                    <div class="tag-area">
                    </div>
                    <div class="etc-info">
                        <div class="nick-num-area">
                            <span>작성자 닉네임</span>
                            <span>모집인원 : <span>0</span>명</span>
                        </div>
                        <div class="view-area">
                            <i class="fa-regular fa-eye"></i>
                            <span>10</span>
                        </div>
                    </div>
                </article>
            </a>
            <a href="#">
                <article class="each-board">
                    <div>
                        <div class="group-type ing">모집중</div>
                        <div class="group-locate">서울 강남구</div>
                    </div>
                    <div class="group-date">
                        <i class="fa-regular fa-calendar"></i><span>7월 15일 오전 10시</span>
                    </div>
                    <div class="group-title">
                        <span class="group-content">스터디 모집 게시글 작성 내용입니다.</span>
                    </div>
                    <div class="tag-area">
                    </div>
                    <div class="etc-info">
                        <div class="nick-num-area">
                            <span>작성자 닉네임</span>
                            <span>모집인원 : <span>0</span>명</span>
                        </div>
                        <div class="view-area">
                            <i class="fa-regular fa-eye"></i>
                            <span>10</span>
                        </div>
                    </div>
                </article>
            </a>
        </section>
        <section class="pagination">

        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/group/groupMain.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>