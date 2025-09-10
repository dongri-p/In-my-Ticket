<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</body>
</html>