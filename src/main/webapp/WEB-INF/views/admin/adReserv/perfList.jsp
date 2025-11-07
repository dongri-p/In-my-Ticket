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
    
   <c:forEach var="pdto" items="plist">
    <tr>
      <td> ${pdto.perfId} </td>
      <td> ${pdto.title} </td>
      <td> ${pdto.pfrpdform} ~ ${pdto.pfrpdto} </td>
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