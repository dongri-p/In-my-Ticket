<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /login/fPwd.jsp -->
  <form id="pform">
    <h3 align="center"> 비밀번호 찾기 </h3>
    <div> <input type="text" name="userid" placeholder="아이디"> </div>
    <div> <input type="text" name="name" placeholder="이 름"> </div>
    <div> <input type="text" name="email" placeholder="이메일"> </div>
    <div>
      <input type="button" value="비밀번호 찾기" id="btn" onclick="getPwd(this.form)">
    </div>
  </form>
</body>
</html>