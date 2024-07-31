<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div>
        <div id="choice-location"><span>지역 선택<i class="fa-solid fa-angle-down"></i></span></div>
        <div id="choice-status"><span>진행 방식<i class="fa-solid fa-angle-down"></i></span></div>
    </div>
    <div id="hidden-area">
        <form action="groupMain" id="select" method="post">
            <div id="hidden-location-area">
                <ul>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="서울"><span>서울</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="부산"><span>부산</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="인천"><span>인천</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="광주"><span>광주</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="울산"><span>울산</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="대전"><span>대전</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="대구"><span>대구</span>
                    </li>
                    <li class="locationDiv">
                        <input type="radio" class="location" name="location" value="경기"><span>경기</span>
                    </li>
                </ul>
                <button id="search-location">검색하기</button>
            </div>
            <div id="hidden-type-area">
                <ul>
                    <li class="typeDiv">
                        <input type="radio"><span>온라인</span>
                    </li>
                    <li class="typeDiv">
                        <input type="radio"><span>오프라인</span>
                    </li>
                </ul>
                <button id="search-type">검색하기</button>
            </div>
        </form>
    </div>
    <fieldset>
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="search" placeholder="제목, 글 내용을 검색해보세요">
    </fieldset>
</section>