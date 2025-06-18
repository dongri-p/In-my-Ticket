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
    div {
      margin-top:10px;
    }
    #uform input[type="text"],
    #uform input[type="button"] {
      width:350px;
      padding:12px;
      margin:5px 0;
      border:1px solid #83BDBF;
      border-radius:4px;
      box-sizing:border-box;
      font-size:16px;
    }
    #uform input[type="text"]:focus {
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
    function getUserid(userid)
    {
        var name=uform.name.value;
        var email=uform.email.value;
        
        if(!name || !email)
        {
            alert("빈칸이 있습니다.");
            return;
        }
        
        var chk=new XMLHttpRequest();
        chk.onload=function()
        {
            document.getElementById("uform").style.display="none";
            document.getElementById("uform").name.value="";
            document.getElementById("uform").email.value="";
            document.getElementById("view").innerText="아이디 : " + (chk.responseText.trim() || "존재하지 않는 사용자입니다.");
        }
        chk.open("get", "/login/getUserid?name="+name+"&email="+email);
        chk.send();
    }
  </script>
</head>
<body> <!-- /login/fUserid.jsp -->
  <form id="uform">
    <h3 align="center"> 아이디 찾기 </h3>
    <div> <input type="text" name="name" id="txt" placeholder="이 름"> </div>
    <div> <input type="text" name="email" id="txt" placeholder="이메일"> </div>
    <div>
      <input type="button" value="아이디 찾기" id="btn" onclick="getUserid(this.form)">
    </div>
  </form>
  
  <div id="view"> </div>
</body>
</html>