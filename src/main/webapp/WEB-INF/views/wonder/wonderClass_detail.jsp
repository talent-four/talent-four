<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>궁금해요!</title>
    <link rel="stylesheet" href="../../css/wonderBoard/wonderClass-detail.css">
    <!-- CSS -->
    <link rel="stylesheet" href="../../css/common/hf.css">
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    
          
    
    <main class="wonder-main" id="wonder-main">
            <h1>강의가 궁금해요 !!</h1>
            <div class="wonder-container">
                <form method="post">
                    <div class="wonder-detal1">
                            <select id="wonder-classSelect" name="wonder-classSelect"> 
                                <option value="Wclass1">강의 선택</option>
                                <option value="Wclass2">강의1</option>
                                <option value="Wclass3">강의231</option>
                                <option value="Wclass4">강의133</option>
                                <option value="Wclass5">강의144</option>
                            </select>
                            <div>
                            <label for="private">비밀글 설정</label>
                            <input type="checkbox" id="private" name="private">
                            </div>
                        </div>
                        
                        <input type="text" id="title" name="title" placeholder="제목을 입력하세요.">
                        <input type="text" id="tags" name="tags" placeholder="#태그입력(10글자이하,띄어쓰기대신-사용)">
                        <textarea id="content" name="content" placeholder="내용입력"></textarea>

                    <div class="wonder-button">
                        <button type="submit" class="register-btn">등록</button>
                        <button type="button" class="cancel-btn">취소</button>
                    </div>

                </form>
             </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>