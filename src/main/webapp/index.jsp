<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6e9a783fd9.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="infinitySlider contentWrapper">
		<ul>
			<li><img
				src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fo3ijr2dg7vo_2023-12-11.png&w=3840&q=75"></li>
			<li><img
				src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fvc98xurw36m_2024-05-21.png&w=3840&q=75"></li>
			<li><img
				src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fo3ijr2dg7vo_2023-12-11.png&w=3840&q=75"></li>
			<li><img
				src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fvc98xurw36m_2024-05-21.png&w=3840&q=75"></li>
		</ul>
	</div>

	<div class="slideContentWrapper contentWrapper">
		<div class="contentHeader">
			<div class="contentHeaderTitle">주간 베스트 TOP20</div>
			<div class="contentHeaderShowAll">모두보기</div>
		</div>

		<div class="contentBoxs" id="contentSlider">
			<c:forEach var="j" begin="0" end="2">
				<div class="contentBoxsSet" id="contentBoxSet"><!-- 큰 박스 3번 반복 -->
					<c:forEach var="i" begin="${j*5}" end="${(j+1)*5-1}"><!-- 작은 박스안에 5개씩 -->
						<c:if test="${!empty classList[i]}"><!-- 비어있으면 출력 안함 --><!-- 이녀석을 기준으로 클래스 불러와야 함 -->
							<a href="${contextPath}/detailedPage/class?classNo=${classList[i].classNo}" class="contentBox"> 
								<c:if test="${classList[i].classPhoto == 'PHOTO URL'}">
									<img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
								</c:if>
								<c:if test="${classList[i].classPhoto != 'PHOTO URL'}">
									<img src="${contextPath}${classList[i].classPhoto}">
								</c:if>
								<div class="contentTitle">${classList[i].className}</div>
								<div class="contentAuthor">${classList[i].memberNickname}</div>
								<div class="contentStars"><span class="star">★</span> <span>(${classList[i].score})</span> <span><i class="fa-solid fa-users"></i> ${classList[i].reviews}</span></div>
								<div class="contentPrice"><fmt:formatNumber value="${classList[i].classPrice}" pattern="#,###원" /></div>
							</a>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		
		<div class="slideButton fa-solid fa-chevron-left" id="leftButton"></div>
		<div class="slideButton fa-solid fa-chevron-right" id="rightButton"></div>
	</div>
	<div class="slideContentWrapper contentWrapper">
		<div class="contentHeader">
			<div class="contentHeaderTitle">주간 베스트 TOP20</div>
			<div class="contentHeaderShowAll">모두보기</div>
		</div>

		<!-- 15개만 출력되야 함 -->
		<div class="contentBoxs" id="contentSlider">
			<c:forEach var="j" begin="3" end="5">
				<div class="contentBoxsSet" id="contentBoxSet"><!-- 큰 박스 3번 반복 -->
					<c:forEach var="i" begin="${j*5}" end="${(j+1)*5-1}"><!-- 작은 박스안에 5개씩 -->
						<c:if test="${!empty classList[i]}"><!-- 비어있으면 출력 안함 --><!-- 이녀석을 기준으로 클래스 불러와야 함 -->
							<a href="${contextPath}/detailedPage?classNo=${classList[i].classNo}" class="contentBox"> 
								<c:if test="${classList[i].classPhoto == 'PHOTO URL'}">
									<img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
								</c:if>
								<c:if test="${classList[i].classPhoto != 'PHOTO URL'}">
									<img src="${contextPath}${classList[i].classPhoto}">
									${contextPath}${classList[i].classPhoto}
								</c:if>
								<div class="contentTitle">${classList[i].className}</div>
								<div class="contentAuthor">${classList[i].memberNickname}</div>
								<div class="contentStars"><span class="star">★</span> <span>(${classList[i].score})</span> <span><i class="fa-solid fa-users"></i> ${classList[i].reviews}</span></div>
								<div class="contentPrice"><fmt:formatNumber value="${classList[i].classPrice}" pattern="#,###원" /></div>
							</a>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		<div class="slideButton fa-solid fa-chevron-left" id="leftButton"></div>
		<div class="slideButton fa-solid fa-chevron-right" id="rightButton"></div>
	</div>

	<div class="contentWrapper gridBox">
		<div>
			<div class="gridBoxTitle">수강후기</div>
			<div class="gridBoxContents">
				<ul>
					<c:forEach var="review" items="${reviewList}">
						<li>
							<a href="#">
								<div class="gridBoxContentUpper">
									<div>
									<c:if test="${empty review.profileImage}">
										<img src="${contextPath}/resources/img/profile_default_removebg.png">
									</c:if>
									<c:if test="${!empty review.profileImage}">
										<img src="${contextPath}${review.profileImage}">
									</c:if>
										<span class="memberNickname">${review.memberNickname}</span>
									</div>
									<c:if test="${empty review.updateDate}">
									<span class="writeDate">${item.createdDate}</span>
									</c:if>
									<c:if test="${!empty review.updateDate}">
									<span class="writeDate">${review.updateDate}</span>
									</c:if>
									<div class="gridBoxSub">
										<span class="star">★</span><span class="comment">${review.reviewStar}</span>
										<span><i class="fa-regular fa-thumbs-up"></i> ${review.thumbs}</span>
									</div>
								</div>
								<div class="gridBoxContentLower">
									<span class="boardTitle">${review.boardContent}</span>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div>
			<div class="gridBoxTitle">Best Sellers</div>
			<div class="gridBoxContents">
				<div id="gridFade">
					<div class="gridFadecontentBox">
						<img
							src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
						<div class="contentTitle">50만 어쩌구</div>
						<div class="contentAuthor">홍길동</div>
						<div class="contentStars">
							★ (<span>3.9</span>)
						</div>
						<div class="contentPrice">160,000원</div>
					</div>
					<div class="gridFadecontentBox">
						<img
							src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F9d277aa56493ec815c5a2b0e6803bf20352e4f1e.png&w=640&q=75">
						<div class="contentTitle">50만 어쩌구</div>
						<div class="contentAuthor">홍길동</div>
						<div class="contentStars">
							★ (<span>3.9</span>)
						</div>
						<div class="contentPrice">160,000원</div>
					</div>
					<div class="gridFadecontentBox">
						<img
							src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
						<div class="contentTitle">50만 어쩌구</div>
						<div class="contentAuthor">홍길동</div>
						<div class="contentStars">
							★ (<span>3.9</span>)
						</div>
						<div class="contentPrice">160,000원</div>
					</div>
				</div>
				<div id="gridFadeController">
					<ul>
						<li id="fadeLeft">&lt;</li>
						<li><span id="currentPage">1</span> / <span id="pages">4</span></li>
						<li id="fadeRight">&gt;</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="contentWrapper gridBox">
		<div>
			<div class="gridBoxTitle">같이 공부해요!</div>
			<div class="gridBoxContents">
				<ul>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<i class="fa-solid fa-users"></i><span class="comment">1/4</span>
								<i class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<i class="fa-solid fa-users"></i><span class="comment">1/4</span>
								<i class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<i class="fa-solid fa-users"></i><span class="comment">1/4</span>
								<i class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<i class="fa-solid fa-users"></i><span class="comment">1/4</span>
								<i class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<i class="fa-solid fa-users"></i><span class="comment">1/4</span>
								<i class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div>
			<div class="gridBoxTitle">궁금해요!</div>
			<div class="gridBoxContents">
				<ul>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<span class="unsolved">미해결</span> <i
									class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<span class="unsolved">미해결</span> <i
									class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<span class="unsolved">미해결</span> <i
									class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<span class="solved">해결</span> <i
									class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
					<li>
						<div class="gridBoxContentUpper">
							<div>
								<img
									src="${contextPath}/resources/img/profile_default_removebg.png">
								<span class="memberNickname">홍길동</span>
							</div>
							<span class="writeDate">2024-07-08</span>
							<div class="gridBoxSub hashtagBox">
								<div>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
									<span class="hashtag">#SQL</span> <span class="hashtag">#SQL</span>
								</div>
							</div>
						</div>
						<div class="gridBoxContentLower">
							<span class="boardTitle">집에 가고 싶은 사람 모여라</span>
							<div class="gridBoxSub">
								<span class="solved">해결</span> <i
									class="fa-regular fa-thumbs-up"></i><span class="comment">2</span>
								<i class="fa-regular fa-eye"></i><span class="participants">5</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<link rel="stylesheet" href="${contextPath}/resources/css/pages/mainPage.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common/slider.css">

	<script src="${contextPath}/resources/js/pages/mainPage.js"></script>
	<script src="${contextPath}/resources/js/common/slider.js"></script>
</body>

</html>