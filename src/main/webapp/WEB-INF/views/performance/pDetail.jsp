<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /performance/pDetail.jsp -->
  <div id="detail">
    <img src="${pdto.imageUrl}" id="poster" alt="이미지 없음">
    
    <div id="info">
      <h2> ${pdto.title} </h2>
      <div class="cinfo"> <span class="label"> 공연 기간 </span> ${pdto.startDate} ~ ${pdto.endDate} </div>
    </div>
  </div>
</body>
</html>