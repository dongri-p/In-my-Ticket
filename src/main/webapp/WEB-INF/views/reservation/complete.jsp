<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /reservation/complete.jsp -->
  <div id="resCom">
    <h2> 예매가 정상적으로 완료되었습니다! </h2>
    
    <div class="resInfo"> <span class="label"> 예매번호 :</span> ${resId} </div>
    <div class="resInfo"> <span class="label"> 공연명 : </span> ${title} </div>
    <div class="resInfo"> <span class="label"> 날짜 : </span> ${date} </div>
    <div class="resInfo"> <span class="label"> 시간 :  </span> ${time} </div>
    <div class="resInfo"> <span class="label"> 선택 좌석 : </span> ${seatIds} </div>
    <div class="resInfo"> <span class="label"> 인원 수 : </span> ${people} </div>
    <div class="resInfo"> <span class="label"> 총 결제금액 : </span> <strong> ${totalPrice} </strong> </div>
    <div class="resInfo"> <span class="label"> 결제 수당 : </span> ${payMethod} </div>
    
    <div style="text-align:center; margin-top:30px">
      <a href="/main/index"> 메인 </a>
    </div>
  </div>
</body>
</html>