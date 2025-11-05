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
  
  
</body>
</html>