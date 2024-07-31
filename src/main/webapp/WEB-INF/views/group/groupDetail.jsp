<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디 상세</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/group/groupDetail.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main>
        <section>
            <div>
                <a href="${contextPath}/groupMain"><i class="fa-solid fa-arrow-left"></i></a>
                <span>모임상세</span>
            </div>
        </section>
        <section class="text-container">
            <article>
                    <span>모임명입니다.</span>
            </article>
            <article>
                <div>
                    <img src="${contextPath}/resources/img/cat1.jpg" alt="" id="study-img">
                    <span>스터디 개설자 닉네임</span>
                </div>
                <div>
                    <span>개설일자 :</span>
                    <span>0000-00-00</span>
                </div>
            </article>
            <article class="study-info">
                <div>
                    <i class="fa-solid fa-user-check"></i>
                    <span id="left-people">5명 남음</span>
                    <span>/ 6명</span>
                </div>
                <div>
                    <ul>
                        <li><i class="fa-regular fa-calendar-check"></i>시작 : <span>2024-07-07 11:00</span></li>
                        <li><i class="fa-regular fa-calendar-xmark"></i>종료 : <span>2024-07-07 14:00</span></li>
                        <li><i class="fa-solid fa-location-dot"></i>장소 : <span>근처 가페</span></li>
                        <li><i class="fa-solid fa-coins"></i>비용 : <span>개별비용</span></li>
                        <li><i class="fa-solid fa-tag"></i>사용언어 : 
                            <div>
                                <img src="${contextPath}/resources/img/group/django.svg" alt="">
                                <img src="${contextPath}/resources/img/group/figma.svg" alt="">
                                <img src="${contextPath}/resources/img/group/go.svg" alt="">
                            </div>
                        </li>
                        <li><i class="fa-solid fa-phone"></i>연락방법 : <a href="https://www.naver.com/">https://www.naver.com/</a></li>
                    </ul>
                </div>
            </article>
            <article class="pre-area">
                <pre>(예시입니다.)
한시적 스터디인증방입니다
댓글 남겨주시면 채팅드릴께요
7월 2일~26일까지 토익보카 스터디

1. 예치금 : 만원(공지사항 계좌로 입금 후 반드시 입금자명 확인요망)
2. 인증시간 : 월~토 06~23시 사이
3. 학습량 : 매일 dayN 최소한개 이상 학습 인증
4. 인증방법 2가지 사진 필수
(1)(인강수강시)학습자료/교재필기/기타연습장 등 자율적으로
(2)단어시험지 자동생성기 해당날짜학습
5. 정산 : 매주 일욜 방장이 벌금정산
(*26일 스터디 완료후 정산된 예치금 돌려드립니다)
6. 벌금
- 도중 가입/탈퇴시 예치금 마환급(한시적 스터디임)
- 당일 미참여 벌금 1,000원
- 일주일 미참여/하루이상 무응답시 강퇴
- 면접, 필기, 병가 등 얘기해주시면 반영합니다(일대일톡으로 인증필수)

                </pre>
            </article>
            <article class="map-area">
                <div><i class="fa-regular fa-flag"></i><span>장소</span></div>
                <div></div>
                <div>
                    <span>근처 스터디룸</span>
                    <span>서울 송파구 신천동 8</span>
                </div>
            </article>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/group/groupDetail.js"></script>
</body>
</html>