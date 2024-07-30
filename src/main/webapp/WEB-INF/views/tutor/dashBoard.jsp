<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대시보드</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorDashboard.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
    <jsp:include page="/WEB-INF/views/tutor/tutorside.jsp"></jsp:include>
        
        <section class="mainsectionsP" id="dashboardP"> <!-- 대시 보드 -->
            <article class="titleP"><span>대시보드</span></article>
            <article class="subtitleP"><span>클래스 분석</span></article>
            <article class="data-areaP">
                    <div id="reviews">
                        <span>리뷰수</span>
                        <span id="view-count">${countReview}</span>
                    </div>
                    <div id="paid">
                        <span>총 결제수</span>
                        <span id="calaulate-count">${countPaid}</span>
                    </div>
                    <div id="scatter">
                        <span>결제율</span>
                        <span id="calculate-persent">${percent}<span>%</span></span>
                    </div>  
            </article>
            
            <article class="graph-areaP" id="graph-areaP">
                <div class="div1">
                    <div class="graph-titleP"><span id="title"></span></div>
                    <div class="graph-contentP">
                        <div class="graphP" id="graphP">
                            <canvas id="viewsChart" width="800px" height="330px"></canvas>
                            <div id="total-content">
                                <h1>${loginMember.memberNickname}님의 총 클래스 개수는 ${classCount}개입니다.</h1>
                            </div>
                        </div>

                    </div>
                </div>
            </article>

        </section>
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    

    <script>
        // 게시글 번호
        const paidgraph = "${paidgraph}";  // 500

        const contextPath = "${contextPath}";

        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";

    </script>
    <script src="${contextPath}/resources/js/tutor/tutorDashboard.js"></script>
</body>
</html>