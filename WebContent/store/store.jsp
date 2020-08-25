<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	
	input[type=number]::-webkit-inner-spin-button {
     width: 30px;
     height: 30px;
     -webkit-appearance: none;
	}
	
	button#qtyUp{
		background: url("./images/btn_count_up.gif") no-reapt;
	}
	
	button#qtyDown{
		background: url("./images/btn_count_down.gif") no-reapt;
	}
	
	.cart { 
	position: fixed; 
	right: 50%; 
	top: 180px; 
	margin-right: -720px; 
	text-align:center; 
	width: 120px; 
	}
	
	.cart a{
		text-decoration: none;
		color: black;
	}
	.cart input{
		width: 40px;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
	  
	 function toggle(category_menu){
		  
			// $("#tbtn").attr(alt)=="show")
			 $("#"+category_menu).css("display","block");
	 }
	 
 	 function modifyQty(element, qty) {
		 if(qty == 1) {
			 element.parentNode.querySelector(".qty").value++;
		 } else if (element.parentNode.querySelector(".qty").value > 0 && qty ==-1) {
			 element.parentNode.querySelector(".qty").value--;
		 }
	 }
 
	var cnt=0;
	function addToCart(){
		cnt ++;
		name=document.getElementById("name").value;
		price=document.getElementById("price").value;
		quantity=document.getElementById("quantity").value;
		orderPrice = price*quantity;
		
		var orderMenu = {
			 name:name,
			 price:price,
			 quantity:quantity,
			 total:total
			}
		
		var json = JSON.stringify(orderMenu)
		
		localStorage.setItem('orderMenu',json);
		$("#cartDiv").apeen()
	} 
</script>
<body>
	<!-- 플로팅 배너 -->
	<div class="cart"> 
		<h1>장바구니</h1>
		<form action="order.do" method="post" name="fr">
			<div id = "cartDiv">
			<ul class="cartlIST">
				<li class="cartItem">
					<div class="row">
						<div class="menuName">
							
						</div>
						<div class="left">
							<a class="btn del-menu">삭제</a>
							<a onclick=" modifyQty(this, 1)" style="cursor:pointer" >+</a>
							<span class="orderPrice"></span>
							<a onclick=" modifyQty(this, -1)" style="cursor:pointer">-</a>	
						</div>
						
					</div>
				</li>
			</ul>
			</div>
			<hr>
	    	<h1>총 수량 : 원</a></h1>
	    	<h1>총 금액 : 원</a></h1>
	    <input type="submit" value="주문하기">
	    </form>
	</div>


	<div id="mainDiv">
		<h1>store.jsp</h1>
		<br>
		<h2>storeNo : ${storeNo}</h2>
		<h2>현재는 우선 storeNo만 들고옴 컨트롤러에서 storeNo를 이용해 storeBean을 들고와야함!!</h2>
		<h2>그리고 storeNo로 menu / review도 들고와야함</h2>
		<h3>여기서 메뉴선택 및 수량지정 할 수 있는 로직을 구현 해야함.</h3>
		<c:set var="info" value="${requestScope.storeInfo}"/>
		스토어 넘버 : ${info.storeNo} <br>
		사장님 넘버 : ${info.ceoNo} <br>
		스토어 이름 : ${info.name} <br>
		도로명 : ${info.roadAddress} <br>
		상세주소 : ${info.detailAddress} <br>
		카테고리 : ${info.category} <br>
		폰 : ${info.phone} <br>
		가게이름 : ${info.storeHours} <br>
		사장님 한마디 : ${info.message} <br>
		가게 사진: ${info.image} <br>
		별점?: ${info.points} <br>
		누적주문수 : ${info.orderCount} <br>
		사업자 등록 번호 : ${info.regNo} <br>
			
			<table border="1">
				<c:forEach var="category_" items="${requestScope.categoryList}">
					<tr>
						<td colspan ="3" align="center">
							${category_} | 
							<button type="button" id="tbtn" onclick="toggle('${category_}');"><img src="images/btn_count_down.gif"></button>
						</td>
					</tr>
						<c:forEach var="menu" items="${requestScope.menuList}">
					<%-- <fmt:parseNumber var="num" value="${menu.level div 10}" type="number" integerOnly="true"/> --%>
						<c:if test="${menu.category==category_}">
				 		<tr id="${category_}" style="display:none;" name="${category_}">
							<td> ${menu.image} | ${menu.name} </td>
							<td> ${menu.price} </td>
							<td>
									<%-- <input type="hidden" name="level" value="${menu.level}"> --%>
									<input type="hidden" id="name" name="name" value="${menu.name}">
									<input type="hidden" id="price" name="price" value="${menu.price}">
									<a onclick=" modifyQty(this, 1)" style="cursor:pointer" >+</a>
									<input type="number" id="quantity" name="quantity" class="qty" min="0" value="0" type="text">
									<a onclick=" modifyQty(this, -1)" style="cursor:pointer">-</a>
									<input type="button" type="button" id="tbtn" value="주문표에 추가" onclick="addToCart()"></button>
							</td>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table> 
	</div>
</body>
</html>