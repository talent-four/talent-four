<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="width-1280px flex">
	    <div class="topHeader">
	        <div>
	            <a href="${contextPath}" id = "logo"><img src="${contextPath}/resources/img/logo2.png"></a>
	        </div>
	        <div id="categoryBar">
	            <ul>
	                <li><a href="${contextPath}/classPage/all">클래스</a></li>
	                <li><a href="${contextPath}/groupMain">스터디 모집</a></li>
	                <li><a href="${contextPath}/review">수강 후기</a></li>
	                <li><a href="">궁금해요</a></li>
	            </ul>
	        </div>
	        <input type="text" id="searchBar" placeholder="재능을 입력해주세요.">
	    </div>
	    
		<ul id="loginBox">
			<c:choose>
				<c:when test="${empty sessionScope.loginMember}">
					<li>
						<a href="${contextPath}/member/login">로그인</a>
					</li>
					<li>
						<a href="${contextPath}/member/signUp">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="#">${loginMember.memberNickname}님</a>
					</li>
					<li class="fa-solid fa-bars" id="headerBoxBtn"></li>
				</c:otherwise>
			</c:choose>
		</ul>
	    <ul id="headerBox">
	        <li><a href="${contextPath}/mypage">마이 프로필</a></li>
	        <li><a href="${contextPath}/tutor/dashboard">튜터 프로필</a></li>
	        <li><a href="${contextPath}/member/logout">로그아웃</a></li>
	    </ul>
	</div>
</header>
<link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
<script src="${contextPath}/resources/js/common/hf.js"></script>