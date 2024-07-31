<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>튜터 등록</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorRegister.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main>
        <form action="register" method="post" onsubmit="return updateValidate1()"> 
            <section class="titleP">
                <span>튜터등록</span>
                <span>*<span>필수</span></span>
            </section>

            <section class="regist-tel-areaP">
                <div class="side-textP">
                    <span>전화번호</span><span>*</span>
                </div>
                <div>
                    <input type="text" id="input-telP" name="inputTel" maxlength="11" placeholder="(-제외 입력하시오.)">
                </div>
            </section>

            <section class="regist-introduce-area">
                <div class="side-textP">
                    <span>튜터소개</span><span>*</span>
                </div>
                <div>
                    <textarea name="inputIntroduce" id="inputIntroduce" placeholder="소개글을 작성하시오." maxlength="300"></textarea><br>
                    <span><span id="inputIntroduceCount">0</span>/300</span>
                </div>
            </section>

            <section class="regist-account-area">
                <div class="side-textP">
                    <span>계좌등록</span><span>*</span>
                </div>
                <div>
                    <div>
                        <span>예금주명</span>
                        <input type="text" name="accountName" id="accountName1">
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
                        <input type="text" name="account" id="account1">
                    </div>
                </div>
            </section>

            <section class="regist-career-areaP">
                <div class="side-textP">
                    <span>인증</span><span>*</span>
                </div>
                <div>
                    <div class="info-career-inputP">
                        <span>인증 가이드</span>
                        <ul>
                            <li>수강생들에게 신뢰를 주기 위해 신분 또는 학력 인증이 필수 입니다.</li>
                            <li>파일은 .jpg .png .gif .bmp등 이미지 파일만 가능합니다.</li>
                            <li>관리자 확인 후 업로드해주신 파일은 바로 삭제됩니다.</li>
                            <li>튜터등록은 내국인 또는 취업비자를 소지한 외국인만 가능합니다.</li>
                        </ul>
                    </div>
                    
                    <div class="university-areaP">
                        <span>최종학력<span>대학교/대학원(학생증/재학,졸업증명서)</span></span><br>
                        <input type="text" name="university" id="university-nameP" placeholder="탈잉대학교">
                        <input type="text" name="university" id="university-major-nameP" placeholder="탈잉학과">
                        <input type="file" id="university">
                        <label for="university" id="university-btn">업로드</label>
                    </div>
                    
                </div>
            </section>
            <section class="regist-btn-areaP">
                <button id="cancel-saveP" type="button"><a href="${contextPath}">취소</a></button>
                <button id="save-nextP">저장</button>
            </section>
        </form>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorRegister.js"></script>
</body>
</html>