<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 내 프로필</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorProfile.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
    <jsp:include page="/WEB-INF/views/tutor/tutorside.jsp"></jsp:include>
        
        <form action="">
            <section class="mainsectionsP" id="profileP">
                <article class="titleP"><span>내 프로필</span></article>
                    <div class="text-areaP">
                        <div>
                            <span>프로필 이미지</span>
                            <img src= "${contextPath}/resources/img/profile_default_removebg.png" id="PI-defaultP">
                            <input type="file" id="PIhide-btnP">
                            <label for="PIhide-btnP" id="PIchange-btnP"><i class="fa-solid fa-camera"></i></label>
                        </div>
                        <div>
                            <span>전화 번호</span>
                            <input type="text" id="tel-input" name="tel-input" value="${loginMember.tutorTel}" maxlength="11">
                            <button id="changeTel" type="button"><i class="fa-regular fa-pen-to-square"></i></button>
                            <div id="hide-tel-area">
                                <input type="text" id="change-input" name="change-input" maxlength="12">
                                <button id="tel-check"><i class="fa-solid fa-check"></i></button>
                                <button id="tel-cancel" type="button"><i class="fa-solid fa-xmark"></i></button>
                                <div>
                                    <span id="change-countP">0</span>
                                    <span>/12</span>
                                </div>
                            </div>
                        </div>

                        <div>
                            <span>자격증</span>
                            <div></div>
                            <input type="file" id="careerP">
                            <label for="careerP"><span id="add-careerP"><i class="fa-solid fa-plus"></i>자격증 추가하기</span></label>
                            <div></div>
                        </div>
                        
                        <div>
                            <span>튜터 소개</span>
                            <div>
                                <textarea name="introduce" id="introduce" value="${loginMember.tutorTel}" maxlength="300"></textarea>
                            </div>
                            <button type="button" id="change-introduce"><i class="fa-regular fa-pen-to-square"></i></button>
                            <div class="hidden-area2" id="hiddenArea2">
                                <button type="button" id="check-introduce"><i class="fa-solid fa-check"></i></button>
                                <button type="button" id="cancel-introduce"><i class="fa-solid fa-xmark"></i></button>
                                <span><span>0</span>/300</span>
                            </div>
                        </div>
                    </div>
            </section>
        </form>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorProfile.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>