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
	
	.cartList li {
		list-style-type : none;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
	  
	 function toggle(category_menu){
			 $("#"+category_menu).css("display","block");
	 }
	 
 	 function modifyQty(element, qty) {
		 if(qty == 1) {
			 element.parentNode.querySelector(".qty").value++;
		 } else if (element.parentNode.querySelector(".qty").value > 0 && qty ==-1) {
			 element.parentNode.querySelector(".qty").value--;
		 }
	 }
 	
	var item = new Array();
	var cart = null;
	localStorage.setItem("cart",cart);
	
	function addToCartStorage(element){
		var name=element.parentNode.querySelector(".name").value;
		var basePrice=parseInt(element.parentNode.querySelector(".price").value);
		var quantity=parseInt(element.parentNode.querySelector(".qty").value);
		var price = basePrice*quantity;
		
		var orderMenu = {
			 name:name,
			 basePrice:basePrice,
			 quantity:quantity,
			 price:price
			}
		
		var json = JSON.stringify(orderMenu);
		
		var itemList=JSON.parse(localStorage.getItem("cart"));
		
		if(itemList==null){
			item.push(json);
		} else {
			var i = null;
			for(j=0; j<itemList.length; j++){
				if (name == JSON.parse(itemList[j])["name"]){	
					i=j;
				}	
			}
			if(i!=null){	
				quantity+=parseInt(JSON.parse(item[i])["quantity"]);
				price=basePrice*quantity;			
					
				orderMenu["quantity"]=quantity;
				orderMenu["price"]=price;
				
				json = JSON.stringify(orderMenu);
					
				item.splice(i, 1, json);
			} else {
				item.push(json);
			}
			
		}
			
		cart = JSON.stringify(item);
		localStorage.setItem("cart",cart);	
		
		itemList=JSON.parse(localStorage.getItem("cart"));
		if(itemList!=null){
			getCart();
		}	
	} 
	
	function getCart(){
		var itemList=JSON.parse(localStorage.getItem("cart"));
		var tag = "";
		var totalPrice = 0;
		
		for(i=0; i<itemList.length; i++){
			tag += 
				'<li class="cartListLi" id=food'+i+'>'+
					'<div class="row">'+
						'<div class="name">'+
						JSON.parse(item[i])["name"]+
						'</div>'+
						'<div class="left">'+
							'<a class="btn del-menu">삭제</a>'+
							'<span class="price">'+
							JSON.parse(item[i])["price"]+
							'</span>'+
						'</div>'+
						'<div class="right">'+
							'<a onclick=" modifyQty(this, 1)" style="cursor:pointer" >+</a>'+
							'<span class="orderQuantity"><input type="number" class="qty" value='+JSON.parse(item[i])["quantity"]+'> </span>'+
							'<a onclick=" modifyQty(this, -1)" style="cursor:pointer">-</a>'+	
						'</div>'+
					'</div>'+
				'</li>';
				
			totalPrice += JSON.parse(item[i])["price"];
		}
		
		$("#cartListUl").html(tag);
		$("#total").html("총 합계 : "+totalPrice+ " 원");
	}
	
	
	function order(){
		var cnt = $(".cartListLi").length;
		console.log(cnt)
		var cartList = new Array();
		
		for(i=0; i<cnt; i++){
			var name = $("#food"+i).querySelector(".name").value;		
			var quantity = $("#food"+i).querySelector(".qty").value;
			var price =  $("#food"+i).querySelector(".price").value;
		
			var menu = {
					 name:name,
					 quantity:quantity,
					 price:price
					}
			
			var json = JSON.stringify(menu);
			
			cartList.push(json);
		}
		
		cart = JSON.stringify(cartList);
		var storeNo="${storeNo}";
			
		$.ajax({
				type : "post",
				async : false,
				url : "./order.do?storeNo="+storNo,
				data : {"cart":cart},
				dataType : "text",
				success : function(result,textStatus){
					if(result == 1){ // 결제페이지로 넘어감!
						location.href="";
					} else {
						location.href="";
					}
				}, 
				error:function(data,textStatus){
					console.log(data);
					alert("에러가 발생했슈");
				}
			}); // $ajax()
		
	}	

	
</script>
<body>
	<!-- 플로팅 배너 -->
	<!-- <div class="cart">  --> 
		<h1>장바구니</h1>
			<div id = "cartDiv">
				<ul id="cartListUl" class="cartList">
				</ul>
			</div>
			<hr>
	    	<h1 id="total"></h1>
	    <input type="button" value="주문하기" onclick="order();">
	<!-- </div> -->

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
							<td>	
								<span> ${menu.image} </span> |
								<span class="name"> ${menu.name} </span>
							</td class="basePrice">	
							<td> ${menu.price} </td>
							<td>
									<%-- <input type="hidden" name="level" value="${menu.level}"> --%>
									<input type="hidden" class="name" value="${menu.name}">
									<input type="hidden" class="price" value="${menu.price}">
									<a onclick=" modifyQty(this, 1)" style="cursor:pointer" >+</a>
									<input type="number" id="quantity" name="quantity" class="qty" min="0" value="1" type="text">
									<a onclick=" modifyQty(this, -1)" style="cursor:pointer">-</a>
									<input type="button" type="button" id="tbtn" value="주문표에 추가" onclick="addToCartStorage(this)"></button>
							</td>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table> 
	</div>
</body>
</html>