<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>재능사조</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>

<body>
    <header>
        <div class="width-1280px">
            <div class="topHeader">
                <div>
                    <a href="categoryPage.jsp">재능사조</a>
                    <input type="text" id="searchBar" placeholder="재능을 입력해주세요.">
                </div>
                <div>
                    <div>로그인</div>
                    <div>회원가입</div>
                </div>
            </div>
            <div class="bottomHeader">
                <div id="showCategoryBar">
                    <div class="fa-solid fa-bars"></div>
                    <div>카테고리</div>
                </div>
                <div>실시간 HOT</div>
                <div>주간 베스트</div>
            </div>
        </div>
        <div class="categoryBar">
            <div class="categoryBarDetail width-1280px margin-auto">
                <div class="categoryDetail">
                    <span>실무·취업·자기계발</span>
                    <a href="/WEB-INF/views/categoryPage.jsp">직무역량</a>
                    <a href="">필수역량</a>
                    <a href="">자기계발</a>
                    <a href="">취업·이직</a>
                </div>
                <div class="categoryDetail">
                    <span>데이터·개발</span>
                    <a href="">데이터·개발</a>
                    <a href="">개발·테크</a>
                    <a href="">데이터</a>
                </div>
                <div class="categoryDetail">
                    <span>재테크·투자</span>
                    <a href="">재테크</a>
                    <a href="">투잡·창업</a>
                </div>
                <div class="categoryDetail">
                    <span>드로잉·사진·글</span>
                    <a href="">글쓰기</a>
                    <a href="">사진</a>
                    <a href="">드로잉·미술</a>
                </div>
            </div>
        </div>
    </header>

    <div class="infinitySlider contentWrapper">
        <ul>
            <li><img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fo3ijr2dg7vo_2023-12-11.png&w=3840&q=75"></li>
            <li><img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fvc98xurw36m_2024-05-21.png&w=3840&q=75"></li>
            <li><img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fo3ijr2dg7vo_2023-12-11.png&w=3840&q=75"></li>
            <li><img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fd14w7j944shu9e.cloudfront.net%2Fonsite%2Fmedia%2Fbanner%2Fvc98xurw36m_2024-05-21.png&w=3840&q=75"></li>
        </ul>
    </div>

    <div class="slideContentWrapper contentWrapper">
        <div class="contentHeader">
            <div class="contentHeaderTitle">주간 베스트 TOP20</div>
            <div class="contentHeaderShowAll">모두보기</div>
        </div>
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
            <div class="contentBoxsSet">
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
            <div class="contentBoxsSet">
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
                    <div class="contentPrice">300,000원</div>
                </div>
            </div>
        </div>
        <div class="slideButton fa-solid fa-chevron-left" id="leftButton"></div>
        <div class="slideButton fa-solid fa-chevron-right" id="rightButton"></div>
    </div>
    <div class="barContentWrapper contentWrapper">
        <div class="barContentLeft">
            <div class="barContentLeftTitle">실시간 랭킹 TOP 100</div>
            <div class="barContentLeftSubtitle">현재 가장 핫한 클래스를 만나보세요.</div>
        </div>
        <div class="barContentRight">
            <div class="barContentBox">
                <div class="rank">1</div>
                <img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2Fad8f06abc4beb3f6c92bdb99d852618174dd7ecd.png&w=640&q=75"
                    alt="">
                <div class="barContentText">
                    <div class="barContentTitle">쏘피 튜터</div>
                    <div class="barContentsubTitle">회사에서 안 알려주는 진짜 현장 엑셀<실무 완성>
                    </div>
                </div>
            </div>
            <div class="barContentBox">
                <div class="rank">2</div>
                <img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2Fad8f06abc4beb3f6c92bdb99d852618174dd7ecd.png&w=640&q=75"
                    alt="">
                <div class="barContentText">
                    <div class="barContentTitle">쏘피 튜터</div>
                    <div class="barContentsubTitle">회사에서 안 알려주는 진짜 현장 엑셀<실무 완성>
                    </div>
                </div>
            </div>
            <div class="barContentBox">
                <div class="rank">3</div>
                <img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2Fad8f06abc4beb3f6c92bdb99d852618174dd7ecd.png&w=640&q=75"
                    alt="">
                <div class="barContentText">
                    <div class="barContentTitle">쏘피 튜터</div>
                    <div class="barContentsubTitle">회사에서 안 알려주는 진짜 현장 엑셀<실무 완성>
                    </div>
                </div>
            </div>
            <div class="barContentBox">
                <div class="rank">4</div>
                <img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2Fad8f06abc4beb3f6c92bdb99d852618174dd7ecd.png&w=640&q=75"
                    alt="">
                <div class="barContentText">
                    <div class="barContentTitle">쏘피 튜터</div>
                    <div class="barContentsubTitle">회사에서 안 알려주는 진짜 현장 엑셀<실무 완성>
                    </div>
                </div>
            </div>
            <div class="barContentBox">
                <div class="rank">5</div>
                <img src="https://www.taling.me/_next/image?url=https%3A%2F%2Fimg.taling.me%2FContent%2FUploads%2FImages%2Fad8f06abc4beb3f6c92bdb99d852618174dd7ecd.png&w=640&q=75"
                    alt="">
                <div class="barContentText">
                    <div class="barContentTitle">쏘피 튜터</div>
                    <div class="barContentsubTitle">회사에서 안 알려주는 진짜 현장 엑셀<실무 완성>
                    </div>
                </div>
            </div>
            <div class="barContentMore">
                <div>실시간 랭킹 더보기 ></div>
            </div>
        </div>
    </div>
    <div class="slideContentWrapper contentWrapper">
        <div class="contentHeader">
            <div class="contentHeaderTitle">주간 베스트 TOP20</div>
            <div class="contentHeaderShowAll">모두보기</div>
        </div>
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
            <div class="contentBoxsSet">
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
            <div class="contentBoxsSet">
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
        <div class="slideButton fa-solid fa-chevron-left" id="leftButton"></div>
        <div class="slideButton fa-solid fa-chevron-right" id="rightButton"></div>
    </div>
    <div class="slideContentWrapper contentWrapper">
        <div class="contentHeader">
            <div class="contentHeaderTitle">주간 베스트 TOP20</div>
            <div class="contentHeaderShowAll">모두보기</div>
        </div>
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
            <div class="contentBoxsSet">
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
            <div class="contentBoxsSet">
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
        <div class="slideButton fa-solid fa-chevron-left" id="leftButton"></div>
        <div class="slideButton fa-solid fa-chevron-right" id="rightButton"></div>
    </div>
    <footer>
        <P>통신판매 신고번호 : 1234-서울강남-12345<br>
            상호 : 재능사조<br>
            주소 : 서울특별시 강남구 역삼역<br>
            고객센터 : 1234-1234 <br>
            
            (주) 재능사조는 통신판개중개자로서 거래 당사자가 아니므로, 튜터가 등록한 상품정보를 책임지지 않습니다.<br>
            Copyright @ 2024 Inc. All rights reserved.</P>
    </footer>
    <link rel="stylesheet" href="resources/css/mainPage.css">
    <link rel="stylesheet" href="resources/css/hf.css">
    <script src="resources/js/mainPage.js"></script>
    <script src="resources/js//slider.js"></script>
    <script src="resources/js/hf.js"></script>
</body>

</html>