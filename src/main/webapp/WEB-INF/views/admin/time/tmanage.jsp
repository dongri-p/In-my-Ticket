<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /admin/time/tmanage.jsp -->
  <h2> ${perfId}번 공연 관리 </h2>
  <form method="post" action="/admin/time/tinsert">
    <input type="hidden" name="perfId" value="${perfId}">
    날짜 : <input type="date" name="showDate" required>
    시간 : <input type="time" name="showTime" required>
    <button type="submit"> 회차 추가 </button> 
  </form>
  
  <table border="1">
    <tr>
      <th> 번 호 </th>
      <th> 날 짜 </th>
      <th> 시 간 </th>
      <th> 삭 제 </th>
    </tr>
   <c:forEach var="tdto" items="${tlist}">
    <tr>
      <td> ${tdto.timeId} </td>
      <td> ${tdto.showDate} </td>
      <td> ${tdto.showTime} </td>
      <td>
        <a href="/admin/time/delete?timeId=${tdto.timeId}&perfId=${perfId}"> 삭제 </a>
      </td>
    </tr>
   </c:forEach> 
  </table>

</body>
</html>