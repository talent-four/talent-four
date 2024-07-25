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
                                <button id="tel-check"><i class="fa-solid fa-check"></i></button>
                                <button id="tel-cancel" type="button"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>

                        <div>
                            <span>정산 계좌</span>
                            <div>
                                <div>
                                    <span>예금주명</span>
                                    <input type="text" name="accountName">
                                </div>
                                <div>
                                    <span>은행명</span>
                                    <select name="bankName" id="bankName">
                                        <option value="국민은행">국민은행</option>
                                        <option value="농협은행">농협은행</option>
                                        <option value="신한은행">신한은행</option>
                                        <option value="IBK기업은행">IBK기업은행</option>
                                        <option value="우리은행">우리은행</option>
                                    </select>
                                </div>
                                <div>
                                    <span>계좌번호</span>
                                    <input type="text" name="accountNumber">
                                </div>
                            </div>
                            <button id="changeTel" type="button"><i class="fa-regular fa-pen-to-square"></i></button>
                        </div>
                        
                        <div>
                            <span>튜터 소개</span>
                            <div>
                                <textarea name="introduce" id="introduce" maxlength="300"></textarea>
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