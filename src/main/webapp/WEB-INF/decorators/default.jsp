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
      transition:opacity 0.2s;
    }
    body.hidden {
      opacity:0;
      pointer-events:none;
    }
    #fouter {
      width:100%;
      height:30px;
      background:#83BDBF;
    }
    #fouter #xx {
      cursor:pointer;
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
    a {
      text-decoration:none;
      color:black;
    }
    a:hover {
      color:#83BDBF;
    }
  </style>
  <script>
    var h=40;
    function xclose()
    {
      ss=setInterval(function()
      {
    	  h--;
          document.getElementById("fouter").style.height=h+"px";
          document.getElementById("first").style.height=h+"px";
          
          if(h == 0)
          {
            clearInterval(ss);
            document.getElementById("fouter").style.display="none";
          }
      },10);
      
      // 쿠키변수에 정보 저장
      var chk=new XMLHttpRequest();
      chk.onload=function()
      {
    	  if(chk.responseText == "0")
    	  {
    		    alert("오류");
    	  }
      }
      chk.open("get","../firstCookie");
      chk.send();
    }
    
    // default.jsp는 모든 페이지가 다 사용한다
    // 비동기방식으로 접근
    window.onload=function()
    {
        // 쿠키를 체크하여 보여줄지 말지 결정
        var chk=new XMLHttpRequest();
        chk.onload=function()
        {
            var n=chk.responseText;
            if(n == "1")
            {
                document.getElementById("fouter").style.display="none";
            }
        }
        chk.open("get", "../xcookOk");
        chk.send();
        
        const path=window.location.pathname;
        
        if(path.includes("/member/myticket"))
        {
        	var userid="${userid}";
        	if(userid == null || userid === "")
        	{
        	    document.body.classList.add("hidden");
        	    setTimeout(function()
        	    {
        	        alert("로그인이 필요한 서비스입니다.");
        	        window.location.replace("/login/login");
        	    }, 100);
        	}
        }
    }
  </script>
  
  <sitemesh:write property="head"/>
</head>
<body> <!-- default.jsp -->

  <div id="fouter">
    <div id="first">
      <div id="left"> 회원가입하고 다양한 공연을 만나보세요! </div>
      <div id="right"> <span id="xx" onclick="xclose()"> X </span> </div>
    </div>
  </div>
  
  <header>
    <div id="logo">
      <img src="../static/logo.png" width="200" height="78" valign="middle" onclick="location='../main/index'">
    </div>
    <div id="search">
      <div id="searchForm">
        <input type="text" name="sword" id="sword" placeholder="찾고싶은 공연을 검색하세요.">
        <img src="../static/s.png">
      </div>
    </div>
    <div id="memMenu">
     <c:if test="${userid == null}">
      <a href="../login/login"> 로그인 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
      <a href="../member/member"> 회원가입 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
     </c:if>
     <c:if test="${userid != null}">
      ${name}님&nbsp;&nbsp;|&nbsp;&nbsp;
      <a href="../login/logout"> 로그아웃 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
     </c:if>
      고객센터&nbsp;&nbsp;|&nbsp;&nbsp;
      이용안내&nbsp;&nbsp;|&nbsp;&nbsp;
      LANGUAGE ▼
    </div>
  </header>
  
  <nav>
    <ul>
      <li> <a href="/performance/list?genre=콘서트"> 콘서트 </a> </li>
      <li> <a href="/performance/list?genre=뮤지컬/연극"> 뮤지컬/연극 </a> </li>
      <li> <a href="/performance/list?genre=팬클럽/팬미팅"> 팬클럽/팬미팅 </a> </li>
      <li> <a href="/performance/list?genre=클래식"> 클래식 </a> </li>
      <li> <a href="/performance/list?genre=국악/전통"> 국악/전통 </a> </li>
      <li> <a href="/performance/list?genre=전시/행사"> 전시/행사 </a> </li>
      <li> <a href="/performance/list?genre=테마/지역"> 테마/지역 </a> </li>
      <li> <a href="/performance/list?genre=랭킹"> 랭킹 </a> </li>
      <li> <a href="/performance/list?genre=티켓오픈소식"> 티켓오픈소식 </a> </li>
      <li> <a href="/performance/list?genre=이벤트"> 이벤트 </a> </li>
      <li> <a href="../member/myticket"> 인마이티켓 </a> </li>
    </ul>
  </nav>
  
  <sitemesh:write property="body"/>
  
  <footer> </footer>

</body>
</html>