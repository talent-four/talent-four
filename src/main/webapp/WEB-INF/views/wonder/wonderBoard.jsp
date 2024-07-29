<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>궁금해요!</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/wonderBoard/wonderBoard.css">
    <!-- CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   
    <main class="wonder-main" id="wonder-main">
        <h1>궁 금 해 요 !!</h1>
        <section id="wonder-top">
            <div class="bestQ">
              
              <h2>가장 많이 한 질문 BEST 10</h2>
                <ul>

                    <li><a href="#">1 공부방법에 고민이 있어요</a></li>
                    <li><a href="#">2 공부방법에 고민이 있어요</a></li>
                    <li><a href="#">3 공부방법에 고민이 있어요</a></li>
                    <li><a href="#">4 공부방법에 고민이 있어요</a></li>
                    <li><a href="#">5 공부방법에 고민이 있어요</a></li>
                  
                </ul>
                <ul class="more">
                        <li><a href="#">&lt; </a><span>1</span></li>
                        <li>/ <span>2</span><a href="#">&gt;</a></li>
                </ul>

            </div>
            <div class="wonder-btn">
                <button id="classBtn" onclick="location.href='&type=${param.type}&cp=${cp}">강의가 궁금해요</button>
                <button id="freeBtn">자유로운 궁금증</button>
            </div>
            <div class="wonder-bestTag">
                <h3>인기태그</h3>
                <div>
                <a herf="#">SQL</a>
                <a herf="#">SQL</a>
                <a herf="#">SQL</a>
                <a herf="#">java</a>
                <a herf="#">java</a>
                </div>
                <div>
                    <a herf="#">SQL</a>
                    <a herf="#">SQL</a>
                    <a herf="#">SQL</a>
                    <a herf="#">java</a>
                    <a herf="#">java</a>
                </div>
                
            </div>

        </section>
        <section class="wonder-section">
            <form name="wonder-form"class="wonder-form">
                <div class="wonder-search-item">
                <fieldset>
                <i class="fa-solid fa-magnifying-glass wonder-icon"></i>
                <input type="text"  placeholder="제목과 내용을 검색해 보세요" name="wonderBoard" id="wonder-search">
                 </fieldset>
                <button id="woder-serachBtn">검색</button>    
                </div>
                <div class="wonder-search-item">
                <fieldset>
                    <i class="fa-solid fa-tag wonder-icon"></i>
                    <input type="text"  placeholder="태그를 입력하세요" name="wonderBoard" id="wonder-search">
                     </fieldset>
               
               <button type="reset" class="wonder-restBtn"><i class="fa-solid fa-rotate">검색어초기화</i> </button> 
               </div>
            </form>
            
        </section>
        <section class="wonder-section2">
            <h2 class="wonder-top">자유로운 궁금증</h2>
            <div class=wonder-notice>
                    <h2>제목제목제목제목 <span class="noice-st">해결</span></h2>
                    <p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
                    <div class="wonder-Tag">
                    <span>SQL</span>
                    </div>
                    <div class="wonder-count">
                    <span>닉네임 </span>
                    <span>2시간전</span>
                    <ul>
                    <li>조회수 0</li>
                    <li>추천수 0</li>
                    <li>답변수 0</li>
                    </ul>
                    </div>
                </div>
            </div>
            <div class=wonder-notice>
                <h2>제목제목제목제목 <span class="noice-st2">미해결</span></h2>
                <p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
                <div class="wonder-Tag">
                <span>SQL</span>
                </div>
                <div class="wonder-count">
                <span>닉네임 </span>
                <span>2시간전</span>
                <ul>
                <li>조회수 0</li>
                <li>추천수 0</li>
                <li>답변수 0</li>
                </ul>
                </div>
            </div>
        </div>
            <div class=wonder-notice>
                <h2>제목제목제목제목 <span class="noice-st">해결</span></h2>
                <p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
                <div class="wonder-Tag">
                <span>SQL</span>
                </div>
                <div class="wonder-count">
                <span>닉네임 </span>
                <span>2시간전</span>
                <ul>
                <li>조회수 0</li>
                <li>추천수 0</li>
                <li>답변수 0</li>
                </ul>
                </div>
            </div>
        </div>
    
        <a href="#" class="addmore">더보러가기</a>

        <!-- 강의가 궁금해요 -->

            <h2 class="wonder-top">강의가 궁금해요</h2>
            <div class=wonder-notice>
                    <h2>제목제목제목제목 <span class="noice-st">해결</span></h2>
                    <p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
                    <div class="wonder-Tag">
                    <span>SQL</span>
                    </div>
                    <div class="wonder-count">
                    <span>닉네임 </span>
                    <span>2시간전</span>
                    <ul>
                    <li>조회수 0</li>
                    <li>추천수 0</li>
                    <li>답변수 0</li>
                    </ul>
                    </div>
                </div>
            </div>
            <div class=wonder-notice>
                <h2>제목제목제목제목 <span class="noice-st">해결</span></h2>
                <p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
                <div class="wonder-Tag">
                <span>SQL</span>
                </div>
                <div class="wonder-count">
                <span>닉네임 </span>
                <span>2시간전</span>
                <ul>
                <li>조회수 0</li>
                <li>추천수 0</li>
                <li>답변수 0</li>
                </ul>
                </div>
            </div>
        </div>
            <div class=wonder-notice>
                <h2>제목제목제목제목 <span class="noice-st">해결</span></h2>
                <p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
                <div class="wonder-Tag">
                <span>SQL</span>
                </div>
                <div class="wonder-count">
                <span>닉네임 </span>
                <span>2시간전</span>
                <ul>
                <li>조회수 0</li>
                <li>추천수 0</li>
                <li>답변수 0</li>
                </ul>
                </div>
            </div>
        </div>
    
        <a href="#" class="addmore">더보러가기</a>

        </section>
    
        <div>
            <a href="#wonder-main" class="wonderTopBtn">TOP</a>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/wonder/wonder.js"></script>
</body>
</html>