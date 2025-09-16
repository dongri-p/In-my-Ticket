<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /admin/adIndex.jsp -->
  <h2> 관리자 페이지 </h2>
  <p> <strong> ${adName} </strong> 님, 환영합니다 </p>
  
  <ul>
    <!-- <li> <a href="/admin/adPerformance/adPerfList"> 공연 관리 </a> </li> --> 
    <li> <a href="/admin/time/tlist"> 시간표 관리 </a> </li>
    <li> <a href="/admin/seat/smanage"> 좌석 관리 </a> </li>
    <li> <a href="/admin/adreserv/rlist"> 예매 관리 </a> </li>
    <li> <a href="/admin/adLogout"> 로그아웃 </a> </li>
  </ul>

</body>
</html>