<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>클래스 결제</title>
                <link rel="stylesheet" href="${contextPath}/resources/css/pages/credit.css">
                 <script src="https://code.jquery.com/jquery-3.7.1.js"
                integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
                <script src="https://kit.fontawesome.com/6c46ba8282.js" crossorigin="anonymous"></script>
                <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
            </head>

            <body>
                <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
                <section id="content">
                    <h2>클래스 결제</h2>
                    <section id="credit">
                        <section>
                            <aside>
                                <h3>클래스 정보</h3>
                                <table class="classinfo">
                                    <tr>
                                        <td>
                                            <img src="${contextPath}${classInfo.classPhoto}">
                                        </td>
                                        <td>
                                            <span>
                                                ${classInfo.className}
                                            </span>
                                        </td>
                                    </tr>
                                </table>

                            </aside>
                            <!--                 <aside>
                    <h3>수강권신청</h3>
                    
                    <div id="month12">
                        <label>
                        <table>
                            <tr>
                                <td rowspan="2"> <input type="radio" name="selectMonth"></td>
                                <td><i class="fa-regular fa-calendar"></i>
                                    <span>12개월 선택권</span>
                                </td>
                            </tr>
      
                            <tr>
                                
                                <td> <i class="fa-regular fa-credit-card"></i>
                                <span>월 10750원</span></td>
                            </tr>
                        </table>
                         </label>
                        <label>
                            <table>
                                <tr>
                                    <td rowspan="2"> <input type="radio" name="selectMonth"></td>
                                    <td><i class="fa-regular fa-calendar"></i>
                                        <span>3개월 선택권</span>
                                    </td>
                                </tr>
          
                                <tr>
                                    
                                    <td> <i class="fa-regular fa-credit-card"></i>
                                    <span>월 33000원</span></td>
                                </tr>
                            </table>
                       
                        
                       
                        </label>
                    </div>
                </aside> -->
                        </section>
                        <form id="paymentForm" action="${contextPath}/approval/class?classNo=${param.classNo}&paid=true" onsubmit="return handleSubmit(event)" method="post">
                            <section>
                                <div id="creditS">
                                    <h3>결제 수단</h3>
                                    <label><input type="radio" name="creditSelect" value="카드/간편결제"> 카드/간편결제</label>
                                    <label><input type="radio" name="creditSelect" value="네이버페이"> 네이버페이 <img
                                            src="${contextPath}/resources/img/nPay.png" class="imgPay"></label>
                                    <label><input type="radio" name="creditSelect" value="카카오페이"> 카카오페이 <img
                                            src="${contextPath}/resources/img/kaPay.png" class="imgPay"></label>
                                    <label><input type="radio" name="creditSelect" value="가상계좌입금"> 가상계좌입금</label>
                                </div>

                            </section>
                            <section>
                                <table class="craditCheck">
                                    <tr class="lastMoney">
                                        <td>결제 금액</td>
                                        <td><fmt:formatNumber value="${classInfo.classPrice}" pattern="#,###원" /></td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            아래 내용을 확인하였으며, 결제 및 정보 제공에 동의합니다.
                                        </td>
                                    </tr>
							        <tr>
							            <td>개인정보 수집 이용 및 제 3자 제공(필수)</td>
							            <td class="checkBox"><input type="checkbox" id="privacyPolicy"></td>
							        </tr>
							        <tr>
							            <td>환불 규정 동의(필수)</td>
							            <td class="checkBox"><input type="checkbox" id="refundPolicy"></td>
							        </tr>
                                    <tr>
                                        <td colspan="2">
                                            <button type="submit" id="btnCredit">결제하기</button>
                                        </td>
                                    </tr>
                                    <input type="hidden" name="classNo" value="${param.classNo}">
                                    <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
                                </table>

                            </section>
                        </form>
                        <script>
                            const memberName = "${loginMember.memberNickname}"
                            const price = "${classInfo.classPrice}"
                            const memberEmail = "${loginMember.memberEmail}"
                            const classNo = "${param.classNo}"
                        </script>
                    </section>
                </section>
                <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
                <script src="${contextPath}/resources/js/pages/credit.js"></script>
            </body>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>