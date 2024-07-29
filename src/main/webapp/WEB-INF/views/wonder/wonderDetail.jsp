<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .board-detail {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .board-detail h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .board-detail .info {
            margin-bottom: 15px;
        }
        .board-detail .info label {
            font-weight: bold;
        }
        .board-detail .info p {
            margin: 0;
        }
        .board-detail .content {
            margin-top: 20px;
        }
        .board-detail .back-link {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .board-detail .back-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
 <h1>궁금해요</h1>
    <div class="board-detail">
       

        <div class="info">
            <label for="boardNo">Board Number:</label>
            <p id="boardNo">${board.boardNo}</p>
        </div>
        <div class="info">
            <label for="boardTitle">Title:</label>
            <p id="boardTitle">${board.boardTitle}</p>
        </div>
        <div class="info">
            <label for="createDate">Creation Date:</label>
            <p id="createDate">${board.createDate}</p>
        </div>
        <div class="info">
            <label for="memberNickname">Member Nickname:</label>
            <p id="memberNickname">${board.memberNickname}</p>
        </div>
        <div class="info">
            <label for="qaStatus">QA Status:</label>
            <p id="qaStatus">${board.qaStatus}</p>
        </div>
        <div class="content">
            <label for="boardContent">Content:</label>
            <p id="boardContent">${board.boardContent}</p>
        </div>

        <a href="${contextPath}/wonder/free" class="back-link">목록으로</a>
    </div>

</body>
</html>
