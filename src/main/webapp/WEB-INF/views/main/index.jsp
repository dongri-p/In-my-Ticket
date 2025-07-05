<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #slide {
      width:1700px;
      margin:auto;
    }
    section {
      width:1100px;
      margin:auto;
    }
    section > div {
      width:1000px;
      height:400px;
      border:2px solid black;
      margin:auto;
    }
  </style>
</head>
<body> <!-- index.jsp -->
  <div id="slide" align="center">
  <c:forEach var="pdto" items="${plist}">
    <div style="display:inline-block; margin:10px; text-align:center;">
      <img src="${pdto.imageUrl}" width="300" height="200" alt="${pdto.title}"> <br>
      <strong> ${pdto.title} </strong><br>
      <small> ${pdto.startDate} ~ ${pdto.endDate} </small>
    </div>
  </c:forEach>
  </div>

  
  <section>
 
   <%-- <c:forEach var="pdto" items="${plist}">
    <div class="sang"> 
      <h3> ${pdto.title} </h3>
      <p> ${pdto.location} </p>
      <p> ${pdto.startDate} ~ ${pdto.endDate} </p>
      <img src="${pdto.imageUrl}" width="200" height="150">
    </div>
   </c:forEach>  --%>
   
  </section>
</body>
</html>