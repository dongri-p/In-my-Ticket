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
    let selectedSeatId=null;
  
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
    	
    	if(!seatId)
    	{
    		alert("좌석을 선택해주세요.");
    		return;
    	}
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		if(chk.status === 200) // ===엄격비교, ==느슨한 비교
    		{
    			alert("예약이 완료되었습니다");
    		}
    	};
    }
  </script>
</head>
<body> <!-- /reservation/selectSeat.jsp -->
  <div id="seatCon">
    <h2> 좌석을 선택해주세요 </h2>
    
   <c:forEach var="" items="">
   
    
  </c:forEach>
  
   <input type="hidden" id="perfId" value="">
   <input type="hidden" id="date" value="">
   <input type="hidden" id="time" value="">
   <input type="hidden" id="seatId" value="">
   
   <br>
   
   <button id="pay" onclick=""> 결제하기 </button>
  </div>
</body>
</html>