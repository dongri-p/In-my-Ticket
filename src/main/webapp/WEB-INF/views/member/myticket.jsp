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
      padding:0;
      background:#fafafa;
    }
    
    .profile {
      width:1100px;
      margin:40px auto 20px auto;
      display:flex;
      justify-content:space-between;
      align-items:center;
      border-bottom:2px solid #83BDBF;
      padding-bottom:15px;
    }
    
    .profileInfo span {
      display:block;
      font-size:17px;
      color:#333;
      margin-bottom:5px;
    }
    
    .memEdit {
      background:#83BDBF;
      color:white;
      border:none;
      border-radius:6px;
      padding:8px 16px;
      cursor:pointer;
      font-weight:bold;
      transition:background 0.2s ease;
    }

    .memEdit:hover {
      background:#6fa8aa;
    }

    .resList {
      width:1100px;
      margin:40px auto;
    }

    .resList h3 {
      margin-bottom:15px;
      font-size:20px;
      color:#333;
      border-left:6px solid #83BDBF;
      padding-left:10px;
    }

    table {
      width:100%;
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
      background:#f2f9f9;
      color:#333;
      font-weight:600;
    }

    tr:hover {
      background:#f9fdfd;
    }

    .cancel {
      background:#e65d5b;
      color:white;
      border:none;
      border-radius:5px;
      padding:6px 12px;
      cursor:pointer;
      font-weight:bold;
      transition:background 0.2s ease;
    }

    .cancel:hover {
      background:#c24c4a;
    }

    p {
      font-size:15px;
      color:#777;
    }
  </style>
</head>
<body> <!-- /member/myticket.jsp -->
  <div class="profile">
    <div class="profileInfo">
      <span> <b> ${name} </b> 님, 반갑습니다! </span>
      <span> ${userid} </span>
    </div>
    <button class="memEdit" onclick="location.href='/member/memEdit'"> 기본정보 수정 </button>
  </div>
  
  <div class="resList">
    <c:if test="${not empty message}">
      <script>
        alert("${message}");
      </script>
    </c:if>
    <h3> 예매내역 </h3>
     <c:if test="${empty rlist}">
      <p style="text-align:center;"> 예매내역이 없습니다. </p>
     </c:if>
     <c:if test="${not empty rlist}">
      <table>
        <tr>
          <th> 공연명 </th>
          <th> 날 짜 </th>
          <th> 시 간 </th>
          <th> 좌 석 </th>
          <th> 인 원 </th>
          <th> 결제금액 </th>
          <th> 상 태 </th>
          <th> 관 리 </th>
        </tr>
       <c:forEach var="res" items="${rlist}">
        <tr>
          <td> ${res.title} </td>
          <td> ${res.date} </td>
          <td> ${res.time} </td>
          <td> ${res.seatIds} </td>
          <td> ${res.people} </td>
          <td> ${res.totalPrice} </td>
          <td> ${res.status} </td>
          <td>
           <c:if test="${res.status eq 'reserved'}">
            <button class="cancel" onclick="resCancel(${res.resId})"> 취소 </button>
           </c:if>
           <c:if test="${res.status eq 'cancelled'}">
            취소완료
           </c:if>
          </td>
        </tr>
       </c:forEach> 
      </table>
     </c:if>
  </div>
  
  
  <script>
    function resCancel(resId)
    {
        if(confirm("정말 예매를 취소하시겠습니까?"))
        {
            location.href="/member/cancel?resId="+resId;
        }
    }
  </script>
  
</body>
</html>