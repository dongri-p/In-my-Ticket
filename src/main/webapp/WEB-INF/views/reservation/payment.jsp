<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- /reservation/payment.jsp -->
  <div id="both">
  
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
            <option value=""> 신용카드 </option>
            <option value=""> 신용카드 </option>
          </select>
        </div>
        
        
      </form>
    </div>
  </div>
</body>
</html>