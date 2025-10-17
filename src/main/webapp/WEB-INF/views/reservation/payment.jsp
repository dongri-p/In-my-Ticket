<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="payment" />
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
    
  </style>
  <script>
     window.onload=function()
     {
    	 const price=parseInt("${param.price}");
    	 const people=parseInt("${param.people}");
    	 const total=price * people;
    	 document.getElementById("totalPrice").innerText=total.toLocaleString() + "원";
    	 
    	 document.getElementById("finalPrice").value=total;
     }
  </script>
</head>
<body> <!-- /reservation/payment.jsp -->
  <div id="both">
    <div id="stepNav">
      <ul>
        <!-- JSTL 사용, page라는 이름의 jstl 변수가 seat이라는 문자열과 같다면 li태그에 class="active"를 붙여 css스타일을 주게 만듬 -->
        <li class="${page eq 'seat' ? 'active' : ''}"> 
          <a href="/reservation/selectSeat?perfId=${perfId}&date=${param.date}&time=${param.time}&people=${param.people}"> 좌석 선택 </a>
        </li>
        <li class="${page eq 'payment' ? 'active' : ''}">
          <a href="#"> 결제 </a>
        </li>
      </ul>
    </div>
  
    <div id="left">
      <form method="post" action="/reservation/comPay">
      
        <div class="lgroup">
          <label for="orderName"> 이름 </label>
          <input type="text" id="orderName" name="orderName" required>
        </div>
        
        <div class="lgroup">
          <label for="orderPhone"> 연락처 </label>
          <input type="text" id="orderPhone" name="orderPhone" required> 
        </div>
        
        <div class="lgroup">
          <label for="orderEmail"> 이메일 </label>
          <input type="email" id="orderEmail" name="orderEmail" required>
        </div>
        
        <div class="lgroup">
          <label for="payMethod"> 결제수단 </label>
          <select id="payMethod" name="payMethod" required>
            <option value=""> 신용카드 </option>
            <option value="신한은행"> 신한은행 </option>
            <option value="우리은행"> 우리은행 </option>
            <option value="국민은행"> 국민은행 </option>
            <option value="농협은행"> 농협은행 </option>
          </select>
        </div>
        
        <input type="hidden" name="perfId" value="${param.perfId}">
        <input type="hidden" name="date" value="${param.date}">
        <input type="hidden" name="time" value="${param.time}">
        <input type="hidden" name="seatId" value="${param.seatId}">
        <input type="hidden" name="price" value="${param.price}">
        <input type="hidden" name="people" value="${param.people}">
        <input type="hidden" id="finalPrice" name="finalPrice">
      </form>
    </div>
    
    <div id="right">
      <div class="summary">
        <div class="summaryItem">
          <span> 티켓 금액 (${param.people}명) </span>
          <span> ${param.price}원 x ${param.people} </span>
        </div>
        
        <div class="summaryTotal">
          <span> 총 결제 금액 </span>
          <span id="totalPrice">  </span>
        </div>
      </div>
    </div>
  </div>
</body>
</html>