<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div>
        <div id="choice-location"><span>지역 선택<i class="fa-solid fa-angle-down"></i></span></div>
        <div id="choice-stuck"><span>언어 선택<i class="fa-solid fa-angle-down"></i></span></div>
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
            <div id="hidden-stack-area">
                <ul>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/javascript.svg" alt="">
                        <input type="checkbox" value="javascript"><span>JavaScript</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/typescript.svg" alt="">
                        <input type="checkbox" value="typescript"><span>TypeScript</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/react.svg" alt="">
                        <input type="checkbox" value="react"><span>React</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/svelte.svg" alt="">
                        <input type="checkbox" value="servlet"><span>Svelet</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/nextjs.svg" alt="">
                        <input type="checkbox" value="nextjs"><span>Nextjs</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/nodejs.svg" alt="">
                        <input type="checkbox" value="nodejs"><span>Nodejs</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/java.svg" alt="">
                        <input type="checkbox" value="java"><span>Java</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/spring.svg" alt="">
                        <input type="checkbox" value="spring"><span>Spring</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/nestjs.svg" alt="">
                        <input type="checkbox" value="nestjs"><span>Nestjs</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/mysql.svg" alt="">
                        <input type="checkbox" value="mysql"><span>MySql</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/mongodb.svg" alt="">
                        <input type="checkbox" value="mongodb"><span>MongoDB</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/python.svg" alt="">
                        <input type="checkbox" value="python"><span>Python</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/django.svg" alt="">
                        <input type="checkbox" value="diango"><span>Django</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/graphql.svg" alt="">
                        <input type="checkbox" value="graphql"><span>GraphQL</span>
                    </li>
                    <li class="stuckDiv">
                        <img src="${contextPath}/resources/img/group/firebase.svg" alt="">
                        <input type="checkbox" value="firebase"><span>Firebase</span>
                    </li>
                </ul>
                <div>
                    <span>최대 7개까지 선택할 수 있습니다.</span>
                    <button id="search-stack">검색하기</button>
                </div>
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