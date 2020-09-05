<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
<html>
<head>
<title>영수증</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body {text-align:center; margin:20px auto;}
#Layout {width:500px; border:1px solid #5263bd;}
#Print {width:500px; text-align:right; padding:3px 5px;}
.basicDiv {border:1px solid #5263bd; padding:7px 0; color:#5f6fc2;}

.tblTop {border-collapse: collapse; border:1px solid #5263bd; border-bottom:0px;}
.tblTop td {padding:5px 0 10px 30px; font:bold 24px gulim; color:#5263bd; text-align:center;}
.titstxt {font:bold 12px gulim; color:#5263bd;}

.tblTop2 {border-collapse: collapse; border-right:1px solid #5263bd; border-left:1px solid #5263bd;}
.tblTop2 .noTd {border-top:1px solid #5263bd; border-right:1px solid #5263bd; padding:4px;}
.tblTop2 .noTd .noStxt { font:bold 13px gulim; color:#666666;}
.tblTop2 td {font:bold 14px gulim; color:#5263bd; padding:4px;}
.tblTop2 .name {font:bold 14px gulim; color:#353535; text-align:right;}

.tbl {border-collapse: collapse; border:1px solid #5263bd;}
.tbl td {border:1px solid #5263bd; padding:4px;}
.tbl td.titTd {font:bold 14px gulim; color:#5263bd;}
.tbl th {font:bold 13px gulim; color:#5263bd; border:1px solid #5263bd; background:#f0f1f9; padding:4px;}

.tbl .item {font:13px gulim; padding-left:15px;}
.tbl .article {font:13px gulim; text-align:center;}
.tbl .price {font:normal 13px gulim; color:#4b4b4b; text-align:right; padding-right:7px;}
.tbl .sum {font:bold 13px gulim; color:#4b4b4b; text-align:right; padding-right:7px;}

.tbl .date {font:bold 13px gulim; color:#4b4b4b; text-align:center;}
.tbl .total {font:bold 16px gulim; color:#000000; text-align:right; padding-right:7px; border:2px solid #5263bd; background:url(../image/won.gif) no-repeat 5% 40%;}

.stamp {background:url(../image/stamp.gif) no-repeat 98% 20%;}

.txt1 {font:bold 15px dotum;}
</style>

<script type="text/javascript">
function printIt(printThis)
{
    var win = null;
    win = window.open();
    self.focus();
    win.document.open();
    win.document.write(printThis);
    win.document.close();
    win.print();
    win.close();
}




</script>

</head>



<body>
<div id="printme">
<div id="printarea">
<div id="Layout">

<c:set var="info" value="${storereceipt}" />

 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop">
    <tr>
      <td>영 수 증</td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop2">
    <tr>
      <td width="45%" class="noTd">주문번호 <span class="noStxt">${param.orderNo}</span></td>
      <td class="name">${nickname}</td>
      <td width="15%">님귀하</td>
    </tr>
  </table>   
 <table width="100%" cellpadding="0" cellspacing="0" class="tbl stamp">
    <tr>
      <td width="7%" rowspan="5" align="center" class="titTd">공<br>
      급<br>
      자</td>
      <th width="20%">사업자<br>
      등록번호</th>
      <td colspan="3" class="txt1">777-77-12345</td>
    </tr>
    <tr>
      <th>상호</th>
      <td width="25%" align="center">${info.name}</td>
      <th width="14%">성명</th>
      <td align="center">정보없음</td>
    </tr>
    <tr>
      <th>사업자<br>
      소재지</th>
      <td colspan="3">${info.roadAddress} ${info.detailAddress}</td>
    </tr>
    <tr>
      <th>업태</th>
      <td align="center">외식업</td>
      <th>종목</th>
      <td align="center">${info.category }</td>
    </tr>
    <tr>
      <th>전화</th>
      <td colspan="3">${info.phone}</td>
    </tr>
  </table>
  <table width="100%" cellspacing="0" cellpadding="0" class="tbl">
    <tr>
      <th>작성년월일</th>
      <th>공급대가총액</th>
      <th>비고</th>
    </tr>
    <tr>
      <td class="date">준비중</td>
      <td class="total"><?=number_format($row[price]+$row[baesong])?></td>
      <td>&nbsp;</td>
    </tr>
  </table>
 <div class="basicDiv">
   위 금액을 정히 영수(청구) 함.
  </div>
  
    
  <table width="100%" cellspacing="0" cellpadding="0" class="tbl">
    <tr>
      <th>품목</th>
      <th>수량</th>
      <th>단가</th>
<!--       <th>공급대가(금액)</th> -->
    </tr>
 
   <c:forEach var="orderdetail" items="${OrderRealDetail}" varStatus="status" > 
    <tr>
     
      <td class="item">${orderdetail.name }</td>
      <td class="article">${orderdetail.ea}</td>
      <td class="price">${orderdetail.price }원</td>
      <!-- <td class="sum">보류</td> -->
    </tr>
        
<!--  	<tr>
      <td class="item">준비중</td>
      <td class="article">&nbsp;</td>
      <td class="price">&nbsp;</td>
      <td class="sum">2,500</td>
      
     </tr>  -->

 </c:forEach> 
 
 <tr>
 <th>합계</th>
 	<td></td>
 	<td class="price">
 	
 	<c:forEach var="sum" items="${OrderRealDetail}" varStatus="status">
			<c:set var="total" value="${total + sum.price}" />

		</c:forEach>

		 ${total}원
 	</td>
 </tr>
 	
  </table>
  

   
 <div class="basicDiv">
   부가가치 세법시행규칙 제25조의 규정에 의하여 위 금액을 정히 영수함.</div>
</div>
</div>
</div>
<input type="button" value="출력하기" onclick="javascript:printIt(document.getElementById('printme').innerHTML)" />




