<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Review</title>
                <!-- css, js, header 다 넣어서 사용해주세요 -->




                <!-- JS -->
                <script src="https://code.jquery.com/jquery-3.7.1.js"
                    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
                <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
            </head>

            <body>

                <!-- header -->
                <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

                <main>
                    <div id="main-header">
                        <div class="headerbtn btn1">추천 순</div>
                        <div class="headerbtn btn2">최신 순</div>
                        <div class="headerbtn btn3">글쓰기</div>
                        <div class="searchBox">
                            <input type="text" name="search" id="searchReview">
                            <button class="fa-solid fa-magnifying-glass" id="searchReviewBtn"></button>
                        </div>
                    </div>
                    <div id="startLine">
                    </div>
                    <!-- 리뷰 삽입 지점 -->

                </main>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
                <!-- CSS -->
                <link rel="stylesheet" href="${contextPath}/resources/css/review/review.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <!--     <script type="text/javascript">
                    const memberNickname = "${loginMember.memberNickname}";
                    const memberNo = "${loginMember.memberNo}"
                    const contextPath = "${contextPath}";
                </script> -->
                <script src="${contextPath}/resources/js/review/review.js"></script>
            </body>

            </html>