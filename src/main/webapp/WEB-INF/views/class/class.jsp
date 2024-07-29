<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의화면</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/classPage/sugang.css">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
    <div class="wrapper">
        <div id="leftSide">
            <div class="leftSideWrapper">
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/img/logo2.png"></a>
                </div>
                <div class="title">
                    <span id="classTitle">굉장히 엄청난 강의 제목</span>
                </div>
                <button id="sideBarBtn">
                    &gt;
                </button>
            </div>
            <iframe id="video"></iframe>
        </div>
    	
        <div id="rightSide">
            <div class="index">
                <h1>목차</h1>
                <div>
                    강의 제목<br>
                    수강기간<br>
                    몇강 중 몇강 수강
                </div>
            </div>
            <div id="subClassScroll">
                <a class="subClass">
                    예시 목차 1
                </a>
            </div>
        </div>
    </div>
    <script src="${contextPath}/resources/js/pages/class.js"></script>
</body>
</html>