<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    body {
      margin:0px;
      padding:20px;
      background-color:#f7f7f7;
    }
    
    .search {
      width:1300px;
      margin:auto;
      text-align:right;
      margin-bottom:10px;
    }
    
    .search input[type=text] {
      padding:6px 10px;
      border:1px solid #ccc;
      border-radius:4px;
    }

    .search-box button {
      padding:6px 12px;
      border:none;
      background:#83BDBF;
      color:white;
      border-radius:4px;
      cursor:pointer;
      font-weight:bold;
    }

    .search button:hover {
      background:#6fa8aa;
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

    .detail {
      background:#83BDBF;
      color:white;
      border:none;
      border-radius:5px;
      padding:6px 12px;
      cursor:pointer;
      font-weight:bold;
      transition:background 0.2s ease;
    }

    .detail:hover {
      background:#6fa8aa;
    }

    .noData {
      text-align:center;
      padding:20px;
      color:#777;
    }
  </style>
</head>
<body> <!-- /admin/adReserv/perfList.jsp -->
  <div class="search">
    <form method="get" action="/admin/adReserv/perfList">
      <input type="text" name="keyword" value="${param.keyword}" placeholder="공연명 검색">
      <button type="submit"> 검색 </button>
    </form>
  </div>
  
  <table>
    <tr>
      <th> 공연번호 </th>
      <th> 공연명 </th>
      <th> 공연 기간 </th>
      <th> 예매수 </th>
      <th> 취소수 </th>
      <th> 총수익 </th>
      <th> 관리 </th>
    </tr>
    
   <c:if test="${empty plist}">
    <tr> <td colspan="7" class="noData"> 등록된 공연이 없습니다. </td> </tr>
   </c:if> 
    
   <c:forEach var="pdto" items="${plist}">
    <tr>
      <td> ${pdto.perfId} </td>
      <td> ${pdto.title} </td>
      <td> ${pdto.startDate} ~ ${pdto.endDate} </td>
      <td> ${pdto.resCount} </td>
      <td> ${pdto.cancelCount} </td>
      <td> ${pdto.total} </td>
      <td>
        <button class="detail" onclick="location.href='/admin/adReserv/rlist?perfId=${pdto.perfId}'">
          상세보기
        </button>
      </td>
    </tr>
   </c:forEach> 
  </table>
</body>
</html>