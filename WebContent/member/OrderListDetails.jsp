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
	#detailReceipt{
		padding: 1em;
		background-color: #19ce60;
	}
	
	#receipt{
		border: 1px solid;
		text-decoration: none;
		background-color: #19ce60;
		color: white;
		padding: 0.4em;
		float: right;
	}
	#receiptTable{
		text-align: center;
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
    font-size: 1rem;
    color: white;
    border: 0;
    width: 270px;
    height: 35px;
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
		<div id="detailReceipt">주문상세보기</div>
		<table id="receiptTable">
			<tr>
				<td>
					주문번호				
				</td>
				<td>
					${param.orderNo}
				</td>
			</tr>
			<tr>
				<td>
					업체명
				</td>
				<td>
					<c:forEach var="name" items="${OrderRealDetail}">
						${name.storeName }
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					주문받으신 주소
				</td>
				<td>
					<c:forEach var="address" items="${OrderRealDetail}" begin="0" end="0">
						${address.roadAddress } / ${address.detailAddress }
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					요청사항
				</td>
				<td>
					<c:forEach var="message" items="${OrderRealDetail}" begin="0" end="0">
						${message.request }
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					주문날짜
				</td>
				<td>
					<c:forEach var="time" items="${OrderRealDetail}" begin="0" end="0">
						${time.orderTime }
					</c:forEach>
				</td>
			</tr>
			
			
			<c:forEach var="orderdetail" items="${OrderRealDetail}" varStatus="status" >
			<tr>
				<td>
					주문메뉴
				</td>
				<td>
					
						${orderdetail.name}
					
				</td>
			</tr>
			<tr>
				<td>
					주문수량
				</td>
				<td>
						${orderdetail.ea}개
				</td>
			</tr>
			<tr>
				<td>
					주문금액
				</td>
				<td>
						${orderdetail.price}
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td>
					주문총액
				</td>
				<td>
					<c:forEach var="sum" items="${OrderRealDetail}" varStatus="status">
						<c:set var="total" value="${total + sum.price}" />
					</c:forEach> 
 					${total}원 
				</td>
			</tr>
			
			<tr>
				<td>
					<a href=""
					 	onclick="window.open('<c:url value="receipt.do" >
					 							<c:param name="orderNo" value="${param.orderNo}">명세서 발행 </c:param> 
					 						  </c:url>', 'a', 'width=600, height=600, left=100, top=50')" id="receipt">명세서 발행
	  				</a>	
				</td>
			</tr>
		</table>

<hr>
		<c:forEach var="orderstatus" items="${OrderRealDetail}" begin="0" end="0">
			<c:if test="${orderstatus.orderCheck eq 'F' }">
				상태 : 주문 접수 중!
				<input class="btn"  id="btn" type="submit" value="주문취소요청" onclick="cancelorder('${orderstatus.orderNo}');">
			</c:if>
			<c:if test="${orderstatus.orderCheck eq 'N' }">
				상태 : 주문취소
			</c:if>
			<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq'T' }">
				상태 : 배달완료
			</c:if>
			<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq'A' }">
				상태 : 배달완료
			</c:if>
			<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq'F' }">
				상태 : 음식 준비 중!
			</c:if>
			<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq'D' }">
				상태 : 배달중
			</c:if>
		</c:forEach>				
	</div>
	
	<div id="more"></div>
	
<div  style="clear : both; ">
</div>
</body>
</html>