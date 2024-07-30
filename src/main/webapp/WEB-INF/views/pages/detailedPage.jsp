<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/pages/detialedPage.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/review/review.css">

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6e9a783fd9.js"
	crossorigin="anonymous"></script>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.4.2/uicons-solid-rounded/css/uicons-solid-rounded.css'>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<c:set var="checkMyClass" value="${checkList[0]}"></c:set>
	<!-- 자신이 만든 클래스인지 체크 -->
	<c:set var="checkPaidClass" value="${checkList[1]}"></c:set>
	<!-- 결제한 클래스인지 체크 -->
	<c:set var="classInfo" value="${classInfo}"></c:set>
	<main id="detailed">
		<section class="upper">
			<div class="upperWrapper">
				<c:if test="${classInfo.classPhoto != 'PHOTO URL'}">
					<img src="${contextPath}${classInfo.classPhoto}">
				</c:if>
				<c:if test="${classInfo.classPhoto == 'PHOTO URL'}">
					<img
						src="https://img.taling.me/Content/Uploads/Images/85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png">
				</c:if>
				<div class="classInfo">
					<div class="classCategory">
						<span>${classInfo.main}</span> / <span>${classInfo.sub}</span>
					</div>
					<div class="classTitle">${classInfo.className}</div>
					<div class="classEvaluation">
						<span class="star">★</span> (${classInfo.score}) / <span><i
							class="fa-solid fa-users"></i> ${classInfo.reviews}</span>
					</div>
					<div class="classTeacher">${classInfo.memberNickname}튜터</div>
				</div>
			</div>
			<nav class="detailedNav">
				<ul>
					<li><a href="#classIntroduce" class="pageMove">클래스 소개</a></li>
					<li><a href="#tutorIntroduce" class="pageMove">튜터 소개</a></li>
					<li><a href="#dp-review" class="pageMove">리뷰<span
							class="nav-min-15">${classInfo.reviews}</span></span></a></li>
				</ul>
			</nav>
		</section>
		<section class="lower">
			<div class="introduceBox" id="classIntroduce">
				<section class="classDetailBox">
					<div id="classDetail">
						${classInfo.classIntro}
						<div id="blur"></div>
					</div>
					<button type="button" class="btnClass" id="d-classInfoBtn">클래스
						소개 더보기</button>
				</section>
				<section class="detialedPage-tutorInfo bottomBox"
					id="tutorIntroduce">
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
							<p>${tutorInfo[1]}</p>
						</div>
					</div>
				</section>
				<section id="dp-review" class="bottomBox">
					<div>
						<span class="boxTitle">수강생 리뷰</span>
						<div>
							<c:if test="${checkPaidClass}">
								<button id="writeReview" onclick="reviewWrite()">리뷰 쓰기</button>
							</c:if>
							<a href="#">추천순</a> <a href="#">최신순</a>
						</div>
					</div>

					<c:forEach var="item" items="${reviewList}">
						<div class="d-review">
							<div>
								<div class="profileBox">
									<c:if test="${empty item.profileImage}">
										<img src="${contextPath}/resources/img/profile_all_re.png">
									</c:if>

									<c:if test="${!empty item.profileImage}">
										<img src="${contextPath}${item.profileImage}">
									</c:if>
									<div>
										<span>${item.memberNickname}</span> <span class="starBox">
											<c:set var="totalStars" value="5" /> <c:set var="emptyStars"
												value="${totalStars - item.reviewStar}" /> <c:forEach
												var="i" begin="1" end="${item.reviewStar}">
                                                            ★
                                                        </c:forEach> <c:forEach
												var="i" begin="1" end="${emptyStars}">
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
							<p class="d-review-content">${item.boardContent}</p>
							<div class="reviewBtnArea">
								<button onclick="thumbsBtn()">
									<i class="fa-regular fa-thumbs-up"></i> ${item.thumbs}
								</button>
								<button onclick="reportBtn()">
									<i class="fi fi-sr-light-emergency-on"></i> ${item.report}
								</button>
							</div>
						</div>
					</c:forEach>
					<%--<div class="d-review">
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
							<strong>VOD</strong> <span>일글강 -일하고 글쓰는 사람들을 위한 강의</span> <span><strong>40,000</strong>원/월</span>
						</div>
					</div>
					<button type="button" id="d-similarBtn">비슷한 클래스 더보기 ></button>
				</section>

				<section id="d-similarClass" class="bottomBox">
					<span class="boxTitle">이런 클래스 어때요?</span>

					<div id="d-similarC-1">
						<img src="${contextPath}/resources/img/art/suggestC2.PNG">
						<div>
							<strong>VOD</strong> <span>회사에선 안 알려주는 진짜 현장 엑셀</span>

							<div>
								<span class="d-red">85%</span> 월<strong>33,000</strong>원
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
						<div class="classEvaluation">
							<span class="star">★</span> (${classInfo.score}) / <span><i
								class="fa-solid fa-users"></i> ${classInfo.reviews}</span>
						</div>
						<div class="classTeacher">${classInfo.memberNickname}튜터</div>

						<span><strong> <fmt:formatNumber
									value="${classInfo.classPrice}" pattern="#,###원" />
						</strong></span><br>
					</div>
					<!-- <div class="detailedCon">
                                    <span> <i class="fa-regular fa-circle-play"></i>&nbsp;VOD • 총25강 • 3시간 10분</span><br>
                                    <span><i class="fa-regular fa-comments"></i> &nbsp;QnA 가능</span>
                                </div> -->

					<div class="detailedPageBrn">
						<a href="#" class="chatBtn"><img
							src="${contextPath}/resources/img/chat.png"></a>
						<c:choose>
							<c:when test="${checkMyClass}">
								<a class="creditBtnSub"
									href="${contextPath}/detailedPage/write?mode=update&classNo=${classInfo.classNo}">클래스
									수정하기</a>
							</c:when>
							<c:when test="${checkPaidClass}">
								<a class="creditBtnSub"
									href="${contextPath}/class?classNo=${classInfo.classNo}">클래스
									수강하기</a>
							</c:when>
							<c:otherwise>
								<a class="creditBtnSub"
									href="${contextPath}/approval?classNo=${classInfo.classNo}">클래스
									결제하기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</section>
		</section>
		<script>
	       	const loginMemberNo = "${loginMember.memberNo}";
	       	const parents = "${classInfo.classNo}";
       </script>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/pages/detailPage.js"></script>
</body>
</html>