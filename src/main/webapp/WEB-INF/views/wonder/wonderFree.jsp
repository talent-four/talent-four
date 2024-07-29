<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
=======
%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
>>>>>>> 63f5e571f38a5a5fc951cbda85e684e3ecebeb48

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< HEAD
    <title>궁금해요</title>
=======
    <title>자유로운 궁금증</title>
>>>>>>> 63f5e571f38a5a5fc951cbda85e684e3ecebeb48
    <link rel="stylesheet" href="${contextPath}/resources/css/wonderBoard/wonderFree.css">
    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/wonder/wonderHeader.jsp"></jsp:include>
<<<<<<< HEAD
          
=======

>>>>>>> 63f5e571f38a5a5fc951cbda85e684e3ecebeb48
    <section class="wonder-section">
        <form name="wonder-form" class="wonder-form">
            <div class="wonder-search-item">
                <fieldset>
                    <i class="fa-solid fa-magnifying-glass wonder-icon"></i>
                    <input type="text" placeholder="제목과 내용을 검색해 보세요" name="wonderBoard" id="wonder-search">
                </fieldset>
                <button id="woder-serachBtn">검색</button>    
            </div>
            <div class="wonder-search-item">
                <fieldset>
                    <i class="fa-solid fa-tag wonder-icon"></i>
                    <input type="text" placeholder="태그를 입력하세요" name="wonderBoard" id="wonder-search">
                </fieldset>
                <button type="reset" class="wonder-restBtn"><i class="fa-solid fa-rotate">검색어초기화</i></button> 
            </div>
        </form>
    </section>
<<<<<<< HEAD
    
    <section class="wonder-section2">
        <!--  <div class="wonder-nav">
=======

    <section class="wonder-section2">
        <div class="wonder-nav">
>>>>>>> 63f5e571f38a5a5fc951cbda85e684e3ecebeb48
            <ul>
                <li><a href="#" class="wonderCurrent">전체</a></li>
                <li><a href="#">해결됨</a></li>
                <li><a href="#">미해결됨</a></li>
                <li><a href="#">최신순</a></li>
                <li><a href="#">답변많은순</a></li>
                <li><a href="#">추천순</a></li>
            </ul>
        </div>
<<<<<<< HEAD
        -->
=======
>>>>>>> 63f5e571f38a5a5fc951cbda85e684e3ecebeb48
        <div class="wonder-write">
            <button>글쓰기</button>
        </div>

<<<<<<< HEAD
        <div>
        <c:if test="${empty freeList}">
            <p>게시글이 없습니다.</p>
        </c:if>
        
        <c:forEach var="board" items="${freeList}">
            <div class="wonder-notice" >
                <a href="${contextPath}/wonder/detail?id=${board.boardNo}"><h2>${board.boardTitle}</h2></a>
                <c:choose>
                    <c:when test="${fn:trim(board.qaStatus) eq 'N'}">
                        <span class="notice-st">미해결</span>
                    </c:when>
                    <c:when test="${fn:trim(board.qaStatus) eq 'Y'}">
                        <span class="notice-st2">해결</span>
                    </c:when>
                    <c:otherwise>
                        ${board.qaStatus}
                    </c:otherwise>
                </c:choose>
                <p>${board.boardContent}</p>
                <div class="wonder-Tag">
                    <span> 
                        <c:choose>
                            <c:when test="${not empty board.tagName}">
                                <c:forEach var="tag" items="${fn:split(board.tagName, ',')}">
                                    <span class="tag">#${fn:trim(tag)}</span>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                No tags
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="wonder-count">
                    <span>${board.memberNickname}</span>
                    <span>${board.createDate}</span>
                    <ul>
                        <li>조회수 0</li>
                        <li>추천수 0</li>
                        <li>답변수 0</li>
                    </ul>
                </div>
            </div>
        </c:forEach>
        </div>
        <!-- Pagination Navigation -->
        <div class="wonder-pagination">
            <!-- Previous Page -->
            <c:choose>
                <c:when test="${pagination.currentPage > 1}">
                    <a href="?cp=${pagination.currentPage - 1}">&lt;</a>
                </c:when>
                <c:otherwise>
                    &lt;
                </c:otherwise>
            </c:choose>
            
            <!-- Page Number Links -->
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="i">
                <c:choose>
                    <c:when test="${i == pagination.currentPage}">
                        <span class="wonder-p">${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="?cp=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <!-- Next Page -->
            <c:choose>
                <c:when test="${pagination.currentPage < pagination.maxPage}">
                    <a href="?cp=${pagination.currentPage + 1}">&gt;</a>
                </c:when>
                <c:otherwise>
                    &gt;
                </c:otherwise>
            </c:choose>
        </div>
    </section>
    
    <div>
        <a href="#wonder-main" class="wonderTopBtn">TOP</a>
    </div>
    
=======
        <c:choose>
            <c:when test="${empty map.boardList}">
                <p>게시글이 없습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="board" items="${map.boardList}">
                    <div class="wonder-notice">
                        <h2 id="boardTitle">${board.boardTitle}
                            <c:choose>
                                <c:when test="${board.qaStatus == 'y'}">
                                    <span class="notice-st">해결</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="notice-st2">미해결</span>
                                </c:otherwise>
                            </c:choose>
                        </h2>
                        <p>${board.boardContent}</p>
                        <div class="wonder-Tag">
                            <span>${board.hashTag}</span>
                        </div>
                        <div class="wonder-count">
                            <span>${board.memberNickname}</span>
                            <span>${board.createDate}</span>
                            <ul>
                                <li>조회수 ${board.readCount}</li>
                                <li>추천수 ${board.recommendCount}</li>
                                <li>답변수 ${board.answerCount}</li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <div class="wonder-page-area">
            <ul class="wonder-pagination">
                <!-- Previous Page -->
                <c:if test="${map.pagination.currentPage > 1}">
                    <li><a href="?type=${param.type}&cp=${map.pagination.currentPage - 1}">&lt;</a></li>
                </c:if>

                <!-- Page Numbers -->
                <c:forEach var="i" begin="${map.pagination.startPage}" end="${map.pagination.endPage}">
                    <c:choose>
                        <c:when test="${i == map.pagination.currentPage}">
                            <li><a class="current">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="?type=${param.type}&cp=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- Next Page -->
                <c:if test="${map.pagination.currentPage < map.pagination.maxPage}">
                    <li><a href="?type=${param.type}&cp=${map.pagination.currentPage + 1}">&gt;</a></li>
                </c:if>
            </ul>
        </div>
    </section>

    <div>
        <a href="#wonder-main" class="wonderTopBtn">TOP</a>
    </div>

>>>>>>> 63f5e571f38a5a5fc951cbda85e684e3ecebeb48
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
