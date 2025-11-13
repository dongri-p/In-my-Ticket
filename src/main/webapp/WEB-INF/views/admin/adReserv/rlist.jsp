<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      margin:0;
      padding:20px;
      background:#f7f7f7;
    }
    
    .all {
      width:1300px;
      margin:auto;
    }
  
    .backBtn {
      padding:6px 12px;
      border:none;
      background:#e65d5b;
      color:white;
      border-radius:4px;
      cursor:pointer;
      font-weight:bold;
      transition:background 0.2s ease;
      margin-bottom:10px;
    }
    
    .backBtn:hover {
      background:#c24c4a;
    }
    
    table {
      width:1300px;
      margin:auto;
      border-collapse:collapse;
      background:white;
      border-radius:10px;
      overflow:hidden;
      box-shadow:0 0 6px rgba(0,0,0,0.08);
    }
    
    th, td {
      border-bottom:1px solid #eee;
      text-align:center;
      padding:12px;
      font-size:15px;
    }
    
    th {
      background:#83BDBF;
      color:white;
    }
    
    tr:hover {
      background:#f9fdfd;
    }
    
    .noData {
      text-align:center;
      padding:20px;
      color:#777;
    }
  </style>
</head>
<body> <!-- /admin/adReserv/rlist.jsp -->
<div class="all">
  <button class="backBtn" onclick="location.href='/admin/adReserv/perfList'">뒤로가기</button>
  
  <table>
    <tr>
      <th> 예매번호 </th>
      <th> 회원ID </th>
      <th> 공연명 </th>
      <th> 날짜 </th>
      <th> 시간 </th>
      <th> 인원 </th>
      <th> 결제금액 </th>
      <th> 상태 </th>
    </tr>
    
   <c:if test="${empty rlist}">
    <tr> <td colspan="8" class="noData"> 예매내역이 없습니다. </td> </tr>
   </c:if> 
    
   <c:forEach var="rdto" items="${rlist}">
    <tr>
      <td> ${rdto.resId} </td>
      <td> ${rdto.userid} </td>
      <td> ${rdto.title} </td>
      <td> ${rdto.showDate} </td>
      <td> ${rdto.showTime} </td>
      <td> ${rdto.people} </td>
      <td> ${rdto.totalPrice} </td>
      <td> ${rdto.status} </td>
      <td>
       <c:if test="${rdto.status eq 'reserved'}">
        <button class="cancel" onclick="adCancel(${rdto.resId})"> 취소 </button>
       </c:if>
       <c:if test="${rdto.status eq 'cancelled'}">
        취소완료
       </c:if>
      </td>
    </tr>
   </c:forEach> 
  </table>
</div>  
</body>
</html>