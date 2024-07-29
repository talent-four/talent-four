<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="sideP">  <!-- 사이드-->
	<div class="side-topP"> <!-- 사이드 위쪽-->
	   <div>
	       <img src="${loginMember.memberProfile}" id="profile-imgP"> <!-- 사이드 프로필 사진 -->
	    </div>
	    <div>
	        <span id="profile-idP">${loginMember.memberNickname}</span>
	        <span>튜터</span>
	    </div>
	</div>
	<div class="side-bottomP"> <!-- 사이드 아래쪽-->
	   <div class="side-categoryP"> <!-- 카테고리 전체-->
	       <div class="activeP"> <!-- 카테고리 1 -->
	           <a href="${contextPath}/tutor/dashboard"><span><i class="fa-solid fa-box"></i>대시보드</span></a>
	       </div>
	       <div class="activeP"> <!-- 카테고리 2 -->
	           <a href="${contextPath}/tutor/profile"><span><i class="fa-solid fa-user"></i>내 프로필</span></a>
	       </div>
	       <div class="activeP"> <!-- 카테고리 3 -->
	           <a href="${contextPath}/tutor/classes"><span><i class="fa-solid fa-folder-open"></i>클래스 관리</span></a>
	       </div>
	       <div class="activeP"> <!-- 카테고리 4 -->
	           <a href="${contextPath}/tutor/classessell"><span><i class="fa-solid fa-clipboard-list"></i>클래스 판매 현황</span></a>
	       </div>
	       <div class="activeP"> <!-- 카테고리 6 -->
	           <a href="${contextPath}/tutor/calculate?cp=1"><span><i class="fa-regular fa-money-bill-1"></i>정산 신청</span></a>
	       </div>
	    </div>
	</div>
</section>