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
      width:500px;
      margin:30px auto;
      display:grid;
      grid-template-columns:repeat(5, 1fr);
      gap:15px;
    }

    .seat {
      width:70px;
      height:70px;
      background-color:#83BDBF;
      border:none;
      border-radius:8px;
      font-weight:bold;
      color:white;
      text-align:center;
      line-height:70px;
      cursor:pointer;
    }

    .seat:hover {
      background-color:#5aa7aa;
    }

    .selected {
      background-color:#FFA500;
    }

    .reserved {
      background-color:#999;
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
    let selectedSeatIds=[];
    const maxPeople=${param.people};
    
    function selectSeat(seatElement, seatId)
    {
    	if(seatElement.classList.contains("reserved"))		
    		return;
    	
    	if(seatElement.classList.contains("selected"))
    	{
    		seatElement.classList.remove("selected");
    		selectedSeatIds=selectedSeatIds.filter(id => id !== seatId);
    	}
    	else
    	{
    		if(selectedSeatIds.length >= maxPeople)
    		{
    			alert("선택 가능한 인원 수를 초과했습니다.");
    			return;
    		}
    		seatElement.classList.add("selected");
    		selectedSeatIds.push(seatId);
    	}
    }
    
    function goPayment()
    {
    	const perfId=document.getElementById("perfId").value;
    	const date=document.getElementById("date").value;
    	const time=document.getElementById("time").value;
    	
    	if(selectedSeatIds.length !== maxPeople)
    	{
    		alert("선택한 좌석 수가 인원 수와 일치하지 않습니다.");
    		return;
    	}
    	
    	const seatParams=selectedSeatIds.map(id >= "seatIds=" + id).join("&");
    	
    	const url="/reservation/payment?perfId=" + perfId +
    			"&date=" + date + "&time=" + time +
    			"&" + seatParams;
    	
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
      <button id="pay" onclick="goPayment()"> 결제하기 </button>
    </div>
  
</body>
</html>