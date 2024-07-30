<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 클래스 관리</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/tutor/tutorClasses.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main> <!-- 메인 -->
    <jsp:include page="/WEB-INF/views/tutor/tutorside.jsp"></jsp:include>
        <section class="mainsectionsP" id="classesP"> <!-- 클래스 관리 -->
            <article class="titleP"><span>내 클래스</span></article>
            <article class="class-subtitleP">
                <span>운영 중인 클래스</span>
                <button type="button"><a href="${contextPath}/detailedPage/write?mode=insert">클래스 만들기</a></button>
            </article>
            <article class="class-areaP">
                <div class="class-menuP">
                    <div><span>썸네일</span></div>
                    <div><span>클래스명</span></div>
                    <div><span>운영 상태</span></div>
                    <div><span>등록일</span></div>
                </div>
                <div class="class-textP">
                    <c:choose>
                        <c:when test="${empty tutorclasses}">
                            <h1>개설한 클래스가 존재하지 않습니다.</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tutorclasses"  items="${tutorclasses}">
                                <div class="class-rowP" id=${tutorclasses.classNo}>
                                    <div><img src="${contextPath }${tutorclasses.classPhoto}" class="class-thumbnail"></div>
                                    <div><a href="${contextPath }/detailedPage/class?classNo=${tutorclasses.classNo}">${tutorclasses.className}</a></div>
                                    <div><div class="class-statusBtn"><span>
                                        <c:if test="${tutorclasses.classStatus == 1}">
                                            운영중
                                        </c:if>
                                    </span></div></div>
                                    <div><span>${tutorclasses.classCreateDate}</span></div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="class-btn-areaP">
                    <span>총 </span>
                    <span id="now-class-countP">
                        ${counting.classCount}
                    </span>
                    <span>개</span>
                </div>
            </article>
            <article class="class-subtitleP"><span>만료된 클래스</span></article>
            <article class="class-areaP">
                <div class="class-menuP">
                    <div><span>썸네일</span></div>
                    <div><span>클래스명</span></div>
                    <div><span>운영 상태</span></div>
                    <div><span>등록일</span></div>
                </div>
                <div class="class-textP">
                    <c:choose>
                        <c:when test="${empty tutorclassesfin}">
                            <h1>만료된 클래스가 존재하지 않습니다.</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tutorclassesfin"  items="${tutorclassesfin}">
                                <div class="class-rowP" id=${tutorclassesfin.classNo}>
                                    <div><img src="${contextPath}${tutorclassesfin.classPhoto}" class="class-thumbnail"></div>
                                    <div><a href="${contextPath}/detailedPage/class?classNo=${tutorclassesfin.classNo}">${tutorclassesfin.className}</a></div>
                                    <div><div id="finclassdiv" class="class-closed"><span>
                                        <c:if test="${tutorclassesfin.classStatus == 2}">
                                            운영 종료
                                        </c:if>
                                    </span></div></div>
                                    <div><span>${tutorclassesfin.classCreateDate}</span></div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="class-btn-areaP">
                    <span>총 </span>
                    <span id="now-class-countP">
                        ${countfin.classCount}
                    </span>
                    <span>개</span>
                </div>
            </article>
        </section>
        <script>
        	const contextPath = "${contextPath}";
        	const loginMember = "${loginMember}";
        </script>
    </main>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorClasses.js"></script>
</body>
</html>