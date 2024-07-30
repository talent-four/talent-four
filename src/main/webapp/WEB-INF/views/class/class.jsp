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
	<script src = 'https://www.youtube.com/iframe_api'></script>
	
</head>
<body>
    <div class="wrapper">
        <div id="leftSide">
            <div class="leftSideWrapper">
                <div class="logo">
                    <a href="${contextPath}"><img src="${contextPath}/resources/img/logo2.png"></a>
                </div>
                <div class="title">
                    <span id="classTitle">${classInfo.className }</span>
                </div>
                <button id="sideBarBtn">
                    &gt;
                </button>
            </div>
            <div id="player">
            	<div id="selectIndex">목차를 선택해주세요.</div>
            </div>
        </div>
    	
        <div id="rightSide">
            <div class="index">
                <h1>목차</h1>
                <div>
                    ${classInfo.className }<br>
                    총 <span id="totalClassCount"></span>강
                </div>
            </div>
            <div id="subClassScroll">
            </div>
        </div>
    </div>
    <script>
    	const classUrl = "${classInfo.classUrl}";
    </script>
    <script src="${contextPath}/resources/js/pages/class.js"></script>
</body>
</html>