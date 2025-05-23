<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #slide {
      width:1700px;
      height:250px;
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
    <span> <img src="../static/slide/1.PNG"> </span>
    <span> <img src="../static/slide/2.PNG"> </span>
    <span> <img src="../static/slide/3.PNG"> </span>
    <span> <img src="../static/slide/4.PNG"> </span>
    <span> <img src="../static/slide/5.PNG"> </span>
  </div>
  <section>
    <div class="sang"> </div>
    <div class="sang"> </div>
    <div class="sang"> </div>
  </section>
</body>
</html>