<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>this</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>

<body>

    <!-- 찜 삭제하고, 찜의 내용 -> 결제내역으로 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
        <section class="sideP"> <!-- 카테고리 사이드바 -->
            <article class="profileP"> <!-- 프로필 사진 / 이름 -->
                <div class="profile-areaP"> <!-- 프로필 사진 -->
                    <img src="${contextPath}/resources/img/profile-default.jpg" id="profile-img">
                </div>
                <div class="nameP"> <!-- 이름 -->
                    <span id="idP">${loginMember.memberNickname}</span>
                </div>
            </article>
            <article class="category-areaH"> <!-- 카테고리 -->
                <table class="category-tableH">
                    <tr class="categoryH">
                        <td><button id="tutor-btn"><i class="fa-solid fa-rocket"
                                    style="color : #219EBC ;font-size:15pt; padding-right: 5px;"></i> <b>튜터 신청
                                    하기</b></button></td>
                    </tr>
                    <tr class="categoryH selected" id="category-profile">
                        <td>
                            <p>프로필</p>
                        </td>
                    </tr>
                    <tr class="categoryH" id="category-payment">
                        <td>
                            <p>결제 내역</p>
                        </td>
                    </tr>
                    <tr class="categoryH" id="category-review">
                        <td>
                            <p>리뷰</p>
                        </td>
                    </tr>
                    <tr class="categoryH" id="category-QA">
                        <td>
                            <p>Q&A(삭제 예정)</p>
                        </td>
                    </tr>
                </table>
            </article>
        </section>
        <div class="containerH"> <!-- 메인 내용 -->
            
        </div>


    </main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script type="text/javascript">
        const memberEmail = "${loginMember.memberEmail}";
        const memberNickname = "${loginMember.memberNickname}";
        console.log("${loginMember}");
        const contextPath = "${contextPath}";
    </script>
    <script src="${contextPath}/resources/js/mypage/mypage.js"></script>
</body>

</html>