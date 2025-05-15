<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      margin:0px;
    }
    #first {
      width:1100px;
      height:40px;
      margin:auto;
      background:#83BDBF;
    }
    header {
      width:1100px;
      height:70px;
      margin:auto;
      background:red;
    }
    nav {
      width:1100px;
      height:60px;
      margin:auto;
      background:blue;
    }

    footer {
      width:1100px;
      height:150px;
      margin:auto;
      background:yellow;
    }
  </style>
  <sitemesh:write property="head"/>
</head>
<body> <!-- default.jsp -->
  <div id="first"> </div>
  <header> </header>
  <nav> </nav>
  
  <sitemesh:write property="body"/>
  
  <footer> </footer>

</body>
</html>