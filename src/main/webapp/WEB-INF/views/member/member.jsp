<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:1100px;
      margin:auto;
      text-align:center;
    }
    section div {
      margin-top:10px;
    }
    section #txt {
      width:440px;
      height:40px;
      border:1px solid #83BDBF;
      border-radius:4px;
    }
    section input[type="text"]:focus,
    section input[type="password"]:focus {
      border:2px solid #649FA1;
      outline:none;
    }
    section #email {
      width:140px;
      height:40px;
    }
    section #select {
      width:124px;
      height:44px;
    }
    section #submit {
      width:222px;
      height:50px;
      background:#83BDBF;
      border:none;
      border-radius:6px;
    }
    section #btn {
      width:222px;
      height:50px;
      background:#ddd;
      border:none;
      border-radius:6px;
    }
    section #submit:hover {
      cursor:pointer;
      background:#649FA1;
    }
    section #btn:hover {
      cursor:pointer;
      background:#bbb;
    }
    section #umsg, #pmsg {
      font-size:13px;
      font-weight:bold;
    }
  </style>
  <script>
    function useridCheck(userid)
    {
        userid=userid.trim();
        
        if(userid.length >= 6)
        {
        	var chk=new XMLHttpRequest();
            chk.onload=function()
            {
                //alert(chk.responseText);
                if(chk.responseText == "0")
                {
                    document.getElementById("umsg").innerText="사용 가능한 아이디입니다.";
                    document.getElementById("umsg").style.color="blue";
                    uchk=1;
                }
                else
                {
                    document.getElementById("umsg").innserText="사용 불가능한 아이디입니다.";
                    document.getElementById("umsg").style.color="red";
                    uchk=0;
                }
            }
            chk.open("get", "useridCheck?userid="+userid);
            chk.send();
        }
        else
        {
            document.getElementById("umsg").innerText="아이디는 6자 이상입니다.";
            document.getElementById("umsg").style.color="red";
            uchk=0;
        }
    }
    
    function pwdCheck()
    {
        var pwd=document.mform.pwd.value;
        var pwd2=document.mform.pwd2.value;
        
        if(pwd2.length != 0)
        {
            if(pwd == pwd2)
            {
                document.getElementById("pmsg").innerText="비밀번호가 일치합니다.";
                document.getElementById("pmsg").style.color="blue";
                pchk=1;
            }
            else
            {
                document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다.";
                document.getElementById("pmsg").style.color="red";
                pchk=0;
            }
        }
    }
    
    function getServer(my)
    {
        const serverInput=document.getElementById("server");
        
        if(my.value == "self")
        {
            serverInput.removeAttribute("readonly");
            serverInput.value="";
            serverInput.focus();
        }
        else
        {
            serverInput.value=my.value;
            serverInput.setAttribute("readonly", true);
        }
    }
    
    var uchk=0;
    var pchk=0;
    function check()
    {
        var phone=document.mform.phone.length;
        if(uchk == 0)
        {
            alert("아이디를 확인하세요.");
            return false;
        }
        else if(pchk == 0)
            {
                alert("비밀번호를 확인하세요.");
        	    return false;
        	}
            else if(document.mform.name.value == "")
                {
                    alert("이름을 확인하세요.");
                    return false;
                }
                else if(phone == 0 && phone != 13)
                	{
                        alert("전화번호를 확인하세요.");
                        return false;
                	}
        else
        {
            var emailOk=document.mform.uid.value+"@"+document.mform.server.value;
            document.mform.email.value=emailOk;
            return true;
        }
    }
  </script>
</head>
<body> <!-- /member/member.jsp -->
  <section>
      <form method="post" name="mform" action="memberOk" onsubmit="return check()">
        <input type="hidden" name="email">
        <h3> 회 원 가 입 </h3>
        <div>
          <input type="text" name="userid" onblur="useridCheck(this.value)" id="txt" placeholder="아이디(6자이상)">
          <br> <span id="umsg"> </span>
        </div>
        <div> <input type="text" name="name" id="txt" placeholder="이 름"> </div>
        <div>
          <input type="password" name="pwd" onkeyup="pwdCheck()" id="txt" placeholder="비밀번호">
        </div>
        <div>
          <input type="password" name="pwd2" onkeyup="pwdCheck()" id="txt" placeholder="비밀번호 확인">
          <br> <span id="pmsg"> </span>
        </div>
        <div class="cemail">
          <input type="text" name="uid" id="uid"> @ 
          <input type="text" name="server" id="server" placeholder="도메인" readonly>
          <select name="dserver" id="select" onchange="getServer(this)">
            <option value=""> 선택하기 </option>
            <option value="naver.com"> naver.com </option>
            <option value="daum.net"> daum.net </option>
            <option value="gmail.com"> gmail.com </option>
            <option value="kakao.com"> kakao.com </option>
            <option value="self"> 직접입력 </option>
          </select>
        </div>
        <div>
          <input type="text" name="phone" id="txt" placeholder="전화번호">
        </div>
        <div>
          <input type="button" value="취 소" onclick="../main/index" id="btn">
          <input type="submit" value="회원가입" id="submit">
        </div>
      </form>
  </section>
</body>
</html>