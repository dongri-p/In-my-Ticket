<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    #resCom {
      width:600px;
      margin:50px auto;
    }
    
    h2 {
      color:#000;
      text-align:center;
    }
    
    .resInfo {
      margin:10px 0;
      font-size:16px;
    }
    
    .label {
      font-weight:bold;
      display:inline-block;
      width:130px;
    }
    
    a {
      display:block;
      text-align:center;
      margin-top:30px;
      font-size:16px;
      color:#5a5a9d;
      text-decoration:none;
    }
    
    a:hover {
      color:#2a2a7d;
    }
  </style>
  <script>
    function goMain()
    {
    	if(window.opener && !window.opener.closed)
    	{
    		window.opener.location.href="/main/index";
    	}
    	window.close();
    }
  </script>
</head>
<body> <!-- /reservation/complete.jsp -->
  <div id="resCom">
    <h2> 예매가 정상적으로 완료되었습니다! </h2>
    
    <div class="resInfo"> <span class="label"> 예매번호 :</span> ${resId} </div>
    <div class="resInfo"> <span class="label"> 공연명 : </span> ${title} </div>
    <div class="resInfo"> <span class="label"> 날짜 : </span> ${date} </div>
    <div class="resInfo"> <span class="label"> 시간 :  </span> ${time} </div>
    <div class="resInfo"> <span class="label"> 선택 좌석 : </span>
     <c:forEach var="seatName" items="${seatNames}" varStatus="index">
      ${seatName} <c:if test="${!index.last}"> , </c:if>
     </c:forEach>
    </div>
    <div class="resInfo"> <span class="label"> 인원 수 : </span> ${people} </div>
    <div class="resInfo"> <span class="label"> 총 결제금액 : </span> <strong> ${totalPrice} </strong> </div>
    <div class="resInfo"> <span class="label"> 결제 수단 : </span> ${payMethod} </div>
    
    <div style="text-align:center; margin-top:30px">
      <a href="javascript:void(0);" onclick="goMain()"> 닫기 </a>
    </div>
  </div>
</body>
</html>