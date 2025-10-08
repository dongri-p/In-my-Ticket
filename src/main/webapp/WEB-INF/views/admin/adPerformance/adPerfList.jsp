<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /admin/adPerformance/adPerflist.jsp -->

  <table border="1">
    <tr>
      <th> 번호 </th>
      <th> 제목 </th>
      <th> 장소 </th>
      <th> 시작일 </th>
      <th> 종료일 </th>
      <th> 장르 </th>
      <th> 관리 </th>
    </tr>
   <c:forEach var="pdto" items="${plist}">
    <tr>
      <td> ${pdto.perfId} </td>
      <td> ${pdto.title} </td>
      <td> ${pdto.location} </td>
      <td> ${pdto.startDate} </td>
      <td> ${pdto.endDate} </td>
      <td> ${pdto.genre} </td>
      <td>
        <a href="update?perfId=${pdto.perfId}"> 수정 </a>
        <a href="delete?perfId=${pdto.perfId}"> 삭제 </a>
      </td>
    </tr>
   </c:forEach> 
  </table>
</body>
</html>