<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.ArrayList" %>

<article class="calculate-all-areaP">
    <table class="calculate-table">
        <thead>
            <tr>
                <th><input type="checkbox" id="title-checkP"></th>
                <th>정산상태</th>
                <th>수강생명</th>
                <th>클래스명</th>
                <th>정산 금액</th>
                <th>수수료율</th>
                <th>정산 신청 시간</th>
            </tr> 
        </thead>
        <tbody class="cal-all-rows" id="cal-all-rows">
            <c:choose>
                <c:when test="${tutorcalculate.allsum == 0}">
                    <tr aria-rowspan="4">
                        <th colspan="7"><h1>정산 내용이 없습니다.</h1></th>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="tutorcalculate"  items="${tutorcalculateList}" varStatus="status">
                        <tr class="cal-each-rows">
                            <td class="checkbox"><input type="checkbox" name="money" value="${tutorcalculate.memberNo} ${tutorcalculate.memberNickname}"></td>
                            <td class="cal-status-area">
                                <c:if test="${tutorcalculate.settleStatus == 1}">
                                    <div class="cal-status">정산미신청</div>
                                </c:if>
                                <c:if test="${tutorcalculate.settleStatus == 2}">
                                    <div class="cal-status ing">정산완료</div>
                                </c:if>
                            </td>
                            <td class="nicknameArea">${tutorcalculate.memberNickname}</td>
                            <td class="classNameArea">${tutorcalculate.className}</td>
                            <td class="classPriceArea">${tutorcalculate.classPrice}</td>
                            <td class="commissionArea">${tutorcalculate.commission}%</td>
                            <td class="settleStatusArea">
                                <c:if test="${tutorcalculate.settleStatus == 1}">
                                    -
                                </c:if>
                                <c:if test="${tutorcalculate.settleStatus == 2}">
                                    ${tutorcalculate.settleDate}    
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</article>
