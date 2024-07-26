<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Review</title>
                <!-- css, js, header 다 넣어서 사용해주세요 -->




                <!-- JS -->
                <script src="https://code.jquery.com/jquery-3.7.1.js"
                    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
                <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
            </head>

            <body>

                <!-- header -->
                <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

                <main>
                    <div id="main-header">
                        <div class="headerbtn btn1">추천 순</div>
                        <div class="headerbtn btn2">최신 순</div>

                        <div class="headerbtn btn3">글쓰기</div>
                        <div class="searchBox">
                            <input type="text" name="search" id="searchReview">
                            <button class="fa-solid fa-magnifying-glass" id="searchReviewBtn"></button>
                        </div>
                    </div>
                    <div id="startLine">
                    </div>



                    <!-- <div id="background-modal"></div>
                    
                    <div id="write-modal">
                        <div class="write-wrapper">
                            <form action="${contextPath}/review/write" method="POST">
                                <div class="write-lecture">
                                    <label for="lecture" class="selectlabel">리뷰할 강의를 골라주세요</label>
                                    <select name="parents" class="selectBox" required>
                                    </select>
                                </div>
                                <div class="write-tag">
                                    <div class="write-tag-question">태그를 선택해 주세요</div>
                                    <div class="write-tag-select">
                                        <div class="radio-button selected" data-value="1">#친절해요</div>
                                        <div class="radio-button" data-value="2">#재밌어요</div>
                                        <div class="radio-button" data-value="3">#시간가는줄 몰라요</div>
                                        <div class="radio-button" data-value="4">#가격대비최고</div>
                                        <div class="radio-button" data-value="5">#강의 맛집</div>
                                        <div class="radio-button" data-value="6">#다음에 또 올께요</div>
                                        <div class="radio-button" data-value="7">#완강했어요</div>
                                        <div class="radio-button" data-value="8">#후회 안해요</div>
                                        <div class="radio-button" data-value="9">#고민은 시간낭비</div>
                                        <input type="radio" name="tag" value="1" id="option1" required checked
                                            hidden>
                                        <input type="radio" name="tag" value="2" id="option2" hidden>
                                        <input type="radio" name="tag" value="3" id="option3" hidden>
                                        <input type="radio" name="tag" value="4" id="option4" hidden>
                                        <input type="radio" name="tag" value="5" id="option5" hidden>
                                        <input type="radio" name="tag" value="6" id="option6" hidden>
                                        <input type="radio" name="tag" value="7" id="option7" hidden>
                                        <input type="radio" name="tag" value="8" id="option8" hidden>
                                        <input type="radio" name="tag" value="9" id="option9" hidden>
                                    </div>
                                </div>
                                <div class="write-content">
                                    <div class="writestarbox">
                                        <div class="starsel">
                                            <input type="radio" name="writeStar" value="5" id="star1" checked
                                                hidden><label for="star1">★ </label><input type="radio" name="writestar"
                                                value="4" id="star2" hidden><label for="star2">★ </label><input
                                                type="radio" name="writestar" value="3" id="star3" hidden><label
                                                for="star3">★ </label><input type="radio" name="writestar" value="2"
                                                id="star4" hidden><label for="star4">★ </label><input type="radio"
                                                name="writestar" value="1" id="star5" hidden><label for="star5">★
                                            </label>
                                            별점을 선택해주세요
                                        </div>
                                        <input type="text" placeholder="제목을 입력해주세요" id="writeTitle" name="writeTitle" maxlength="30">
                                        <textarea name="writetext" cols="60" rows="6" id="writecontext" maxlength="300"
                                            placeholder="내용을 입력해주세요"></textarea>
                                    </div>
                                    <button id="write-btn1" type="submit">글 쓰기</button>
                                    <button id="write-btn2" type="button">취소</button>
                            </form>
                        </div>
                    </div> -->


                </main>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
                <!-- CSS -->
                <link rel="stylesheet" href="${contextPath}/resources/css/review/review.css">
                <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <script type="text/javascript">
                    const memberNickname = "${loginMember.memberNickname}";
                    const memberNo = "${loginMember.memberNo}"
                    const contextPath = "${contextPath}";
                </script>
                <script src="${contextPath}/resources/js/review/review.js"></script>
            </body>

            </html>