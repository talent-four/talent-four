<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/pages/categoryPage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/slider.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <nav>
        <div class="categorBar width-1280px margin-auto">
            <div class="categorBarUpper">
                <ul>
                    <li><a href="${contextPath}/classPage/all">전체</a></li>
                    <c:forEach var="mainCategory" items="${categoryList}">
                    	<li><a href="${contextPath}/classPage/${mainCategory.categoryCode}">${mainCategory.categoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <!-- 전체일 경우, 안보이게 -->
            <c:if test="${param.main != 'all'}">
            <div class="categorBarlower">
                <ul>
					<c:forEach var="subCategory" items="${mainCategory.subCategory}">
                    	<li><a class="subCategoryBtn" href="${contextPath}/classPage/${subCategory.parentId}/${subCategory.categoryCode}">${subCategory.categoryName}</a></li>
                    </c:forEach>
                </ul>
            </div>
           	</c:if>
        </div>
    </nav>

    <c:forEach var="j" begin="0" end="${fn:length(classList)/5}">
    <div class="contentWrapper">
        <c:if test="${j == 0}">
            <div class="buttonArea">
                <button onclick="orderByRecommand()">추천순</button><button onclick="orderByDate()">최신순</button>
            </div>
        </c:if>
        <div class="contentBoxs" id="contentSlider">
            <div class="contentBoxsSet" id="contentBoxSet">
            	    <c:if test="${empty classList}">
    	            	<h3>강의가 없습니다.</h3>
    	            </c:if>
            	<c:forEach var="i" begin="${j*5}" end="${(j+1)*5-1}">
    	            <c:if test="${!empty classList[i]}">
    	            <a href="${contextPath}/detailedPage?classNo=${classList[i].classNo}" class="contentBox">
	                    <img
	                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
	                    <div class="contentTitle">${classList[i].className}</div>
	                    <div class="contentAuthor">${classList[i].memberNickname}</div>
	                    <div class="contentStars">★ (<span>3.9</span>)</div>
	                    <div class="contentPrice"><fmt:formatNumber value="${classList[i].classPrice}" pattern="#,###원" /></div>
                	</a>
					</c:if>
            	</c:forEach>
            </div>
 		</div>
 	</div>
    </c:forEach>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <script src="${contextPath}/resources/js/pages/categoryPage.js"></script>
    <script src="${contextPath}/resources/js/common/slider.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>

</html>