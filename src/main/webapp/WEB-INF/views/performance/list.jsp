<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /performance/list.jsp -->

  <h2>"${genre}" 공연 목록</h2>
  <ul>
   <c:forEach var="pdto" items="${plist}">
    <li>
      <strong>${pdto.title}</strong> - ${pdto.location} (${pdto.date})
    </li>
  </c:forEach>
</ul>

</body>
</html>