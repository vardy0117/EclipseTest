<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>마이페이지 주문내역</title>
</head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
/* setInterval(function(){
	  $("#ordercheck").toggle();
	}, 250);
 */

</script>


<style>
	#totalPrice{
		text-align: left;
		min-width: 998px;
	}
	#totalPrice th{
		background-color: #19ce60;
		text-align: center;
		width: 20%;
	}
	#totalPrice td{
		text-align: center;
	}
	#receipt{
		border: 1px solid;
		text-decoration: none;
		background-color: #19ce60;
		color: white;
		padding: 0.4em;
		float: right;
	}
	#receipt:HOVER{
		background-color: red;
	}
	#receiptTable{
		text-align: center;
		min-width: 998px;
	}
	#receiptTable th{
		background-color: #19ce60;
	}
	#receiptTable td{
		font-family: none;
		font-size: 12px;
	}

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
	#mainDiv li{
		list-style: none;
		float: left;
		border: 1px solid blue;
		margin-right: 50px;
	}
	
	#storeBox {
		float: left;
		width: 49%;
		border: 1px solid #d9d9d9;
		border-radius: 12px;
		/* cursor: pointer; */
		margin-right: 10px;
		margin-bottom: 10px;
	}
	
	#storeBox td {
		padding-left: 15px;
	}
	
	
		.display-none {
		display: none;
	}
	
	#more{
		    text-align: center;
		    padding: 20px;
		    clear:both;
	}
	
	#cancelorder {
	/* float: right; */
	}
	
	.btn {
	/* background: linear-gradient( to right, hsl(98 100% 62%), hsl(204 100% 59%) ); */
	background-color: red;
    font-family: Binggrae-Bold;
    color: white;
    border: 0;
    cursor: pointer;
   
}

button :FOCUS{
	outline: none;
}
		}
		
</style>

<script>
function receipt() {
	  var orderNo = "${param.orderNo}";
	alert("영수증 발행할 주문번호 " + orderNo);
	// window.open("receipt.do", "a", "width=600, height=600, left=100, top=50");
	window.open(location.href='receipt.do?='+orderNo, "a", "width=600, height=600, left=100, top=50");

}

function cancelorder (orderNo) {
	if(confirm("주문을 취소 하시겠습니까?")==true){
	
		$.ajax({
			type : "get",
			async : false,
			url : "./cancel.do?orderNo="+orderNo,
			dataType : "text",
			success : function(data,textStatus){
				if(data==1){ 
					alert(" 주문 취소가 완료 되었습니다. ");
					location.reload();
				}else{
					alert("주문 취소 실패 ! 주문상태를  확인해주세요 ");
				}
			},error:function(data,textStatus){
				alert("Ajax 통신 Error : "+textStatus);
			}
			
		});//ajax 끝
		
		
		
		
		
	}
	
}

</script>
<body>

	<div id="mainDiv">
		<table id="receiptTable">
			<tr>
				<th>
					주문번호				
				</th>
				<th>
					업체명
				</th>
				<th>
					주문받으신 주소
				</th>
				<th>
					요청사항
				</th>
				<th>
					주문날짜
				</th>
				<th>
					주문메뉴
				</th>
				<th>
					주문수량
				</th>
				<th>
					주문금액
				</th>
			</tr>
			
			
		<c:forEach items="${requestScope.OrderRealDetail }" var="orderList">
			<tr>
				<td>
					${param.orderNo}
				</td>
				<td>
					${orderList.storeName }
				</td>
				<td>
					${orderList.roadAddress } / ${orderList.detailAddress }
				</td>
				<td>
					${orderList.request }
				</td>
				<td>
					${orderList.orderTime }
				</td>
				<td>
					${orderList.name}
				</td>
				<td>
					${orderList.ea}개
				</td>
				<td>
					${orderList.price}
				</td>
			</tr>
		</c:forEach>
		</table>
		<hr>
		<table id="totalPrice">
			<tr>
				<th>총 금액</th>
				<td>
					<c:forEach var="sum" items="${OrderRealDetail}" varStatus="status">
						<c:set var="total" value="${total + sum.price}" />
					</c:forEach> 
 					${total}원 
				</td>
				
			</tr>
			<tr>
				<th>배달상태</th>
				<td>
					<c:forEach var="orderstatus" items="${OrderRealDetail}" begin="0" end="0">
						<c:if test="${orderstatus.orderCheck eq 'F' }">
							주문확인중
							<input class="btn"  id="btn" type="submit" value="주문취소요청" onclick="cancelorder('${orderstatus.orderNo}');">
						</c:if>
						<c:if test="${orderstatus.orderCheck eq 'N' }">
							주문취소
						</c:if>
						<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq'T' }">
							배달완료
						</c:if>
						<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq'F' }">
							배달중
						</c:if>
					</c:forEach>	
				</td>
			</tr>
			<tr>
				<th>명세서</th>
				<td>
					<a href="" style="text-align: center;" 
					 	onclick="window.open('<c:url value="receipt.do" >
					 							<c:param name="orderNo" value="${param.orderNo}">명세서 발행 </c:param> 
					 						  </c:url>', 'a', 'width=600, height=600, left=100, top=50')" id="receipt">명세서 발행
					</a>	
				</td>
			</tr>
		</table>
	</div>
	
	<div id="more"></div>
	
<div  style="clear : both; ">
</div>
</body>
</html>