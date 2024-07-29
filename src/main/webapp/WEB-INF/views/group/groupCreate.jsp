<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디 모집</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/group/groupCreate.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/hf.css">
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/71eaa9d255.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <main>
        <section>
            <div>
                <a href="${contextPath}/groupMain"><i class="fa-solid fa-xmark"></i></a>
                <span>모임만들기</span>
            </div>
            <div>
                <span class="star">*</span><span>필수</span>
            </div>
        </section>
        <form action="${contextPath}/groupMain" method="post">
            <section class="essentialArea">
                <article>
                    <div class="categoryTitle">
                        <span>모임명<span class="star">*</span></span> 
                        <span class="countinput"><span>0</span>/30</span>
                    </div>
                    <div>
                        <input type="text" placeholder="제목을 입력하세요" maxlength="30px" name="studytitle">
                    </div>
                </article>
                <article>
                    <div class="categoryTitle">
                        <span>모임소개<span class="star">*</span></span> 
                        <span class="countinput"><span>0</span>/1000</span>
                    </div>
                    <div>
                        <textarea name="studycontent" id="" placeholder="모임 소개글을 작성하세요" maxlength="1000"></textarea>
                    </div>
                </article>
                <article class="inputTime">
                    <div class="categoryTitle">
                        <span>일시<span class="star">*</span></span> 
                    </div>
                    <div>
                        <div>
                            <div>시작</div>
                            <input type="datetime-local" name="studystart">
                        </div>
                        <div>
                            <div>종료</div>
                            <input type="datetime-local" name="studyend">
                        </div>
                    </div>
                </article>
                <article class="inputNumber">
                    <div class="categoryTitle">
                        <span>인원<span class="star">*</span></span> 
                    </div>
                    <div>
                        <span>모집인원</span>
                        <input type="number" placeholder="2" min="2" name="studynumber">
                    </div>
                    <div>
                        <span class="input-info">※ 스터디 개설자 포함 인원수로 작성해주세요.</span>
                    </div>
                </article>
                <article class="inputLocation">
                    <div class="categoryTitle">
                        <span>모임장소<span class="star">*</span></span> 
                    </div>
                    <div>   
                        <label for="offline"><input type="radio" name="meetvalue" id="offline" checked value="N">오프라인</label>
                        <label for="online"><input type="radio" name="meetvalue" id="online" value="Y">온라인</label> <br>
                        <select value="location">
                            <option value="서울">서울</option>
                            <option value="부산">부산</option>
                            <option value="인천">인천</option>
                            <option value="광주">광주</option>
                            <option value="울산">울산</option>
                            <option value="대전">대전</option>
                            <option value="대구">대구</option>
                            <option value="경기">경기</option>
                        </select>
                        <input type="text" placeholder="상세주소를 입력하세요" id="address" name="address">
                        <div>
                            <span class="input-info">※ 지역 선택 후 상세주소를 입력하세요.</span>
                        </div>
                    </div>
                </article>
                <article>
                    <div class="categoryTitle">
                        <span>연락처<span class="star">*</span></span> 
                    </div>
                    <div>
                        <input type="text" placeholder="연락방법을 입력하세요" name="studytel">
                    </div>
                    <div>
                        <span class="input-info">※ 연락방법 / 오픈톡방 링크,전화번호 SNS ID등을 입력하세요.</span>
                    </div>
                </article>
            </section>
            <section class="choiceArea">
                <article class="groupmoney">
                    <div class="categoryTitle">
                        <span>비용</span> 
                    </div>
                    <div>
                        <input type="text" placeholder="ex) 스터디룸 비용 1/N" name="studycost">
                    </div>
                </article>
            </section>
            <section>
                <a href="${contextPath}/groupMain"><button type="button">취소</button></a>
                <button id="finish-btn">작성완료</button>
            </section>
        </form>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/common/hf.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c527d868a1b47c46db5e096db9fda2e&libraries=LIBRARY"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c527d868a1b47c46db5e096db9fda2e"></script>
    <script src="${contextPath}/resources/js/group/groupCreate.js"></script>
</body>
</html>