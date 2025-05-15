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
    #fouter {
      width:100%;
      height:30px;
      background:#83BDBF;
    }
    #fouter #first {
      width:1100px;
      height:30px;
      margin:auto;
      background:#83BDBF;
    }
    #fouter #first #left {
      display:inline-block;
      width:1000px;
      height:30px;
      line-height:30px;
      text-align:center;
      font-size:15px;
    }
    #fouter #first #right {
      display:inline-block;
      width:80px;
      height:30px;
      line-height:30px;
      text-align:right;
      color:white;
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

  <div id="fouter">
    <div id="first">
      <div id="left"> 회원가입하고 다양한 공연을 만나보세요! </div>
      <div id="right"> X </div>
    </div>
  </div>
  
  <header> </header>
  <nav> </nav>
  
  <sitemesh:write property="body"/>
  
  <footer> </footer>

</body>
</html>