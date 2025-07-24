<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
  <style>
    section {
      width: 1100px;
      height: 500px;
      margin: auto;
      text-align: center;
    }
    section #logo {
      width: 300px;
      height: 100px;
      margin: auto;
      font-size: 28px;
      font-weight: bold;
      color: #2c3e50;
      padding-top: 50px;
    }
    section div {
      margin-top: 15px;
    }
    section input[type="text"],
    section input[type="password"],
    section input[type="submit"] {
      width: 420px;
      padding: 12px;
      margin: 5px 0;
      border: 1px solid #34495e;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 16px;
    }
    section input[type="text"]:focus,
    section input[type="password"]:focus {
      border: 2px solid #2c3e50;
      outline: none;
    }
    section #submit {
      background-color: #2c3e50;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 18px;
      transition: background-color 0.3s ease;
    }
    section #submit:hover {
      background-color: #1a242f;
      color: #ecf0f1;
    }
    .error {
      font-size: 14px;
      color: red;
      margin-top: 5px;
    }
  </style>
</head>
<body> <!-- /admin/adLogin.jsp -->
 <section>
  <div id="logo">IN MY TICKET 관리자 로그인</div>

  <form method="post" action="adLoginOk" name="lform">
    <div> 
      <input type="text" name="adminId" placeholder="관리자 아이디"> 
    </div>
    <div>
      <input type="password" name="adminPw" placeholder="비밀번호">
      <c:if test="${err == 1}">
        <div class="error">아이디 또는 비밀번호가 일치하지 않습니다.</div>
      </c:if>
    </div>
    <div> 
      <input type="submit" id="submit" value="관리자 로그인"> 
    </div>
  </form>
 </section>
</body>
</html>
