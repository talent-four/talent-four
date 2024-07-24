<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세페이지</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/pages/detialedPage.css">
     	
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<c:set var="classInfo" value="${classDetail.classDetail}"></c:set>
 	
   	<main id="detailed">
        <section class="upper">
            <div class="upperWrapper">
            	<c:if test="${classInfo.classPhoto != 'PHOTO URL'}">
            		<img src="${contextPath}${classInfo.classPhoto}">
            	</c:if>
           		<c:if test="${classInfo.classPhoto == 'PHOTO URL'}">
            		<img src="https://img.taling.me/Content/Uploads/Images/85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png">
            	</c:if>
                <div class="classInfo">
                    <div class="classCategory"><span>${classInfo.main}</span> / <span>${classInfo.sub}</span></div>
                    <div class="classTitle">${classInfo.className}</div>
                    <div class="classEvaluation">★ (${classInfo.score}) / <span><i class="fa-solid fa-users"></i> ${classInfo.reviews}</span></div>
                    <div class="classTeacher">${classInfo.memberNickname} 튜터</div>
                </div>
            </div>
            <nav class="detailedNav">
            ${currUrl}
                <ul>
                    <li><a href="#classIntroduce">클래스 소개</a></li>
                    <li><a href="#tutorIntroduce">튜터 소개</a></li>
                    <li><a href="#dp-review">리뷰<span class="nav-min-15">15</span></span></a></li>
                </ul>
            </nav>
        </section>
		
        <section class="lower">
            <div class="introduceBox" id="classIntroduce">
                <section class="classDetailBox">
                    <div class="classDetail">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ca1a32ac54e1a160ef3542b9f9be04dca1c614f7.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3d8f60050749e7ad92e02c56a0ec9a8bec780554.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/d55ab5246ef4c0e324025814e3e99bd8ea61b4ae.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9e4a01468757001ad35a6296e7f3b7b783a8daf4.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/755ca8e76ec0947208da256323d44197329851a8.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9ef79c0240be77c731ddd4d2e63639f8915efebd.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/378b60480091948f074ecf3928b88aa7b42f9f16.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/025ce707e84a7e745f6d7c6e27874d0c15c87328.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/03b619987481004f8a839f5c633b8a296576d7bd.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/5c1e80e1f7814e7cdec63cc9b5a408d4df82472a.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/a952aa3c6f7cd059789df0eeb84b66abeebd1601.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ac2e89e1c6a111a9fc4a6813abc8ac7bf93369dc.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9e3b46a0c82b6ab313e436c120a8e6c76d23907c.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/4960127efd2ac2701ce16ad4421605d0dc996438.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/e1041e90252e87e8633ff8b8aa24011520b3811d.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/41ac25ec473fc8dd5ccc5bf5c8198449db85f876.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/92aa0e240c58195a973af2c2c3b0ad4ac1727fd2.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/b0489febf09f8ff05d2b7052d02baaa8fbd714fb.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ee6619aea5a9ca62735080eab9f975768798d3de.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/39e83b1355217d19f4b85fe78df8576d81736320.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/2228c7598332fc8d34760a9206b8d42f3305e828.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/0e615707c95a6780f10a3333a5c9ee7b00eee99a.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/7a3b0617abf8f8d003c579db298a6907b47b7cdb.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/db6aa5e9eec48e932c321a4a538b50e62b13a3d1.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/0efc5e070ac1f3f7764df93e707c6cf639466bfe.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/ef8c64434881647bcc16ec8e70513131ec9f946c.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/52d6183a07c5ad468f4c7932c3928b4164fa74d9.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3bf72b228c34c64afa1954ca6a9c4edc9e8d5fe4.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/eff726823ce4f18bb2624e79a91e5857c8e8cdec.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/1c36376016aaa6f617f3f04af4ed2a3a9980fb01.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/efb485099060894df1411006a70c2759e44c73d8.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/8dbbfd4e56483b84e487270997280a6eb5d0b8fc.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/aafb7a52b3df7304dad049baec58890ec7856e63.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/a6be96b7d5037cd9cd53471c619487055514bd45.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/075e0decb38874370d9cdb6ae7b004efa1b54e90.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/c302c7e47b0870bd4b9b456b1654ab2913335a27.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/5cb145471ff7e8f658acb5a54cca4edf5d288ee8.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/50d25a6c95bb6fc179d209ee270e408372f91319.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/92c52a73ea9f2326ebab12fe3fc3a3cb1b33da49.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/bc8bb5f4b4bb12aa4a8d47db26730dd598fcb674.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/9ee93d5607337dc894a9244f20a84ee703e52ae1.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3295f285de2dd2d540cb6ee6fdde93096dd62be4.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/759a857f98b008a489da49faa0bdf3012f83fd26.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/72bd7767907a0b3f65a2d66304fbdd1a56924750.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/e916702734d4ac40d9199a21c0dfe254cd021bb5.gif" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3c1f38e1557993b6b908b6c55574423b08b5899c.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/83671e2a96781b66f4f551978ab7e14df7e3b413.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/f5224afd92576dc375bfb23dc343a4d7f1cd018b.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/20dfcb661513ec5b16600754bf3fd0c5ceee0f2c.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/1667b60db666cecfb90d78169bebde1ffccb8c6c.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3d0f310b8a8d34fc9f857530423b99a33f9e0a1e.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/8330bb3c93c2d80ac9bda60cbdf0e7060e28ee1d.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/f5aca34dd806455c52279f0a70443488bec6557f.jpg" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/3e864d58b9f134b19a9fdbc4de96d5d538ef5797.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/589e2c877b37214c464eb8f496c66cdd725a0410.png" class="txc-image">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/taling.me/Content/Uploads/editaling/852e790db6a58dd53c0f9a61aa387f57d57b733c.jpg" class="txc-image">
                        <%-- ${classInfo.classIntro} --%>
                        <div id="blur"></div>
                    </div>
                    <button type="button" class="btnClass" id="d-classInfoBtn">클래스 소개 더보기</button>
    
                </section>
                <section class="detialedPage-tutorInfo bottomBox" id="tutorIntroduce">
                    <span class="boxTitle">튜터님을 소개합니다!</span>
                    <div>
                        <div class="tutorInfoSmallBox">
                        ${classDetail.tutorInfo[0]}
                        <c:if test="${classInfo.memberProfile != null}">
                        	<img src="${contextPath}${classInfo.memberProfile}">
                        </c:if>
                        
                        <c:if test="${classInfo.memberProfile == null}">
                        	<img src="${contextPath}/resources/img/profile_tutor.png">
                        </c:if>
                            
                            <div class="introduceTutor">
                                <span>${classInfo.memberNickname} 튜터</span>
                                <div></div>
                            </div>
                        </div>
                        <div class="tutorIntroduce">
                            <pre>
                            
                            ${classDetail.tutorInfo[1]}
                            
                            </pre>
                        </div>
                    </div>
                </section>
    
    
<!--                 <section id="d-curriculum" class="bottomBox">
                    <span class="boxTitle">커리큘럼</span>
                    <div class="curriculumBox">
                        <h4>맛보기 영상</h4>
    
                        <a href="#"> <strong>OT.오리엔테이션</strong>
                            <span>03:10</span>
                        </a>
                    </div>
                    <div>
                        <h4>1. 누구나 카피라이터가 되어야 합니다.</h4>
                        <a href="#">
                            <strong>1-1 카피라이팅의 세계에 오신 것을 환영합니다!</strong>
                            <span>07:21</span>
                        </a>
                    </div>
                    <button type="button" id="d-curriculumBtn">커리큘럼 더보기</button>
                </section> -->
    
    
    
    
                <section id="dp-review" class="bottomBox">
                
                    <div>
                        <span class="boxTitle">수강생 리뷰</span>
                        <div>
                            <a href="#">추천순</a>
                            <a href="#">최신순</a>
                        </div>
                    </div>
    
    				<c:forEach var="item" items="${reviewList}">
	                    <div class="d-review">
	                        <div>
                                <div class="profileBox">
                                    <c:if test="${empty item.profileImage}">    	
                                        <img src="${contextPath}/resources/img/profile_all_re.PNG">
                                    </c:if>
                                    
                                    <c:if test="${!empty item.profileImage}">    	
                                        <img src="${contextPath}${item.profileImage}">
                                    </c:if>
                                    <div>
                                        <span>${item.memberNickname}</span>
                                        <span class="starBox">
                                            <c:set var="totalStars" value="5" />
                                            <c:set var="emptyStars" value="${totalStars - item.reviewStar}" />
                                            <c:forEach var="i" begin="1" end="${item.reviewStar}">
                                                ★
                                            </c:forEach>
                                            <c:forEach var="i" begin="1" end="${emptyStars}">
                                                ☆
                                            </c:forEach>
                                        </span>
                                    </div>
                                </div>
                                <div class="titleBox">
                                    <span> ${item.boardContent} </span>
                                </div>
                                <c:if test="${empty item.updateDate}">    	
                                    <span class="dp-date-review">${item.createdDate}</span>
                                </c:if>
                                
                                <c:if test="${!empty item.updateDate}">    	
                                    <span class="dp-date-review">${item.updateDate}</span>
                                </c:if>
                            </div>
                            <p class="d-review-content">
                                ${item.boardContent}
                            </p>
	                    </div>
    				</c:forEach>
 <%--                    <div class="d-review">
                        <div>
                            <img src="${contextPath}/resources/img/profile_all_re.PNG">
                            <p>
                                <span class="dp-date-review">2021-06-27</span>
                                <span>이름
                                </span>
                                <span> ★★★★★ 5.0</span>
                            </p>
    
                        </div>
    
                        <p class="d-review-content">
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                        </p>
                        <button type=button id="d-reviewBtn">더보기</button>
                    </div> --%>
    
                </section>
    
                <section id="d-similarClass" class="bottomBox">
                    <span class="boxTitle">비슷한 클래스예요</span>
    
                    <div id="d-similarC-1">
                        <img src="${contextPath}/resources/img/art/samsamC.PNG">
                        <div>
                            <strong>VOD</strong>
                            <span>일글강 -일하고 글쓰는 사람들을 위한 강의</span>
                            <span><strong>40,000</strong>원/월</span>
                        </div>
                    </div>
                    <button type="button" id="d-similarBtn">비슷한 클래스 더보기 ></button>
                </section>
    
                <section id="d-similarClass" class="bottomBox">
                    <span class="boxTitle">이런 클래스 어때요?</span>
    
                    <div id="d-similarC-1">
                        <img src="${contextPath}/resources/img/art/suggestC2.PNG">
                        <div>
                            <strong>VOD</strong>
                            <span>회사에선 안 알려주는 진짜 현장 엑셀</span>
    
                            <div>
                                <span class="d-red">85%</span>
                                월<strong>33,000</strong>원
                            </div>
                            <span>★ 4.9(638)</span>
                        </div>
                    </div>
                    <button type="button" id="d-suggestBtn">추천클래스 더보기 ></button>
                </section>
            </div>  
            
            <section id="detailedSide" class="bottomBox">
                <section id="detailedSide-d1">
                    <div>
                        <h3>${classInfo.className}</h3>
                        <span>★5.0(15)</span><br><br>
                        
                        <span><strong><fmt:formatNumber value="${classInfo.classPrice}" pattern="#,###원" /></strong></span><br>
                    </div>
                    <br>
    
                    <div class="detailedCon">
                        <span> <i class="fa-regular fa-circle-play"></i>&nbsp;VOD • 총25강 • 3시간 10분</span><br>
                        <span><i class="fa-regular fa-comments"></i> &nbsp;QnA 가능</span>
    
                    </div>
    
                    <div class="detailedPageBrn">
                        <a href="#" class="chatBtn"><img src="${contextPath}/resources/img/chat.png"></a>
	                        <a class="creditBtnSub" href="${contextPath}/approval">클래스 결제하기</a>

                    </div>
            </section>

        </section>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <script src="${contextPath}/resources/js/common/hf.js"></script>
    <script src="${contextPath}/resources/js/pages/detailPage.js"></script>
</body>

</html>