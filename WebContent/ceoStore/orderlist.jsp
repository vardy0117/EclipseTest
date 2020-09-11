<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ceo 주문내역 상세보기</title>

<link rel="stylesheet" href="CSS/olderlistJSP.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="qrcode.js"></script>

<script>
	setTimeout("location.reload()",5000);

	function deleteOrder(orderNo, ceoNo) {
		if(confirm(" 주문을 삭제 하시겠습니까? ")==true){
			orderform.submit();
			  
		}else{
			alert("취소되었습니다");
			 return false;		
		}
	}
	
	function orderCheck(orderNo){ // 사장전용 주문 체크
		var prepareTime = document.getElementById("prepareTime").value;	
		$.ajax({
			type : "post",
			async : false,
			url : "./CeoorderCheck.do",
			data : {"orderNo":orderNo,"prepareTime":prepareTime},
			dataType : "text",
			success : function(data,textStatus){
				if(data==1){ 
					alert("주문수락 완료 \n 이미 처리 완료된 주문에 대해서 별도의 처리 안되어 있음 (중복요청가능) ");
					$("#ceoordercheck").text("주문수락완료");
					$("#ceoordercheck").css("color", "green");
					location.reload();
					
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
				<a href="javascript:printIt(document.getElementById('printArea').innerHTML)"><button id="print-btn">출  력</button></a>
			</div>
		</c:if>	
		<div id="printArea">
		<div id="orderDetail" class="orderDetail">
		<table class="deliveryInfo">
			<tr>
				<td>주문번호 </td>
				<td>: &nbsp;${orderList.orderNo}</td>
			</tr>
			<tr>
				<td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td>: &nbsp;${orderList.roadAddress}&nbsp;&nbsp;${orderList.detailAddress }</td>
			</tr>
			<tr>
				<td>연&nbsp;락&nbsp;처</td>
				<td>: &nbsp;${orderList.phone}</td>
			</tr>
			<tr>
				<td>요청사항 </td>
				<td>: &nbsp;${orderList.request}</td>
			</tr>
		</table>
		<br>
		<hr>
		<br>
		<table class=orderMenuTable>
			<tr>
				<th>메 뉴</th>
				<th>가 격</th>
				<th>갯 수</th>
			</tr>
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${orderMenuList}" var="orderMenu">
				<c:set var="totalPrice" value="${totalPrice+(orderMenu.price*orderMenu.quantity)}" />
				<tr>
					<td>${orderMenu.name}</td>
					<td>${orderMenu.price} 원</td>
					<td>${orderMenu.quantity}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		합계 : ${totalPrice } 원
		<br>
		<br>
		<hr>
		<br>				
		<c:if test="${orderList.orderCheck=='F' }">
			<select  id="prepareTime">
				<option value="50">50분 후</option>
				<option value="40">40분 후</option>
				<option value="60">60분 후</option>
				<option value="30">30분 후</option>
				<option value="20">20분 후</option>
			</select>
			
			&nbsp;&nbsp;<input class="btn" type="button" value="배달예정시간 선택" onclick="orderCheck(${param.orderNo })">
		</c:if>
		
		<c:if test="${orderList.orderCheck!='F' }">
			<div class="qrcode">
				<span id="qrcode" onclick="location.href='MoveDeliveryIndex.do?orderNo=${param.orderNo}';"></span>
			</div>
		</c:if>
		

	
<%-- 		<c:set var="ceoNo" value="${ceoNo}"/> 
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