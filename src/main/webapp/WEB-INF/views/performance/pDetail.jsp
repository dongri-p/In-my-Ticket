<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #detail {
      width:1100px;
      margin:50px auto;
      display:flex;
      border-bottom:1px solid #ccc;
      padding-bottom:30px;
    }
    #poster {
      width:350px;
      height:400px;
      border:1px solid #ddd;
      box-shadow:2px 2px 8px rgba(0,0,0,1);
    }
    #info {
      margin-left:30px;
      flex:1;
    }
    #info h2 {
      font-size:30px;
      margin-bottom:20px;
      margin-top:0px;
    }
    .cinfo {
      font-size:16px;
      margin:10px 0;
    }
    .label {
      width:100px;
      font-weight:bold;
      display:inline-block;
      color:#444;
    }
    #btn {
      margin-top:30px;
      padding:12px 30px;
      font-size:18px;
      background-color:#83BDBF;
      color:white;
      border:none;
      border-radius:6px;
      cursor:pointer;
    }
    #btn:hover {
      background-color:#5aa7aa;
      color:black;
    }
  </style>
  <script>
    function reservation()
    {
        var loginCk="${sessionScope.userid}" !== "";
        if(!loginCk)
        {
            alert("로그인 후 이용해주세요.");
            location.href="/login/login";
        }
        else
        {
            window.open("../reservation/selectSeat", "width=600,height=500");
        }
    }
    function getShowDate(perfId)
    {
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    	    if(chk.status == 200) // 서버에서 정상 응답이 왔을 때만 실행
    	    {
    	        var data=JSON.parse(chk.responseText);
    	        var dateSelect=document.getElementById("showDate");
    	        dateSelect.innerHTML="";
    	        
    	        data.forEach(function(date)
    	        {
    	            var option=document.createElement("option");
    	            option.value=date;
    	            option.text=date;
    	            dateSelect.appendChild(option);
    	        });
    	    }
    	};
    	chk.open("get", "/performance/getShowDate?perfId="+perfId, true);
    	chk.send();
    }
    
    function getShowTime(perfId, selectedDate)
    {
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		if(chk.status == 200)
    		{
    			var data=JSON.parse(chk.responseText);
    			var timeSelect=document.getElementById("showTime");
    			timeSelect.innerHTML="";
    			
    			data.forEach(function(time)
    			{
    				var option=document.createElement("option");
    				option.value=time.time;
    				option.text=time.time + "(잔여좌석 : " + time.remainSeat + "석)";
    				timeSelect.appendChild(option);
    			});
    		}
    	};
    	chk.open("get", "/performance/getShowTime?perfId="+perfId+"&showDate="selectedDate, true);
    	chk.send();
    }
    
  </script>
</head>
<body> <!-- /performance/pDetail.jsp -->
  <div id="detail">
    <img src="${pdto.imageUrl}" id="poster" alt="이미지 없음">
    
    <div id="info">
      <h2> ${pdto.title} </h2>
      <div class="cinfo"> <span class="label"> 공연 기간 </span> ${pdto.startDate} ~ ${pdto.endDate} </div>
      <div class="cinfo"> <span class="label"> 관람 시간 </span> ${pdto.runtime} </div>
      <div class="cinfo"> <span class="label"> 장르 </span> ${pdto.genre} </div>
      <div class="cinfo"> <span class="label"> 공연 장소 </span> ${pdto.location} </div>
      <div class="cinfo"> <span class="label"> 관람 등급 </span> ${pdto.grade} </div>
      
     <div class="cinfo">
       <span class="label"> 예매 가능 날짜 </span>
       <select id="showtDate" onchange="getShowDate(${pdto.perfId, this.value})"> </select>
     </div>
     
     <div class="cinfo">
       <span class="label"> 예매 가능 시간 </span>
       <select id="showTime" onchange="getShowTime"> </select>
     </div>
     
     <div class="cinfo">
       <span class="label"> 잔여좌석 </span>
       <span id="remainSeat"> - </span>
     </div>
     
      <button id="btn" onclick="reservation()"> 예매하기 </button>
      
    </div>
  </div>
</body>
</html>