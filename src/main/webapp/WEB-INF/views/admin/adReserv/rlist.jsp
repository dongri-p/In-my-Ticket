<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /admin/adReserv/rlist.jsp -->
  <button class="backBtn" onclick="location.href='/admin/adReserv/perfList'">뒤로가기</button>
  
  <table>
    <tr>
      <th> 예매번호 </th>
      <th> 회원ID </th>
      <th> 공연명 </th>
      <th> 날짜 </th>
      <th> 시간 </th>
      <th> 인원 </th>
      <th> 결제금액 </th>
      <th> 상태 </th>
    </tr>
    
   <c:if test="${empty rlist}">
    <tr> <td colspan="8" style="text-align:center;"> 예매내역이 없습니다. </td> </tr>
   </c:if> 
    
   <c:forEach var="rdto" items="${rlist}">
    <tr>
      <td> ${pdto.resId} </td>
      <td> ${pdto.userid} </td>
      <td> ${pdto.title} </td>
      <td> ${pdto.date} </td>
      <td> ${pdto.time} </td>
      <td> ${pdto.people} </td>
      <td> ${pdto.totalPrice} </td>
      <td> ${pdto.status} </td>
    </tr>
   </c:forEach> 
  </table>
</body>
</html>