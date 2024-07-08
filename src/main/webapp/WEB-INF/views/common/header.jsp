<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="width-1280px">
		<div class="topHeader">
			<div>
				<a href="/semi">재능사조</a> <input type="text" id="searchBar"
					placeholder="재능을 입력해주세요.">
			</div>
			<div id="loginBox">
			<c:choose>
				<%-- 로그인이 되어있지 않은 경우 --%>
				<c:when test="${empty sessionScope.loginMember}">
					<a href="${contextPath}/login">로그인</a>
					<div>회원가입</div>
				</c:when>
				
				<%-- 로그인 된 경우 --%>
				<c:otherwise>
					<div>${sessionScope.loginMember}님</div>
					<a>마이페이지</a>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="bottomHeader">
			<div id="showCategoryBar">
				<div class="fa-solid fa-bars"></div>
				<div>카테고리</div>
			</div>
			<div>실시간 HOT</div>
			<div>주간 베스트</div>
		</div>
	</div>
	<div class="categoryBar">
		<div class="categoryBarDetail width-1280px margin-auto">
			<div class="categoryDetail">
				<span>실무·취업·자기계발</span>
				<a href="${contextPath}/categoryPage">카테고리페이지</a>
				<a href="${contextPath}/class/sugang">수강페이지</a>
				<a href="">자기계발</a>
				<a href="">취업·이직</a>
			</div>
			<div class="categoryDetail">
				<span>데이터·개발</span> <a href="">데이터·개발</a> <a href="">개발·테크</a> <a
					href="">데이터</a>
			</div>
			<div class="categoryDetail">
				<span>재테크·투자</span> <a href="">재테크</a> <a href="">투잡·창업</a>
			</div>
			<div class="categoryDetail">
				<span>드로잉·사진·글</span> <a href="">글쓰기</a> <a href="">사진</a> <a
					href="">드로잉·미술</a>
			</div>
		</div>
	</div>
</header>