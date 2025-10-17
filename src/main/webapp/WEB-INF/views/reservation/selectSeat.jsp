<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 페이지 식별용 변수 설정 -->
<c:set var="page" value="seat" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #stepNav {
      text-align:center;
      margin:20px 0;
    }
    
    #stepNav ul {
      list-style:none;
      padding:0;
      display:flex;
      justify-content:center;
      gap:30px;
    }
    
    #stepNav li {
      font-size:18px;
      padding-bottom:5px;
    }
    
    #stepNav li.active {
      font-weight:bold;
      border-bottom:3px solid #83BDBF;
      color:#83BDBF;
    }
    
    #stepNav a {
      text-decoration:none;
      color:inherit;
      cursor:pointer;
    }
    
    #stepNav a:hover {
      text-decoration:underline;
    }
    
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
    const maxPeople=parseInt("${param.people}");
    
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
    	
    	document.getElementById("seatCount").innerText=selectedSeatIds.length;
    }
    
    function goPayment()
    {
    	const perfId=document.getElementById("perfId").value;
    	const date=document.getElementById("date").value;
    	const time=document.getElementById("time").value;
    	const people=document.getElementById("people").value;
    	
    	if(selectedSeatIds.length !== maxPeople)
    	{
    		alert("선택한 좌석 수가 인원 수와 일치하지 않습니다.");
    		return;
    	}
    	// 선택한 좌석들의 seatId 값들이 배열로 들어가있는데 예)"A1","A2" > 이걸 "seatIds=A1"으로 바꾸는 과정, join "&"는 사이에 & 추가
    	const seatParams=selectedSeatIds.map(id => "seatIds=" + id).join("&");

    	location.href="/reservation/payment?perfId=" + perfId + "&date=" + date +
    			"&time=" + time + "&people=" + people + "&" + seatParams;
    }
  
  </script>
</head>
<body> <!-- /reservation/selectSeat.jsp -->
  <div id="stepNav">
    <ul>
      <!-- JSTL 사용, page라는 이름의 jstl 변수가 seat라는 문자열과 같다면 li태그에 class="active"를 붙여 css스타일을 주게 만듬 -->
      <li class="${page eq 'seat' ? 'active' : ''}"> 
        <a href="#"> 좌석 선택 </a>
      </li>
      <li class="${page eq 'payment' ? 'active' : ''}">
        <a href="#"> 결제 </a>
      </li>
    </ul>
  </div>

  <div id="seatCon">
   <c:forEach var="seat" items="${seatList}">
    <div class="seat ${seat.reserved == 1 ? 'reserved' : ''}"
    	onclick="selectSeat(this, '${seat.seatId}')">
      ${seat.seatRow}${seat.seatCol}
    </div> 
   </c:forEach>
  </div>
  
  <div id="count" style="text-align:center; margint-top:10px;">
    선택한 좌석 수 : <span id="seatCount"> 0 </span> / ${param.people}
  </div>
  
	<div id="box">  
      <input type="hidden" id="perfId" value="${param.perfId}">
      <input type="hidden" id="date" value="${param.date}">
      <input type="hidden" id="time" value="${param.time}">
      <input type="hidden" id="people" value="${param.people}">
      <button id="pay" onclick="goPayment()"> 결제하기 </button>
    </div>
  
</body>
</html>