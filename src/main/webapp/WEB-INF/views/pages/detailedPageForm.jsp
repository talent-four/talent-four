<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세페이지</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/pages/detialedPageForm.css">

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
    <link rel='stylesheet'
        href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-rounded/css/uicons-solid-rounded.css'>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <form action="write" enctype="multipart/form-data" method="POST" onsubmit="return writeValidate()">
        <main id="detailed">
            <section class="upper">
                <div class="upperWrapper">
                    <div class="thumbnailBox">
                        <label for="thumbnail">
                            <img class="preview" src="${contextPath}${classInfo.classPhoto}">
                        </label>
                        <input type="file" class="inputImage" id="thumbnail" accept="image/*" name="thumbnail">
                        <span class="delete-image">&times;</span>
                    </div>
                    <div class="classInfo">
                        <div class="classCategory">
                            <select name="mainCategory" id="mainCategory">
                            	<c:if test="${!empty classInfo.main}">
                                 <option value="" selected>${classInfo.main}</option>
                            	</c:if>
                            	<c:if test="${empty classInfo.main}">
                                 <option value="" disabled selected>대분류</option>
                            	</c:if>
                                 
                                <c:forEach var="main" items="${categoryList}">
                                 <option value="${main.categoryCode}">${main.categoryName}</option>
                                </c:forEach>
                            </select> /
                            <select name="subCategory" id="subCategory">
                                <c:if test="${!empty classInfo.sub}">
                                	<option value="" disabled selected>${classInfo.sub}</option>
                                </c:if>
                                <c:if test="${empty classInfo.sub}">
                                	<option value="" disabled selected>소분류</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="classTitle"><input type="text" class="inputBox" id="inputTtile1" name="classTitle" placeholder="클래스 제목" value="${classInfo.className}"></div>
                        <div class="classEvaluation"><span class="star">★</span> (5) / <span><i
                                    class="fa-solid fa-users"></i> 100</span></div>
                        <div class="classTeacher">${tutorInfo[2]} 튜터</div>
                    </div>
                </div>
                <nav class="detailedNav">
                    <ul>
                        <li><a href="#classIntroduce">클래스 소개</a></li>
                        <li><a href="#tutorIntroduce">튜터 소개</a></li>
                        <li><a href="#dp-review">리뷰</a></li>
                    </ul>
                </nav>
            </section>

            <section class="lower">
                <div class="introduceBox" id="classIntroduce">
                    <section class="classDetailBox">
                        <div class="urlBox"><h3>강의 URL</h3><input type="text" class ="inputBox" name="classUrl" id="url" value="${classInfo.classUrl }"></div>
                        <div class="classDetail">
                            <textarea class="classDetailContent" name="classContent" id="textarea">${classInfo.classIntro }</textarea>
                            <button id="toggleButton" type="button">HTML 미리보기</button>
                            <div class="classDetailContent" id="output"></div>
                        </div>
                    </section>
                    <section class="detialedPage-tutorInfo bottomBox" id="tutorIntroduce">
                        <span class="boxTitle">튜터님을 소개합니다!</span>
                        <div>
                            <div class="tutorInfoSmallBox">
                                <c:if test="${tutorInfo[0] != null}">
                                    <img src="${contextPath}${tutorInfo[0]}">
                                </c:if>

                                <c:if test="${tutorInfo[0] == null}">
                                    <img src="${contextPath}/resources/img/profile_tutor.png">
                                </c:if>

                                <div class="introduceTutor">
                                    <span>${tutorInfo[2]} 튜터</span>
                                </div>
                            </div>
                            <div class="tutorIntroduce">
                                <p>
                                   ${tutorInfo[1]}
                                </p>
                            </div>
                        </div>
                    </section>
                </div>
                <section id="detailedSide" class="bottomBox">
                    <section id="detailedSide-d1">
                        <div>
                            <input type="text" class="inputBox" id="inputTtile2" placeholder="클래스 제목" value=${classInfo.className }>
                            <div class="classEvaluation"><span class="star">★</span> (5) / <span><i class="fa-solid fa-users"></i> 100</span></div>
                            <div class="classTeacher">${tutorInfo[2]} 튜터</div>
                            <input type="text" class="inputBox" id="classPrice" name="classPrice" placeholder="금액" value=${classInfo.classPrice }>원
                        </div>
        
                        <!-- <div class="detailedCon">
                            <span> <i class="fa-regular fa-circle-play"></i>&nbsp;VOD • 총25강 • 3시간 10분</span><br>
                            <span><i class="fa-regular fa-comments"></i> &nbsp;QnA 가능</span>
                        </div> -->
        
                        <div class="detailedPageBrn">
                            <a href="#" class="chatBtn"><img src="${contextPath}/resources/img/chat.png"></a>
                            <c:if test="${!empty classInfo}">
                            	<button class="creditBtnSub" type="submit">클래스 수정하기</button>
                            </c:if>
                            <c:if test="${empty classInfo}">
                            	<button class="creditBtnSub" type="submit">클래스 등록하기</button>
                            </c:if>
                        </div>
                    </section>
                </section>
            </section>
         	<input type="hidden" name="mode" value="${param.mode}">
        </main>
    </form>
    <script>
       	const mode = "${param.mode}";
        const loginMember = "${loginMember}"
    </script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script src="${contextPath}/resources/js/pages/detailPage.js"></script>
</body>

</html>