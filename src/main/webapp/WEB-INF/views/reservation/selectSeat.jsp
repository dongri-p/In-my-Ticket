<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #seatCon {
      width:350px;
      margin:40px auto;
      display:grid;
      grid-template-columns:repeat(5, 60px);
      gap:10px;
      justify-content:center;
    }

    .seat {
      width:60px;
      height:60px;
      background-color:#83BDBF;
      border:none;
      border-radius:8px;
      font-weight:bold;
      color:white;
      text-align:center;
      line-height:60px;
      cursor:pointer;
      font-size:16px;
      transition:background-color 0.3s;
    }

    .seat:hover {
      background-color:#5aa7aa;
    }

    .seat.selected {
      background-color:#FFA500;
    }

    .seat.reserved {
      background-color:gray;
      cursor:not-allowed;
    }

    #box {
      text-align:center;
      margin-top:30px;
    }

    #pay {
      padding:12px 24px;
      background-color:#83BDBF;
      color:white;
      border:none;
      border-radius:6px;
      font-size:18px;
      cursor:pointer;
    }

    #pay:hover {
      background-color:#5aa7aa;
      color:black;
    }
  </style>
  <script>
    let selectedSeatId=null;
    
    function selectSeat(seatElement, seatId)
    {
    	if(seatElement.classList.contains("reserved"))		
    		return;
    	
    	// 기존 선택된 좌석 해제
    	const currentSelected=document.querySelector(".seat.selected");
    	if(currentSelected)
    	{
    		currendSelected.classList.remove("selected");
    	}
    	
    	// 새좌석 선택
    	seatElement.classList.add("selected");
    	selectedSeatId=seatId;
    }
    
    function goPayment()
    {
    	const perfId=document.getElementById("perfId").value;
    	const date=document.getElementById("date").value;
    	const time=document.getElementById("time").value;
    	
    	if(!selectedSeatId)
    	{
    		alert("좌석을 선택해주세요.");
    		return;
    	}
    	
    	const url="/reservation/payment?perfId=" + perfId +
    			"&date=" + date + "&time=" + time +
    			"&seatId=" + selectedSeatId;
    	
    	window.open(url, "결제하기", "width=800,height=600,scrollbars=yes");
    }
  
  </script>
</head>
<body> <!-- /reservation/selectSeat.jsp -->
  <div id="seatCon">
   <c:forEach var="seat" items="${seatList}">
    <div class="seat ${seat.reserved == 1 ? 'reserved' : ''}"
    	onclick="selectSeat(this, '${seat.seatId}')">
      ${seat.seatRow}${seat.seatCol}
    </div> 
   </c:forEach>
  </div>
  
	<div id="box">  
      <input type="hidden" id="perfId" value="${param.perfId}">
      <input type="hidden" id="date" value="${param.date}">
      <input type="hidden" id="time" value="${param.time}">
      <input type="hidden" id="seatId" value="">
      <button id="pay" onclick="goPayment()"> 결제하기 </button>
    </div>
  
</body>
</html>