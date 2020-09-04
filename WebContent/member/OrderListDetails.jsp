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
	
	
</style>
<body>

	<div id="mainDiv">
		<c:set var="length" value="${fn:length(orderlist) }" />
		<%-- <font color="black" size="5"> 고객번호 : ${customerNo} <br> --%>
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


	
	</div>
	
	<div id="more"></div>
	

</body>
</html>