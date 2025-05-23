<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      height:80px;
      margin:auto;
      font-size:12px;
      display:flex;
      justify-content:space-between;
      align-items:center;
    }
    header #logo {
      widht:300px;
      height:80px;
      line-height:80px;
    }
    header #search {
      widht:450px;
      height:80px;
      display:flex;
      align-items:center;
    }
    header #search #searchForm {
      width:350px;
      height:45px;
      border:2px solid #83BDBF;
      border-radius:15px;
      display:flex;
      align-items:center;
      padding:0 10px;
      box-sizing:border-box;
    }
    header #search #searchForm input[type=text] {
      width:305px;
      border:none;
      outline:none;
      margin-left:10px;
    }
    header #memMenu {
      widht:330px;
      height:80px;
      display:flex;
      align-items:flex-start;
      justify-content:flex-end;
      font-size:13px;
      line-height:1.4;
      padding-top:10px;
      box-sizing:border-box;
    }
    
    nav {
      width:1100px;
      height:60px;
      margin:auto;
    }
    nav > ul {
      padding-left:0px;
    }
    nav > ul > li {
      display:inline-block;
      width:105px;
      height:60px;
      text-align:center;
      font-weight:bold;
    }
    nav > ul > li:last-child {
      color:#83BDBF;
      text-align:right;
    }
    nav > ul > li:hover {
      cursor:pointer;
      color:#83BDBF;
    }

    footer {
      width:1100px;
      height:150px;
      margin:auto;
      background:yellow;
    }
  </style>
  <script>
    function 
  </script>
  
  <sitemesh:write property="head"/>
</head>
<body> <!-- default.jsp -->

  <div id="fouter">
    <div id="first">
      <div id="left"> 회원가입하고 다양한 공연을 만나보세요! </div>
      <div id="right"> X </div>
    </div>
  </div>
  
  <header>
    <div id="logo"> <img src="../static/logo.png" width="200" height="78" valign="middle"> </div>
    <div id="search">
      <div id="searchForm">
        <input type="text" name="sword" id="sword" placeholder="찾고싶은 공연을 검색하세요.">
        <img src="../static/s.png">
      </div>
    </div>
    <div id="memMenu">
     <c:if test="${userid == null}">
      로그인&nbsp;|&nbsp;
      회원가입&nbsp;|&nbsp;
     </c:if>
     <c:if test="${userid != null}">
      ???님&nbsp;|&nbsp;
      로그아웃&nbsp;|&nbsp;
     </c:if>
      고객센터&nbsp;|&nbsp;
      이용안내&nbsp;|&nbsp;
      LANGUAGE ▼
    </div>
  </header>
  
  <nav>
    <ul>
      <li>
        콘서트
      </li>
      <li>
        뮤지컬/연극
      </li>
      <li>
        팬클럽/팬미팅
      </li>
      <li>
        클래식
      </li>
      <li>
        전시/행사
      </li>
      <li>
        테마/지역
      </li>
      <li>
        랭킹
      </li>
      <li>
        티켓오픈소식
      </li>
      <li>
        이벤트
      </li>
      <li>
        인마이티켓
      </li>
    </ul>
  </nav>
  
  <sitemesh:write property="body"/>
  
  <footer> </footer>

</body>
</html>