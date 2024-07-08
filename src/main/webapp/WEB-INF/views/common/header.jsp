<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="width-1280px">
        <div class="topHeader">
            <div>
                <a href="${contextPath}" id = "logo"><img src="${contextPath}/resources/img/logo2.png" alt=""></a>
            </div>
            <div id="categoryBar">
                <ul>
                    <li><a href="">클래스</a></li>
                    <li><a href="">스터디 모집</a></li>
                    <li><a href="">수강 후기</a></li>
                    <li><a href="">궁금해요</a></li>
                </ul>
            </div>
            <input type="text" id="searchBar" placeholder="재능을 입력해주세요.">
            <ul>
                <li>
                    <a href="#">로그인</a>
                </li>
                <li>
                    <a href="#">회원가입</a>
                </li>
            </ul>
            
        </div>
    </div>
</header>