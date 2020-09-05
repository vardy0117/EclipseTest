<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ceo 주문내역 상세보기</title>

<style type="text/css">
div {
	box-sizing: border-box;
}

#mainDiv {
	width: 1000px;
	min-height: 600px;
	margin: 0 auto;
	margin-top: 80px;
	position: relative;
	padding-top: 30px;
}
</style>

<script>
/* function deleteOrder(orderNo, ceoNo) {
	if(confirm(" 주문을 삭제 하시겠습니까? ")==true){
		  // location.href='deleteMenu.do?menuNo='+menuNo+'&storeNo='+storeNo;
		  location.href ='CeoDeleteOrder.do?orderNo='+ orderNo + '&ceoNo=' + ceoNo;
		  
	}
} */
function deleteOrder(orderNo, ceoNo) {
	if(confirm(" 주문을 삭제 하시겠습니까? ")==true){
		orderform.submit();
		  
	}else{
		alert("취소되었습니다");
		 return false;
		
		
	}
}
</script>
</head>
<body>

	<div id="mainDiv">버튼테스트 한다고 잠시만든 임시 페이지 <br>
	
		<c:set var="ceoNo" value="${ceoNo}"/> 
			<c:set var="store" value="${ceoStoreList}"/> 
		
		ceoNo = ${ceoNo} <br>
		주문 번호 : ${param.orderNo } <br>

			 <form name="orderform" method="post" action="CeoDeleteOrder.do?orderNo=${param.orderNo }" onsubmit="return confirm();">
				<input value="임시주문취소버튼" type="button" onclick="deleteOrder(${param.orderNo},${ceoNo})" >
			</form> 
	</div>
	

</body>
</html>