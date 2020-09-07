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

.btn {
		width: 245px;
		background: linear-gradient( to bottom, hsl(0deg 0% 0%), hsl(0deg 0% 57%));
		font-family: Binggrae-Bold;
		font-size: 1rem;
		color: white;
		border: none;
		border-radius: 12px;
		width: 270px;
		height: 35px;
		transition-duration: 1s;
		opacity: 0.7;
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


function DeliveryCheck(orderNo){ // 배달완료처리
	var comment = $("#deliverycheck"+orderNo).val();
	
	$.ajax({
		type : "post",
		async : false,
		/* url : "./writeComment.do", */
		url : "./DeliveryCheck.do",
		data : {"orderNo":orderNo,"orderNo":orderNo},
		dataType : "text",
		success : function(data,textStatus){
			if(data==1){ 
				alert("배달수락 완료 \n 이미 처리 완료된 주문에 대해서 별도의 처리 안되어 있음 (중복요청가능) ");
				$("#deliverycheck").text("배달처리완료");
				$("#deliverycheck").css("color", "green");
				
			}else{
				alert("배달수락실패 잘못된 접근입니다");
			}
		},error:function(data,textStatus){
			alert("Ajax 통신 Error : "+textStatus);
		}
		
	});//ajax 끝
	
}


function CancelOrder(orderNo){ // 주문 취소 처리 (배달도 같이 취소처리) 
	var comment = $("#cancelorder"+orderNo).val();
	
	$.ajax({
		type : "post",
		async : false,
		url : "./CeoDeleteOrder.do",
		data : {"orderNo":orderNo,"orderNo":orderNo},
		dataType : "text",
		success : function(data,textStatus){
			if(data == "완료"){  //  true false말고 숫자로 바꾸기
				alert("배달, 주문 취소 완료 \n 이미 처리 완료된 주문에 대해서 별도의 처리 안되어 있음 (중복요청가능) ");
				$("#cancelorder").text("배달, 주문 취소 완료");
				$("#cancelorder").css("color", "green");
				
			}else{
				alert("배달, 주문 취소 수락실패 잘못된 접근입니다");
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
		주문 번호 : ${param.orderNo } <br><br>

			<font size="5">주문수락, 배달수락은 별도로 처리해서 여부에 상관없이 개별로 둠</font> 
			<br><br>

			
				<div>
			<input class="btn" type="button" value="임시주문취소버튼" onclick="CancelOrder(${param.orderNo })">
	
				<span id="cancelorder">상태 여부 안받아온 상태, 버튼만</span>
				
			</div>
			
			
				<br>
			<div>
			<input class="btn" type="button" value="임시주문확인처리버튼" onclick="orderCheck(${param.orderNo })">
	
				<span id="ceoordercheck">상태 여부 안받아온 상태, 버튼만</span>
				
			</div>
				<br>
			
				<input class="btn" type="button" value="임시배달완료처리버튼" onclick="DeliveryCheck(${param.orderNo })">
				<span id="deliverycheck">상태 여부 안받아온 상태, 버튼만</span>
					
				
			</div>
			
			
	
	</div>
	

</body>
</html>