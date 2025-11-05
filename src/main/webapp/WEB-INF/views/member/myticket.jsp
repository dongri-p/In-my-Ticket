<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /member/myticket.jsp -->
  <div class="profile">
    <div class="profileInfo">
      <span> <b> ${name} </b> 님, 반갑습니다! </span>
      <span> ${userid} </span>
    </div>
    <button class="memEdit" onclick="location.href='/member/memEdit'"> 기본정보 수정 </button>
  </div>
  
  <div class="resList">
    <h3> 예매내역 </h3>
     <c:if test="${empty resList}">
      <p style="text-align:center;"> 예매내역이 없습니다. </p>
     </c:if>
     <c:if test="${not empty resList}">
      <table>
        <tr>
          <th> 공연명 </th>
          <th> 날 짜 </th>
          <th> 시 간 </th>
          <th> 좌 석 </th>
          <th> 인 원 </th>
          <th> 결제금액 </th>
          <th> 상 태 </th>
          <th> 관 리 </th>
        </tr>
       <c:forEach var="res" items="${resList}">
        <tr>
          <td> ${res.title} </td>
          <td> ${res.date} </td>
          <td> ${res.time} </td>
          <td> ${res.seatIds} </td>
          <td> ${res.people} </td>
          <td> ${res.totalPrice} </td>
          <td> ${res.status} </td>
          <td> ${res.title} </td>
        </tr>
       </c:forEach> 
      </table>
     </c:if>
  </div>
  
  
</body>
</html>