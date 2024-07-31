<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>궁금해요</title>
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
          
    <section class="wonder-section2">
    
       
	            <div class="wonder-notice" >
	                <h2>${board.boardTitle}</h2>
	                <div class="wonder-count">
	                    <span>${board.memberNickname}</span>
	                    <span>${board.createDate}</span>
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
	                
	                </div>
	               	 <div class="wonder-section3">
	                <p>${board.boardContent}</p>
	               
	                 <a href="${contextPath}/wonder/free" class="back-link">목록으로</a>
	            </div>
	       			</div>
	    
	    <div>
	        <a href="#wonder-main" class="wonderTopBtn">TOP</a>
	    </div>
    
    </section>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
