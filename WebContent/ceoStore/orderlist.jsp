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
<title>Ceo �ֹ����� �󼼺���</title>

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
	if(confirm(" �ֹ��� ���� �Ͻðڽ��ϱ�? ")==true){
		  // location.href='deleteMenu.do?menuNo='+menuNo+'&storeNo='+storeNo;
		  location.href ='CeoDeleteOrder.do?orderNo='+ orderNo + '&ceoNo=' + ceoNo;
		  
	}
} */
function deleteOrder(orderNo, ceoNo) {
	if(confirm(" �ֹ��� ���� �Ͻðڽ��ϱ�? ")==true){
		orderform.submit();
		  
	}else{
		alert("��ҵǾ����ϴ�");
		 return false;
		
		
	}
}



function orderCheck(orderNo){ // �������� �ֹ� üũ
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
				alert("�ֹ����� �Ϸ� \n �̹� ó�� �Ϸ�� �ֹ��� ���ؼ� ������ ó�� �ȵǾ� ���� (�ߺ���û����) ");
				$("#ceoordercheck").text("�ֹ������Ϸ�");
				$("#ceoordercheck").css("color", "green");
				
			}else{
				alert("�ֹ��������� �߸��� �����Դϴ�");
			}
		},error:function(data,textStatus){
			alert("Ajax ��� Error : "+textStatus);
		}
		
	});//ajax ��
}
</script>
</head>
<body>

	<div id="mainDiv">��ư�׽�Ʈ �Ѵٰ� ��ø��� �ӽ� ������ <br>
	
		<c:set var="ceoNo" value="${ceoNo}"/> 
			<c:set var="store" value="${ceoStoreList}"/> 
		
		ceoNo = ${ceoNo} <br>
		�ֹ� ��ȣ : ${param.orderNo } <br>

			 <form name="orderform" method="post" action="CeoDeleteOrder.do?orderNo=${param.orderNo }" onsubmit="return confirm();">
				<input value="�ӽ��ֹ�������ư" type="button" onclick="deleteOrder(${param.orderNo},${ceoNo})" >
			</form> 
			
	
			<div>
			<input type="button" value="�ӽ��ֹ�Ȯ�ι�ư" onclick="orderCheck(${param.orderNo })">
	
				<span id="ceoordercheck"></span>
					
			</div>
	
	</div>
	

</body>
</html>