<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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



function orderCheck(orderNo){ // 사장전용 주문 체크
	var comment = $("#ceoordercheck"+orderNo).val();
	
	$.ajax({
		type : "post",
		async : false,
		/* url : "./writeComment.do", */
		url : "./CeoorderCheck.do",
		data : {"orderNo":orderNo,"orderNo":orderNo},
		dataType : "text",
		success : function(data,textStatus){
			if(data==1){ 
				alert("주문수락 완료 \n 이미 처리 완료된 주문에 대해서 별도의 처리 안되어 있음 (중복요청가능) ");
				$("#ceoordercheck").text("주문수락완료");
				$("#ceoordercheck").css("color", "green");
				
			}else{
				alert("주문수락실패 잘못된 접근입니다");
			}
		},error:function(data,textStatus){
			alert("Ajax 통신 Error : "+textStatus);
		}
		
	});//ajax 끝
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
				<input value="임시주문삭제버튼" type="button" onclick="deleteOrder(${param.orderNo},${ceoNo})" >
			</form> 
			
	
			<div>
			<input type="button" value="임시주문확인버튼" onclick="orderCheck(${param.orderNo })">
	
				<span id="ceoordercheck"></span>
					
			</div>
	
	</div>
	

</body>
</html>