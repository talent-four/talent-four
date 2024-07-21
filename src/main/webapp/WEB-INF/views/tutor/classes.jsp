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
                <button type="button"><a href="#">클래스 만들기</a></button>
            </article>
            <article class="class-areaP">
                <div class="class-menuP">
                    <div><span>썸네일</span></div>
                    <div><span>클래스명</span></div>
                    <div><span>운영 상태</span></div>
                    <div><span>등록일</span></div>
                </div>
                <div class="class-textP">
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    
                    
                </div>
                <div class="class-btn-areaP">
                    <span>총 </span>
                    <span id="now-class-countP">O</span>
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
                    <div class="class-rowP">
                        <div><img src="../../img/cat1.jpg" class="class-thumbnail"></div>
                        <div><a href="#">고양이는 매우매우 귀여운 생물이다!</a></div>
                        <div><div><span>운영 중</span></div></div>
                        <div><span>2023-07-26</span></div>
                    </div>
                    
                </div>
                <div class="class-btn-areaP">
                    <span>총 </span>
                    <span id="finished-class-countP">O</span>
                    <span>개</span>
                </div>
            </article>
        </section>
    </main>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/tutor/tutorClasses.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>
</html>