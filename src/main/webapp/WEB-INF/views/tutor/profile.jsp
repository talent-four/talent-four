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
        
        <form action="profile" method="post" enctype="multipart/form-data" onsubmit="return updateValidate()">
            <section class="mainsectionsP" id="profileP">
                <article class="titleP"><span>내 프로필</span></article>
                    <div class="text-areaP">
                        <div>
                            <span>프로필 이미지</span>
                            <img src= "${loginMember.memberProfile}" id="PI-defaultP">
                            <input type="file" id="PIhide-btnP" name="tutorProfile" value="${tutorProfile.tutorProfile}">
                            <label for="PIhide-btnP" id="PIchange-btnP"><i class="fa-solid fa-camera"></i></label>
                        </div>

                        <div>
                            <span>전화 번호</span>
                            <input type="text" id="tel-input" name="tel-input" value="${tutorProfile.tutorTel}" maxlength="11" onfocus="showWarning()" onblur="hideWarning()">
                            <span id="tel-info">전화번호는 (-)제외 입력하세요</span>
                        </div>

                        <div>
                            <span>정산 계좌</span>
                            <div>
                                <div>
                                    <span>예금주명</span>
                                    <input type="text" name="accountName" value="${tutorProfile.tutorName}" id="accountName">
                                </div>
                                <div>
                                    <span>은행명</span>
                                    <select name="bankName" id="bankName" value="${tutorProfile.bankName}">
                                        <option value="농협은행" ${tutorProfile.bankName == '농협은행' ? 'selected' : ''}>농협은행</option>
                                        <option value="국민은행" ${tutorProfile.bankName == '국민은행' ? 'selected' : ''}>국민은행</option>
                                        <option value="신한은행" ${tutorProfile.bankName == '신한은행' ? 'selected' : ''}>신한은행</option>
                                        <option value="IBK기업은행" ${tutorProfile.bankName == 'IBK기업은행' ? 'selected' : ''}>IBK기업은행</option>
                                        <option value="우리은행" ${tutorProfile.bankName == '우리은행' ? 'selected' : ''}>우리은행</option>
                                    </select>
                                    </select>
                                </div>
                                <div>
                                    <span>계좌번호</span>
                                    <input type="text" name="accountNumber" id="accountNumber" value="${tutorProfile.account}">
                                </div>
                            </div>
                        </div>
                        
                        <div>
                            <span>튜터 소개</span>
                            <div>
                                <textarea name="introduce" id="introduce" maxlength="300" onfocus="showCount()" onblur="hideCount()">${tutorProfile.tutorIntroduce}</textarea>
                                <div id="countArea">
                                    <span id="Infocount">0</span>
                                    <span>/300</span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div>
                                <button id="cancel" type="button" onclick="resetForm()">취소하기</button>
                                <button id="change">변경하기</button>
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