<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review</title>
    <!-- css, js, header 다 넣어서 사용해주세요 -->

    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/review/review.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">


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
            <form action="#">
                <div class="searchBox">
                    <input type="text" name="search">
                    <button class="fa-solid fa-magnifying-glass"></button>
                </div>
            </form>
        </div>
        <div id="main-box">
            <div class="content">
                <div class="titlebox">
                    <span class="title">HAPPY 강의</span>
                    <div class="updateBtn">수정하기</div>
                    <span class="lecturer">강사</span>
                    <span class="name">강사명</span>
                    <div class="recommend-btn">추천</div>
                    <div class="declaration-btn">신고</div>
                </div>
                <div class="classimgcontainer">
                    <img src="../../img/img4.png" class="classimg">
                </div>
                <div class="reviewcontentbox">
                    <div class="reviewtitle">
                        <img src="../../img/img1.jpg" class="profileimg">
                        <div class="name1">
                            <div class="reviewer">황건하(wh****)</div>
                            <div class="reviewScore">
                                <div class="star" style="color:gold">★★★★★</div>
                                <div class="starnum">(5.0)</div>
                            </div>
                        </div>
                        <div class="title1">
                            <div class="title1-reviewtitle">초보자가 듣기에 진짜 개별로긴함</div>
                            <div class="title1-reviewsubtitle">
                                <div class="title1-reviewsubtitle-date color626262">작성일 2022.12.12</div>
                                <div class="title1-reviewsubtitle-recommend color595959">추천 12</div>
                                <div class="title1-reviewsubtitle-report color595959">신고 2</div>
                            </div>
                        </div>
                    </div>
                    <div class="contentbox">
                        <div class="reviewcontext">우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을
                            다할 것입니다. 우리는 여기에 대해 매우 흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰
                            영감을 주는 일이 될 것입니다.
                            우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을 다할 것입니다. 우리는 여기에 대해 매우
                            흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰 영감을 주는 일이 될 것입니다.
                            우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을 다할 것입니다. 우리는 여기에 대해 매우
                            흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰 영감을 주는 일이 될 것입니다.
                        </div>
                        <div class="reviewtag">#강사님이 친절해요</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="main-box">
            <div class="content">
                <div class="titlebox">
                    <span class="title">HAPPY 강의</span>
                    <span class="lecturer">강사</span>
                    <span class="name">강사명</span>
                </div>
                <img src="../../img/class.jpg" class="classimg">
                <div class="reviewcontentbox">
                    <div class="reviewtitle">
                        <img src="../../img/img1.jpg" class="profileimg">
                        <div class="name1">
                            <div class="reviewer">황건하(wh****)</div>
                            <div class="reviewScore">
                                <div class="star" style="color:gold">★★★★★</div>
                                <div class="starnum">(5.0)</div>
                            </div>
                        </div>
                        <div class="title1">
                            <div class="title1-reviewtitle">초보자가 듣기에 진짜 개별로긴함</div>
                            <div class="title1-reviewsubtitle">
                                <div class="title1-reviewsubtitle-date color626262">작성일 2022.12.12</div>
                                <div class="title1-reviewsubtitle-recommend color595959">추천 12</div>
                                <div class="title1-reviewsubtitle-report color595959">신고 2</div>
                            </div>
                        </div>
                    </div>
                    <div class="contentbox">
                        <div class="reviewcontext">우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을
                            다할 것입니다. 우리는 여기에 대해 매우 흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰
                            영감을 주는 일이 될 것입니다.
                            우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을 다할 것입니다. 우리는 여기에 대해 매우
                            흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰 영감을 주는 일이 될 것입니다.
                            우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을 다할 것입니다. 우리는 여기에 대해 매우
                            흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰 영감을 주는 일이 될 것입니다.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="main-box">
            <div class="content">
                <div class="titlebox">
                    <span class="title">HAPPY 강의</span>
                    <span class="lecturer">강사</span>
                    <span class="name">강사명</span>
                </div>
                <img src="../../img/class.jpg" class="classimg">
                <div class="reviewcontentbox">
                    <div class="reviewtitle">
                        <img src="../../img/img1.jpg" class="profileimg">
                        <div class="name1">
                            <div class="reviewer">황건하(wh****)</div>
                            <div class="reviewScore">
                                <div class="star" style="color:gold">★★★★★</div>
                                <div class="starnum">(5.0)</div>
                            </div>
                        </div>
                        <div class="title1">
                            <div class="title1-reviewtitle">초보자가 듣기에 진짜 개별로긴함</div>
                            <div class="title1-reviewsubtitle">
                                <div class="title1-reviewsubtitle-date color626262">작성일 2022.12.12</div>
                                <div class="title1-reviewsubtitle-recommend color595959">추천 12</div>
                                <div class="title1-reviewsubtitle-report color595959">신고 2</div>
                            </div>
                        </div>
                    </div>
                    <div class="contentbox">
                        <div class="reviewcontext">우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을
                            다할 것입니다. 우리는 여기에 대해 매우 흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰
                            영감을 주는 일이 될 것입니다.
                            우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을 다할 것입니다. 우리는 여기에 대해 매우
                            흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰 영감을 주는 일이 될 것입니다.
                            우리는 이 행동을 계속해야 합니다. 우리는 진정한 의지를 발휘하고 있으며, 우리는 최대의 성취를 이루기 위해 최선을 다할 것입니다. 우리는 여기에 대해 매우
                            흥분하고 있으며, 우리는 그것을 통해 큰 성과를 이룰 수 있을 것이라고 확신하고 있습니다. 그것은 우리 모두에게 큰 영감을 주는 일이 될 것입니다.
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="background-modal" hidden></div>
        <div id="write-modal" hidden>
            <div class="write-wrapper">
                <form action="#">
                    <div class="write-lecture">
                        <label for="lecture" class="selectlabel">리뷰할 강의를 골라주세요</label>
                        <select name="lecture" class="selectBox" required>
                            <option value="javascript">JavaScript</option>
                            <option value="php">PHP</option>
                            <option value="java">Java</option>
                        </select>
                    </div>
                    <div class="write-tag">
                        <div class="write-tag-question">태그를 선택해 주세요</div>
                        <div class="write-tag-select">
                            <div class="radio-button selected" data-value="1">#재밌어요</div>
                            <div class="radio-button" data-value="2">#이해하기 쉬워요</div>
                            <div class="radio-button" data-value="3">#친절해요</div>
                            <div class="radio-button" data-value="4">#구성이 알차요</div>
                            <div class="radio-button" data-value="5">#생각</div>
                            <div class="radio-button" data-value="6">#나면</div>
                            <div class="radio-button" data-value="7">#채우기</div>
                            <div class="radio-button" data-value="8">#다음에</div>
                            <div class="radio-button" data-value="9">#키워드가 없어요</div>
                            <input type="radio" name="option" value="1" id="option1" required checked hidden>
                            <input type="radio" name="option" value="2" id="option2" hidden>
                            <input type="radio" name="option" value="3" id="option3" hidden>
                            <input type="radio" name="option" value="4" id="option4" hidden>
                            <input type="radio" name="option" value="5" id="option5" hidden>
                            <input type="radio" name="option" value="6" id="option6" hidden>
                            <input type="radio" name="option" value="7" id="option7" hidden>
                            <input type="radio" name="option" value="8" id="option8" hidden>
                            <input type="radio" name="option" value="9" id="option9" hidden>
                        </div>
                    </div>
                    <div class="write-content">
                        <div class="writestarbox">
                            <div class="starsel">
                                <input type="radio" name="writestar" value="5" id="star1" required hidden><label
                                    for="star1">★ </label><input type="radio" name="writestar" value="4" id="star2"
                                    hidden><label for="star2">★ </label><input type="radio" name="writestar" value="3"
                                    id="star3" hidden><label for="star3">★ </label><input type="radio" name="writestar"
                                    value="2" id="star4" hidden><label for="star4">★ </label><input type="radio"
                                    name="writestar" value="1" id="star5" hidden><label for="star5">★ </label>
                                별점을 선택해주세요
                            </div>
                            <textarea name="writetext" cols="60" rows="6" id="writecontext" maxlength="300"></textarea>
                        </div>
                        <button id="write-btn1" type="submit">글 쓰기</button>
                        <button id="write-btn2" type="button">취소</button>
                </form>
            </div>
        </div>
    </main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script src="${contextPath}/resources/js/review/review.js"></script>
</body>

</html>