<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 주문내역</title>
</head>
<style>

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
	background: linear-gradient( to right, hsl(98 100% 62%), hsl(204 100% 59%) ); */
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
		}
		
</style>

<script>
function receipt() {
	  var orderNo = "${param.orderNo}";
	alert("영수증 발행할 주문번호 " + orderNo);
	// window.open("receipt.do", "a", "width=600, height=600, left=100, top=50");
	window.open(location.href='receipt.do?='+orderNo, "a", "width=600, height=600, left=100, top=50");

}

function cancelorder () {
	alert("ceo에게 주문취소를 요청하는 기능입니다 \n넣을까 말까 생각중입니다");
	
}

</script>
<body>

	<div id="mainDiv">
		<c:set var="length" value="${fn:length(orderlist) }" />
		


		<font color="black" size="5"> ${nickname}님의 상세주문내역 입니다 
		</font>  <br> <br>
		주문번호 :  ${param.orderNo }
		
		<c:forEach var="name" items="${OrderRealDetail}" begin="0" end="0">
						<br> - 주문했던 가게이름 :	${name.storeName }
		</c:forEach>
		
		<c:forEach var="address" items="${OrderRealDetail}" begin="0" end="0">
						<br> - 주문했던 도로명 주소 :	${address.roadAddress }
						<br> - 상세 주소 :	${address.detailAddress }
						
		</c:forEach>
		
		
		<c:forEach var="message" items="${OrderRealDetail}" begin="0" end="0">
						<br> - 요청사항 :	${message.request}

						
		</c:forEach>
		
		<c:forEach var="time" items="${OrderRealDetail}" begin="0" end="0">
						<br> - 주문날짜 & 시간 :	${time.orderTime}

						
		</c:forEach>
		<br><br>
			<!-- window.open("receipt.do", "a", "width=600, height=600, left=100, top=50") -->
			<a href="
					" onclick="window.open('<c:url value="receipt.do" >         
			  				<c:param name="orderNo" value="${param.orderNo}">명세서 발행 </c:param>
			  				
				  			</c:url>', 'a', 'width=600, height=600, left=100, top=50')"> - 명세서 발행하기	
	  		</a>		  
	  		
		<br> <br>
	
	
							
		<c:forEach var="orderdetail" items="${OrderRealDetail}" varStatus="status" >
			<div id="storeBox">
				<table>
					<tr>
						<td>
						     주문했던메뉴 : ${orderdetail.name} <br> 
						     가격 : ${orderdetail.price} <br>
							수량 : ${orderdetail.ea}EA
						
							
						</td>
					</tr>
				</table>
			</div>
				
	
							
		</c:forEach>

<!--합계계산 --------------------------------- -->
		<c:forEach var="sum" items="${OrderRealDetail}" varStatus="status">
			<c:set var="total" value="${total + sum.price}" />

		</c:forEach>

		합계 : ${total}원
<!--합계계산 --------------------------------- -->
<br>
<br>


<!--고객 주문 취소 --------------------------------------- -->
<c:forEach var="orderstatus" items="${OrderRealDetail}" begin="0" end="0">
	<center>
		<c:if test="${orderstatus.orderCheck eq 'F'}">
			<div id="cancelorder">
				상태 : 주문 확인 중!
			</div>
		</c:if>	
		<c:if test="${orderstatus.orderCheck eq 'N'}">
			<div id="cancelorder">
				상태 : 주문 취소!
			</div>
		</c:if>
		<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq 'T'}">
			<div id="cancelorder">
				상태 : 배달 완료!
			</div>
		</c:if>	
		<c:if test="${orderstatus.orderCheck eq 'T' && orderstatus.deliveryCheck eq 'F'}">
			<div id="cancelorder">
				상태 : 배달 중!
			</div>
		</c:if>					
	</center>		
</c:forEach>	
<!--고객 주문 취소 --------------------------------------- -->
		
	</div>
	
	<div id="more"></div>
	

</body>
</html>