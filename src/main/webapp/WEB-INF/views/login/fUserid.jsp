<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /login/fUserid.jsp -->
  <form id="uform">
    <h3 align="center"> 아이디 찾기 </h3>
    <div>
      <input type="text" name="name" id="txt" placeholder="이 름">
    </div>
    <div>
      <input type="text" name="email" id="txt" placeholder="이메일">
    </div>
    <div>
      <input type="button" value="아이디 찾기" id="btn" onclick="getUserid(this.form)">
    </div>
  </form>
</body>
</html>