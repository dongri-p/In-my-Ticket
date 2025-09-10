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
  <form method="post" action="/admin/time/taction">
    <input type="hidden" name="perfId" value="${perfId}">
    날짜 : <input type="date" name="rDate" required>
    시간 : <input type="time" name="rTime" required>
    <button type="submit"> 회차 추가 </button> 
  </form>
  
  <table border="1">
    <tr>
      <td> 번 호 </td>
      <td> 날 짜 </td>
      <td> 시 간 </td>
      <td> 삭 제 </td>
    </tr>
   <c forEach var="" items=""> 
  </table>

</body>
</html>