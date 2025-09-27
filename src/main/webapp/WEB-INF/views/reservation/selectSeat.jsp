<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    .seat {
      width:40px;
      height:40px;
      margin:5px;
      background:#83BDBF;
      border:none;
      border-radius:5px;
      cursor:pointer;
    }
    .reserved {
      background:gray;
      cursor:not-allowed;
    }
    .selected {
      background:#FFA500;
    }
  </style>
  <script>
    function reservation()
    {	
    	var loginCk=-"${sessionScope.userid}" !== "";
    	if(!loginCk)
    	{
    		alert("로그인 후 이용해주세요.");
    		location.href="/login/login";
    		return;
    	}
    	
    	var perfId=${pdto.perfId};
    	var date=document.getElementById("showDate").value;
    	var time=document.getElementById("showTIme").value;
    	var seatId=document.querySelector(".seat.selected")?.dataset.seatId;
    }
  </script>
</head>
<body> <!-- /reservation/selectSeat.jsp -->

</body>
</html>