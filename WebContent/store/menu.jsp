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
	
	.cartUl li {
		list-style-type : none;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
	  
  	 function toggle(categoryName){
			 $("#"+categoryName).css("display","block");
	 }  
	 
 	 function modifyQty(element, qty) {
		 if(qty == 1) {
			 element.parentNode.querySelector(".qty").value++;
		 } else if (element.parentNode.querySelector(".qty").value > 0 && qty ==-1) {
			 element.parentNode.querySelector(".qty").value--;
		 }
	 }

	function addToCartStorage(element){		
		var name=element.parentNode.querySelector(".name").value;
		var basePrice=parseInt(element.parentNode.querySelector(".price").value);
		var quantity=parseInt(element.parentNode.querySelector(".qty").value);
		var price = basePrice*quantity;
		
		var orderItem = {
			 name:name,
			 basePrice:basePrice,
			 quantity:quantity,
			 price:price
			}
		
		var json = JSON.stringify(orderItem);
		
		var cartItem=JSON.parse(sessionStorage.getItem("cart"));
		
		if(cartItem==null){
			cartItem=new Array();
			cartItem.push(json);
		} else {
			var i = null;
			for(j=0; j<cartItem.length; j++){
				if (name == JSON.parse(cartItem[j])["name"]){	
					i=j;
				}	
			}
			
			if(i!=null){	
				quantity+=parseInt(JSON.parse(cartItem[i])["quantity"]);
				price=basePrice*quantity;			
					
				orderItem["quantity"]=quantity;
				orderItem["price"]=price;
				
				json = JSON.stringify(orderItem);
					
				cartItem.splice(i, 1, json);
			} else {
				cartItem.push(json);
			}
			
		}
			
		cart = JSON.stringify(cartItem);
		sessionStorage.setItem("cart",cart);	
		
		if(cart!=null){
			getCart();
		}	
	} 
	
	function getCart(){
		var cart=JSON.parse(sessionStorage.getItem("cart"));
		var tag = "";
		var totalPrice = 0;
		
		for(i=0; i<cart.length; i++){
			tag += 
				'<li class="cartLi" id=food'+i+'>'+
					'<div class="row">'+
						'<div class="name">'+
						JSON.parse(cart[i])["name"]+
						'</div>'+
						'<div class="left">'+
							'<a class="btn del-menu">삭제</a>'+
							'<span class="price">'+
							JSON.parse(cart[i])["price"]+
							'</span>'+
						'</div>'+
						'<div class="right">'+
							'<a onclick=" modifyMenuOnCartQty(this, 1)" style="cursor:pointer" >+</a>'+
							'<span class="orderQuantity"><input type="number" class="qty" value='+JSON.parse(cart[i])["quantity"]+' readOnly> </span>'+
							'<a onclick=" modifyMenuOnCartQty(this, -1)" style="cursor:pointer">-</a>'+	
						'</div>'+
					'</div>'+
				'</li>';
				
			totalPrice += JSON.parse(cart[i])["price"];
		}
		
		$("#cartUl").html(tag);
		$("#total").html("총 합계 : "+totalPrice+ " 원");
	}
	
	
	function order(){
		var cnt = $(".cartLi").length;
		console.log(cnt)
		var cartList = new Array();
		
		for(i=0; i<cnt; i++){
			var name = $("#food"+i).children(".name").value;		
			var quantity = $("#food"+i).children(".qty").value;
			var price =  $("#food"+i).children(".price").value;
		
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
				url : "./order.do?storeNo="+storeNo,
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
	<h1>menu.jsp 진영</h1>
	<table border="1">
		<c:forEach var="category_" items="${requestScope.categoryList}">

			<tr>
				<td colspan="3" align="center">${category_} |
					<button type="button" id="tbtn" onclick="toggle(this);">
						<img src="images/btn_count_down.gif">
					</button>
				</td>
			</tr>
			<c:forEach var="menu" items="${requestScope.menuList}">
				<%-- <fmt:parseNumber var="num" value="${menu.level div 10}" type="number" integerOnly="true"/> --%>
				<c:if test="${menu.category==category_}">
					<!-- style="display:none;" -->
					<tr id="${category_}" name="${category_}">
						<td><span> ${menu.image} </span> | <span class="name">
								${menu.name} </span></td class="basePrice">
						<td>${menu.price}</td>
						<td>
							<%-- <input type="hidden" name="level" value="${menu.level}"> --%>
							<input type="hidden" class="name" value="${menu.name}"> <input
							type="hidden" class="price" value="${menu.price}"> <a
							onclick=" modifyQty(this, 1)" style="cursor: pointer">+</a> <input
							type="number" id="quantity" name="quantity" class="qty" min="0"
							value="1" type="text"> <a onclick=" modifyQty(this, -1)"
							style="cursor: pointer">-</a> <input type="button" type="button"
							id="tbtn" value="주문표에 추가" onclick="addToCartStorage(this)">
						</button>
						</td>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>