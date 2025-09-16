<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /admin/time/tlist.jsp -->
    <table border="1">
      <tr>
        <th> 공연 번호 </th>
        <th> 공연명 </th>
        <th> 장 소 </th>
        <th> 관 리 </th>
      </tr>
     <c:forEach var="pdto" items="${plist}">
      <tr>
        <td> ${pdto.perfId} </td>
        <td> ${pdto.title} </td>
        <td> ${pdto.location} </td>
        <td>
          <a href="/admin/time/tmanage?perfId=${pdto.perfId}"> 시간표 관리 </a>
        </td>
      </tr>
     </c:forEach> 
      
    </table>
</body>
</html>