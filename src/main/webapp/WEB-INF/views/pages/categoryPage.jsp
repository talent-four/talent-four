<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/pages/categoryPage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/slider.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        <div class="headCategoryBar width-1280px margin-auto">
        <div id="chosenCategory">
            <div id="chosenCategoryButton"><span class="categoryNameDetail"></span><i class="fa-solid fa-angle-down" id="CategoryBoxdown"></i><i class="fa-solid fa-angle-up" id="CategoryBoxUp"></i></div>
            <div>초기화</div>
        </div>
        <div id="chosenCategoryName">
            <div><span id="categoryName"></span></div>
            <div><span class="categoryNameDetail"></span></div>
        </div>
        <div id="chosenCategoryMenu">
            <div>
                <h2>카테고리</h2>
            </div>
            <div id="scrollChosenCategoryMenuBox">
                <div id="scrollChosenCategoryMenu">
                    <ul>
                        <li><label>실무·취업·자기계발<input type="radio" name="category" value="실무·취업·자기계발"></label></li>
                        <li><label>데이터·개발<input type="radio" name="category" value="데이터·개발"></label></li>
                        <li><label>재테크·투잡<input type="radio" name="category" value="재테크·투잡"></label></li>
                        <li><label>드로잉·사진·글<input type="radio" name="category" value="드로잉·사진·글"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                        <li><label>더미 데이터<input type="radio" name="category" value="더미데이터"></label></li>
                    </ul>
                </div>
                <div id="chosenCategoryDetail">
                    <div id="실무·취업·자기계발" class="category">
                        <ul>
                            <li>직무역량</li>
                            <li><label><input type="radio" name="categoryDetail" value="직무역량 전체">직무역량 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="영업·MD">영업·MD</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="세무·회계·법률">세무·회계·법률</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="기획·PM">기획·PM</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="다양한 직무">다양한 직무</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="마케팅">마케팅</label></li>
                        </ul>
                        <ul>
                            <li>필수역량</li>
                            <li><label><input type="radio" name="categoryDetail" value="필수역량 전체">필수역량 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="생산성 툴">생산성 툴</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="보고서/발표">보고서/발표</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="엑셀">엑셀</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="PPT">PPT</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="직장생활·노하우">직장생활·노하우</label></li>
                        </ul>
                        <ul>
                            <li>자기 계발</li>
                            <li><label><input type="radio" name="categoryDetail" value="자기계발 전체">자기계발 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="자기 관리">자기 관리</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="인문·교양">인문·교양</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="스피치">스피치</label></li>
                        </ul>
                        <ul>
                            <li>취업·이직</li>
                            <li><label><input type="radio" name="categoryDetail" value="취업·이직">취업·이직</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="자소서·면접">자소서·면접</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="취업/이직/진로">취업/이직/진로</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="자격증·시험">자격증·시험</label></li>
                        </ul>
                    </div>
                    <div id="데이터·개발" class="category">
                        <ul>
                            <li>개발·테크</li>
                            <li><label><input type="radio" name="categoryDetail" value="개발·테크 전체">개발·테크 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="개발 공통">개발 공통</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="ML·AL">ML·AL</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="모바일">모바일</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="프론트엔드">프론트엔드</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="백엔드">백엔드</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="개발 입문">개발 입문</label></li>
                        </ul>
                        <ul>
                            <li>데이터</li>
                            <li><label><input type="radio" name="categoryDetail" value="데이터 전체">데이터 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="데이터·일반·통계">데이터·일반·통계</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="Python·R">Python·R</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="SQL">SQL</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="업무 자동화">업무 자동화</label></li>
                        </ul>
                    </div>
                    <div id="재테크·투잡" class="category">
                        <ul>
                            <li>재테크</li>
                            <li><label><input type="radio" name="categoryDetail" value="재테크 전체">재테크 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="가상 자산">가상 자산</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="금융지식">금융지식</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="주식">주식</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="부동산">부동산</label></li>
                        </ul>
                        <ul>
                            <li>투잡·창업</li>
                            <li><label><input type="radio" name="categoryDetail" value="투잡·창업 전체">투잡·창업 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="블로그·인스타">블로그·인스타</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="다양한 투잡">다양한 투잡</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="쇼핑몰">쇼핑몰</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="창업">창업</label></li>
                        </ul>
                    </div>
                    <div id="드로잉·사진·글" class="category">
                        <ul>
                            <li>글쓰기</li>
                            <li><label><input type="radio" name="categoryDetail" value="글쓰기 전체">글쓰기 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="글쓰기">글쓰기</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="출판">출판</label></li>
                        </ul>
                        <ul>
                            <li>사진</li>
                            <li><label><input type="radio" name="categoryDetail" value="사진 전체">사진 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="사진">사진</label></li>
                        </ul>
                        <ul>
                            <li>드로잉·미술</li>
                            <li><label><input type="radio" name="categoryDetail" value="드로잉·미술 전체">드로잉·미술 전체</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="취미미술">취미미술</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="디지털드로잉">디지털드로잉</label></li>
                            <li><label><input type="radio" name="categoryDetail" value="캘리그래피">캘리그래피</label></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="ChosenCategoryMenuBottom">
                <div id="filterResetBtn">
                    필터 초기화
                </div>
                <div>
                    필터 적용
                </div>
            </div>
        </div>
    </div>
    <div class="contentWrapper">
        <div class="contentBoxs" id="contentSlider">
            <div class="contentBoxsSet" id="contentBoxSet">
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
            </div>
        </div>
    </div>
    <div class="contentWrapper">
        <div class="contentBoxs" id="contentSlider">
            <div class="contentBoxsSet" id="contentBoxSet">
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
            </div>
        </div>
    </div>
    <div class="contentWrapper">
        <div class="contentBoxs" id="contentSlider">
            <div class="contentBoxsSet" id="contentBoxSet">
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
                <div class="contentBox">
                    <img
                        src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2F85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png&w=640&q=75">
                    <div class="contentTitle">50만 어쩌구</div>
                    <div class="contentAuthor">홍길동</div>
                    <div class="contentStars">★ (<span>3.9</span>)</div>
                    <div class="contentPrice">160,000원</div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <script src="${contextPath}/resources/js/pages/categoryPage.js"></script>
    <script src="${contextPath}/resources/js/common/slider.js"></script>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>

</html>