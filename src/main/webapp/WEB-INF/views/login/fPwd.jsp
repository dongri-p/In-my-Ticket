<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      display:flex;
      justify-content:center;
      align-items:center;
      height:100vh;
      margin:0px;
    }
    #pform input[type="text"],
    #pform input[type="button"] {
      width:350px;
      padding:12px;
      margin:5px 0;
      border:1px solid #83BDBF;
      border-radius:4px;
      box-sizing:border-box;
      font-size:16px;
    }
    #pform input[type="text"]:focus {
      border:2px solid #649FA1;
      outline:none;
    }
    #btn {
      background-color:#83BDBF;
      color:black;
      border:none;
      cursor:pointer;
      font-size:18px;
      transition:background-color 0.3s ease;
    }
    #btn:hover {
      background-color:#649FA1;
      color:white;
    }
  </style>
  <script>
    function getPwd(pwd)
    {
    	var userid=pform.userid.value;
    	var name=pform.name.value;
    	var email=pform.email.value;
    	
    	if(!userid || !name || !email)
    	{
    		alert("빈칸이 있습니다.");
    		
    		return;
    	}
    	
        var chk=new XMLHttpRequest();
        chk.onload=function()
        {
            document.getElementById("pform").style.display="none";
            document.getElementById("pform").userid.value="";
            document.getElementById("pform").name.value="";
            document.getElementById("pform").email.value="";
            document.getElementById("view").innerText="임시 비밀번호 : " + chk.responseText;
        }
        chk.open("get", "/login/getPwd?userid="+userid+"&name="+name+"&email="+email);
        chk.send();
    }
  </script>
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
  
  <div id="view"> </div>
</body>
</html>