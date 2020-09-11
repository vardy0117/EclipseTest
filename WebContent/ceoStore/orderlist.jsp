<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ceo �ֹ����� �󼼺���</title>

<link rel="stylesheet" href="CSS/olderlistJSP.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="qrcode.js"></script>

<script>
	setTimeout("location.reload()",5000);

	function deleteOrder(orderNo, ceoNo) {
		if(confirm(" �ֹ��� ���� �Ͻðڽ��ϱ�? ")==true){
			orderform.submit();
			  
		}else{
			alert("��ҵǾ����ϴ�");
			 return false;		
		}
	}
	
	function orderCheck(orderNo){ // �������� �ֹ� üũ
		var prepareTime = document.getElementById("prepareTime").value;	
		$.ajax({
			type : "post",
			async : false,
			url : "./CeoorderCheck.do",
			data : {"orderNo":orderNo,"prepareTime":prepareTime},
			dataType : "text",
			success : function(data,textStatus){
				if(data==1){ 
					alert("�ֹ����� �Ϸ� \n �̹� ó�� �Ϸ�� �ֹ��� ���ؼ� ������ ó�� �ȵǾ� ���� (�ߺ���û����) ");
					$("#ceoordercheck").text("�ֹ������Ϸ�");
					$("#ceoordercheck").css("color", "green");
					location.reload();
					
				}else{
					alert("�ֹ��������� �߸��� �����Դϴ�");
				}
			},error:function(data,textStatus){
				alert("Ajax ��� Error : "+textStatus);
			}
			
		});//ajax ��
		
	}
	
	function DeliveryCheck(orderNo){ // ��޿Ϸ�ó��
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
					alert("��޼��� �Ϸ� \n �̹� ó�� �Ϸ�� �ֹ��� ���ؼ� ������ ó�� �ȵǾ� ���� (�ߺ���û����) ");
					$("#deliverycheck").text("���ó���Ϸ�");
					$("#deliverycheck").css("color", "green");
					
				}else{
					alert("��޼������� �߸��� �����Դϴ�");
				}
			},error:function(data,textStatus){
				alert("Ajax ��� Error : "+textStatus);
			}
			
		});//ajax ��
		
	}
	
	function CancelOrder(orderNo){ // �ֹ� ��� ó�� (��޵� ���� ���ó��) 
		var comment = $("#cancelorder"+orderNo).val();
		
		$.ajax({
			type : "post",
			async : false,
			url : "./CeoDeleteOrder.do",
			data : {"orderNo":orderNo,"orderNo":orderNo},
			dataType : "text",
			success : function(data,textStatus){
				if(data == "�Ϸ�"){  //  true false���� ���ڷ� �ٲٱ�
					alert("���, �ֹ� ��� �Ϸ� \n �̹� ó�� �Ϸ�� �ֹ��� ���ؼ� ������ ó�� �ȵǾ� ���� (�ߺ���û����) ");
					$("#cancelorder").text("���, �ֹ� ��� �Ϸ�");
					$("#cancelorder").css("color", "green");
					
				}else{
					alert("���, �ֹ� ��� �������� �߸��� �����Դϴ�");
				}
			},error:function(data,textStatus){
				alert("Ajax ��� Error : "+textStatus);
			}
			
		});//ajax ��
		
	}
	
	function printIt(printThis)
	{
		var allCSS ="";
		var rawFile = new XMLHttpRequest();
        rawFile.open("GET", "./CSS/orderTablePrint.css", false);
        rawFile.onreadystatechange = function () {
            if(rawFile.readyState === 4)
            {
                if(rawFile.status === 200 || rawFile.status == 0)
                {
                    allCSS = rawFile.responseText;
                }
            }
        };
        rawFile.send(null);
	    var win = null;
	    win = window.open();
	    self.focus();
	    win.document.open();
	    win.document.write('<style>'+allCSS+'</style>');
	    win.document.write(printThis);
	    win.document.close();
	    win.print();
	    win.close();
	}

</script>
</head>
<body>

	<div id="mainDiv">
		<c:if test="${orderList.orderCheck!='F'}">
			<div class="print">
				<a href="javascript:printIt(document.getElementById('printArea').innerHTML)"><button id="print-btn">��  ��</button></a>
			</div>
		</c:if>	
		<div id="printArea">
		<div id="orderDetail" class="orderDetail">
		<table class="deliveryInfo">
			<tr>
				<td>�ֹ���ȣ </td>
				<td>: &nbsp;${orderList.orderNo}</td>
			</tr>
			<tr>
				<td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
				<td>: &nbsp;${orderList.roadAddress}&nbsp;&nbsp;${orderList.detailAddress }</td>
			</tr>
			<tr>
				<td>��&nbsp;��&nbsp;ó</td>
				<td>: &nbsp;${orderList.phone}</td>
			</tr>
			<tr>
				<td>��û���� </td>
				<td>: &nbsp;${orderList.request}</td>
			</tr>
		</table>
		<br>
		<hr>
		<br>
		<table class=orderMenuTable>
			<tr>
				<th>�� ��</th>
				<th>�� ��</th>
				<th>�� ��</th>
			</tr>
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${orderMenuList}" var="orderMenu">
				<c:set var="totalPrice" value="${totalPrice+(orderMenu.price*orderMenu.quantity)}" />
				<tr>
					<td>${orderMenu.name}</td>
					<td>${orderMenu.price} ��</td>
					<td>${orderMenu.quantity}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		�հ� : ${totalPrice } ��
		<br>
		<br>
		<hr>
		<br>				
		<c:if test="${orderList.orderCheck=='F' }">
			<select  id="prepareTime">
				<option value="50">50�� ��</option>
				<option value="40">40�� ��</option>
				<option value="60">60�� ��</option>
				<option value="30">30�� ��</option>
				<option value="20">20�� ��</option>
			</select>
			
			&nbsp;&nbsp;<input class="btn" type="button" value="��޿����ð� ����" onclick="orderCheck(${param.orderNo })">
		</c:if>
		
		<c:if test="${orderList.orderCheck!='F' }">
			<div class="qrcode">
				<span id="qrcode" onclick="location.href='MoveDeliveryIndex.do?orderNo=${param.orderNo}';"></span>
			</div>
		</c:if>
		

	
<%-- 		<c:set var="ceoNo" value="${ceoNo}"/> 
			<c:set var="store" value="${ceoStoreList}"/> 
		
		ceoNo = ${ceoNo} <br>
		�ֹ� ��ȣ : ${param.orderNo } <br><br>

			<font size="5">�ֹ�����, ��޼����� ������ ó���ؼ� ���ο� ������� ������ ��</font> 
			<br><br>

			
				<div>
			<input class="btn" type="button" value="�ӽ��ֹ���ҹ�ư" onclick="CancelOrder(${param.orderNo })">
	
				<span id="cancelorder">���� ���� �ȹ޾ƿ� ����, ��ư��</span>
				
			</div>
			
			
				<br>
			<div>
			<input class="btn" type="button" value="�ӽ��ֹ�Ȯ��ó����ư" onclick="orderCheck(${param.orderNo })">
	
				<span id="ceoordercheck">���� ���� �ȹ޾ƿ� ����, ��ư��</span>
				
			</div>
				<br>
			
				<input class="btn" type="button" value="�ӽù�޿Ϸ�ó����ư" onclick="DeliveryCheck(${param.orderNo })">
				<span id="deliverycheck">���� ���� �ȹ޾ƿ� ����, ��ư��</span>
					
				
			</div> --%>
			
		</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    var qrcode = new QRCode(document.getElementById("qrcode"), {
        text: "http://paxi.site/GitTest/MoveDeliveryIndex.do?orderNo=${param.orderNo}",
        width: 128,
        height: 128,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
</script>
</html>