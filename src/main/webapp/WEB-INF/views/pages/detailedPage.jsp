<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세페이지</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/pages/detialedPage.css">
     	
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6e9a783fd9.js" crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	${classInfo.tutorInfo[0]}
	${classInfo.tutorInfo[1]}

	<c:set var="classInfo" value="${classInfo.classDetail}"></c:set>
 	
   	<main id="detailed">
        <section class="upper">
            <div class="upperWrapper">
            	<c:if test="${classInfo.classPhoto != 'PHOTO URL'}">
            		<img src="${contextPath}${classInfo.classPhoto}">
            	</c:if>
           		<c:if test="${classInfo.classPhoto == 'PHOTO URL'}">
            		<img src="https://img.taling.me/Content/Uploads/Images/85b0d8ca8eb43e350b84487b3fb7783d9ef84215.png">
            	</c:if>
                <div class="classInfo">
                    <div class="classCategory"><span>${classInfo.main}</span> / <span>${classInfo.sub}</span></div>
                    <div class="classTitle">${classInfo.className}</div>
                    <div class="classEvaluation">★ (${classInfo.score}) / <span><i class="fa-solid fa-users"></i> ${classInfo.reviews}</span></div>
                    <div class="classTeacher">${classInfo.memberNickname} 튜터</div>
                </div>
            </div>
            <nav class="detailedNav">
            ${currUrl}
                <ul>
                    <li><a href="">클래스 소개</a></li>
                    <li><a href="">튜터 소개</a></li>
                    <li><a href="#dp-review">리뷰<span class="nav-min-15">15</span></span></a></li>
                </ul>
            </nav>
        </section>
		
        <section class="lower">
            <div class="introduceBox">
                <section class="classDetailBox">
                    <pre id="classDetail">
센스 있는 한 문장을 쓰고 싶은 분을 위한 오리지널 VOD
총 25강, 약 3시간 PLAY
3개월 무제한 시청, Q&A 가능


<strong>센스 있는 한 문장을 완성해보세요</strong>

왜 내가 쓴 글은 재미가 없을까?



수많은 유행어와 베스트 댓글, 클릭을 부르는 제목처럼

알아서 잘 딱 깔끔하고 센스 있는 문장을 쓰고 싶나요?

걱정하지 마세요! 센스 있는 글쓰기는 결코 타고나는 게 아니랍니다.

차근차근 수업 속 내용을 듣다 보면 여러분도 어느새

'의미를 명확하게 전달하는 유쾌한 한 줄'을 쓸 수 있게 될 거예요.





<strong>평범한 문장 속에서 빛나는 카피를 찾아보세요!</strong>



📋 누구나 카피라이터가 될 수 있어요

가던 길을 멈추게 하고 이마를 탁! 치게 하는 글을 떠올려보세요.

생각보다 멋지고 아름다운 문장이 아닐 수도 있어요.

'JUST DO IT' 그냥 하라는 유명 스포츠 브랜드의 슬로건도,

'투명은 안심이다' 투명한 것이 안심된다는 구강청결제 광고 문구도

사실은 일상적으로 쓰던 말, 당연한 말, 조금은 엉뚱하게 느껴지는 말이거든요.

익숙한 문장을 낯설게 바라보는 순간, 우리는 모두 카피라이터가 될 수 있어요.



💖 평범한 단어나 헛소리로 매력적인 카피 쓰는 법!

어떻게 할 수 있냐고요? 이번 클래스에서 전부 알려드릴게요.

유쾌한 '헛소리' 속에서 근사한 '카피'를 찾아내는 새로운 시선을 선사해드립니다.

일상적인 단어나 헛소리 같은 문장도 어떻게 보느냐에 따라

매력적인 카피가 될 수 있다는 걸 알게 될 거예요.





<strong>여러분도 카피라이터가 되어보세요</strong>

현직 카피라이터의 작업 비법 공개

수많은 브랜드를 담당한 카피라이터의 생생한 인사이트가 궁금하신가요?

광고 대행사에서 현직 카피라이터로 일하면서 얻은 값진 경험을 모두 공유합니다!

어디에서도 들을 수 없었던 매력적인 문장 작성법을 알아보세요👍



100가지 풍부한 예제로 배우는 실전 글쓰기

이번 클래스에는 약 100가지의 풍부한 예시가 준비되어 있어요.

카피 쓰기의 시행착오 과정부터 인사이트를 찾는 방법까지,

다양한 예제를 참고해 나만의 영감을 찾아보세요.

충분히 연습할 수 있도록 응용 과제까지 모두 포함되어 있답니다.

이제 펜을 손에 쥐고, 카피라이터가 될 시간입니다!



<strong>이승용 튜터와 함께해요</strong>



<strong>"헛소리로 똑소리 나는 센스쟁이가 되세요!"</strong>



이승용 튜터

카피라이터



✅경력 사항

- 現 대기업 계열 C 광고대행사 카피라이터

- 現 팟캐스트 ‘술 마시며 시 읽는, 시시알콜’ 진행

- 前 MBC라디오 표준FM <잠 못 드는 이유 강다솜입니다> 고정 패널 (2019.10~2020.03)



📕저서

-『헛소리의 품격: 아이디어를 찾는 카피라이터의 유쾌한 발상』(2021)

-『시시콜콜 시詩알콜』(2017)



🏆수상 내역

- 2013 대한민국 공익광고제 대학생 부문 금상 수상

- 2015 칸 국제 광고제 영 라이언즈 컴피티션 한국 대표 참여



"안녕하세요, 이승용입니다. 사소한 일상에서 비범한 무언가를 발견하는 것이야말로 
대단한 아이디어가 시작되는 순간입니다. 가벼운 말장난부터 엉뚱한 농담까지, 
저는 유쾌한 소재에서 주로 영감을 얻어요. 

그렇게 일상에서 찾은 반짝이는 생각들을 원동력 삼아 회사에선 카피라이터로, 
퇴근 후에는 팟캐스트 진행자로, 그리고 에세이 작가로 활동하고 있죠.
                    </pre>
    
                    <button type="button" class="btnClass" id="d-classInfoBtn">클래스 소개 더보기</button>
    
                </section>
                <section class="detialedPage-tutorInfo bottomBox">
                    <span class="boxTitle">튜터님을 소개합니다!</span>
                    <div>
                        <div class="tutorInfoSmallBox">
                            <img src="${contextPath}/resources/img/profile_tutor.png">
                            <div class="introduceTutor">
                                <span>이승용 튜터</span>
                                <div></div>
                            </div>
                        </div>
                        <div class="tutorIntroduce">
                            <pre>안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다.안녕하세요! 이승용 튜터입니다. </pre>
                        </div>
                    </div>
                </section>
    
    
                <section id="d-curriculum" class="bottomBox">
                    <span class="boxTitle">커리큘럼</span>
                    <div class="curriculumBox">
                        <h4>맛보기 영상</h4>
    
                        <a href="#"> <strong>OT.오리엔테이션</strong>
                            <span>03:10</span>
                        </a>
                    </div>
                    <div>
                        <h4>1. 누구나 카피라이터가 되어야 합니다.</h4>
                        <a href="#">
                            <strong>1-1 카피라이팅의 세계에 오신 것을 환영합니다!</strong>
                            <span>07:21</span>
                        </a>
                    </div>
                    <button type="button" id="d-curriculumBtn">커리큘럼 더보기</button>
                </section>
    
    
    
    
                <section id="dp-review" class="bottomBox">
    
                    <div>
                        <span class="boxTitle">수강생 리뷰</span>
                        <div>
                            <a href="#">추천순</a>
                            <a href="#">최신순</a>
                        </div>
                    </div>
    
                    <div class="d-review">
    
                        <div>
    
                            <img src="${contextPath}/resources/img/profile_all_re.PNG">
                            <p>
                                <span class="dp-date-review">2021-06-27</span>
                                <span>이름
                                </span>
                                <span> ★★★★★ 5.0</span>
                            </p>
    
                        </div>
    
                        <p class="d-review-content">
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                        </p>
                    </div>
    
                    <div class="d-review">
                        <div>
                            <img src="${contextPath}/resources/img/profile_all_re.PNG">
                            <p>
                                <span class="dp-date-review">2021-06-27</span>
                                <span>이름
                                </span>
                                <span> ★★★★★ 5.0</span>
                            </p>
    
                        </div>
    
                        <p class="d-review-content">
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                        </p>
                    </div>
    
                    <div class="d-review">
    
                        <div>
    
                            <img src="${contextPath}/resources/img/profile_all_re.PNG">
                            <p>
                                <span class="dp-date-review">2021-06-27</span>
                                <span>이름
                                </span>
                                <span> ★★★★★ 5.0</span>
                            </p>
    
                        </div>
    
                        <p class="d-review-content">
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                        </p>
                    </div>
    
                    <div class="d-review">
    
                        <div>
    
                            <img src="${contextPath}/resources/img/profile_all_re.PNG">
                            <p>
                                <span class="dp-date-review">2021-06-27</span>
                                <span>이름
                                </span>
                                <span> ★★★★★ 5.0</span>
                            </p>
    
                        </div>
    
                        <p class="d-review-content">
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                            댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글
                        </p>
                        <button type=button id="d-reviewBtn">더보기</button>
                    </div>
    
    
    
    
                </section>
    
                <section id="d-similarClass" class="bottomBox">
                    <span class="boxTitle">비슷한 클래스예요</span>
    
                    <div id="d-similarC-1">
                        <img src="${contextPath}/resources/img/art/samsamC.PNG">
                        <div>
                            <strong>VOD</strong>
                            <span>일글강 -일하고 글쓰는 사람들을 위한 강의</span>
                            <span><strong>40,000</strong>원/월</span>
                        </div>
                    </div>
                    <button type="button" id="d-similarBtn">비슷한 클래스 더보기 ></button>
                </section>
    
                <section id="d-similarClass" class="bottomBox">
                    <span class="boxTitle">이런 클래스 어때요?</span>
    
                    <div id="d-similarC-1">
                        <img src="${contextPath}/resources/img/art/suggestC2.PNG">
                        <div>
                            <strong>VOD</strong>
                            <span>회사에선 안 알려주는 진짜 현장 엑셀</span>
    
                            <div>
                                <span class="d-red">85%</span>
                                월<strong>33,000</strong>원
                            </div>
                            <span>★ 4.9(638)</span>
                        </div>
                    </div>
                    <button type="button" id="d-suggestBtn">추천클래스 더보기 ></button>
                </section>
            </div>  
            
            <section id="detailedSide" class="bottomBox">
                <section id="detailedSide-d1">
                    <div>
                        <h3>읽는 순간 기억에 남는 카피 글쓰기</h3>
                        <span>★5.0(15)</span><br><br>
                        <span class="credit50Pro">50%</span>
                        <span><strong>월 33,000원</strong></span><br>
                        <span class="fontGcolor"><del>199,000원</del></span>
                    </div>
                    <br>
    
                    <div class="detailedCon">
                        <span> <i class="fa-regular fa-circle-play"></i>&nbsp;VOD • 총25강 • 3시간 10분</span><br>
                        <span><i class="fa-regular fa-calendar"></i> &nbsp;3개월 • 12개월 선택 가능</span><br>
                        <span><i class="fa-regular fa-clipboard"></i> &nbsp;강의자료 있음</span><br>
                        <span><i class="fa-regular fa-comments"></i> &nbsp;QnA 가능</span>
    
                    </div>
    
                    <div class="detailedPageBrn">
                        <a href="#" class="chatBtn"><img src="${contextPath}/resources/img/chat.png"></a>
	                        <a class="creditBtnSub" href="${contextPath}/approval">클래스 결제하기</a>
	                            

                    </div>
            </section>

        </section>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    
    <script src="${contextPath}/resources/js/common/hf.js"></script>
</body>

</html>