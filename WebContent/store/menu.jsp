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
	
	table#menuTable{
		margin: 0 auto;
		width : 900px;
	}

	.menuImage{
		width : 100px;
		height : 100px;
	}
	
	.tbtn, .icoClear{
		cursor : pointer;
		background-color: white;
		border : 0;
		outline: 0;
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
<script>
	window.onload = function(){
		getCart();
		$("tbody:first").children().css("display","block");
		$(".toggleImg:first").attr("src","images/btn_count_up.gif");
		
	}
	  
  	 function toggleMenuTr(element,category){
		if(element.querySelector(".toggleImg").getAttribute("src")=="images/btn_count_down.gif"){
  			$("."+category).css("display","block");
  			element.querySelector(".toggleImg").setAttribute("src","images/btn_count_up.gif");
		} else {
			$("."+category).css("display","none");
			element.querySelector(".toggleImg").setAttribute("src","images/btn_count_down.gif");
		}
		
	 }  
	 
 	 function modifyQty(element, qty) {
		 if(qty == 1) {
			 element.parentNode.querySelector(".qty").value++;
		 } else if (element.parentNode.querySelector(".qty").value > 0 && qty ==-1) {
			 element.parentNode.querySelector(".qty").value--;
		 }
	 }
 	 
 	function modifyMenuOnCartQty(element, qty){
 		var cartItem = JSON.parse(sessionStorage.getItem("cart"));
 		
 		var name=$(element).parents("li").find(".name").html();
	 		for(var j=0; j<cartItem.length; j++){
				if (name ==cartItem[j]["name"]){
					if(qty == 1) {
						cartItem[j]["quantity"]++;
					} else if(qty == -1 && cartItem[j]["quantity"]>1){
						cartItem[j]["quantity"]--;
					} else {
						break;
					}
				}
	 		}	
		var cart = JSON.stringify(cartItem);
		sessionStorage.setItem("cart",cart);	
			
		getCart();	
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
		
		var json = orderItem;
		
		var cartItem=JSON.parse(sessionStorage.getItem("cart"));
		
		if(cartItem==null){
			cartItem=new Array();
			cartItem.push(json);
		} else {
			var i = null;
			for(j=0; j<cartItem.length; j++){
				if (name == cartItem[j]["name"]){	
					i=j;
				}	
			}
			
			if(i!=null){	
				quantity+=parseInt(cartItem[i]["quantity"]);
				price=basePrice*quantity;			
					
				orderItem["quantity"]=quantity;
				orderItem["price"]=price;
				
				json = orderItem;
					
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
	
	function delOrderItem(element){
	var cartItem = JSON.parse(sessionStorage.getItem("cart"));
 		
 		var name=$(element).parents("li").find(".name").html();

		for(var j=0; j<cartItem.length; j++){
			if (name == cartItem[j]["name"]){		
				cartItem.splice(j, 1);
				break;
			} 
		}	
			
		var cart = JSON.stringify(cartItem);
		sessionStorage.setItem("cart",cart);	
			
		getCart();		
	}
	
 	function clearCart(){
		var cart = null;
		sessionStorage.setItem("cart",cart);
		getCart();
	} 
	
	function getCart(){
		var cart=JSON.parse(sessionStorage.getItem("cart"));
		var tag = "";
		var totalPrice = 0;
		if(cart=="" || cart == null){
			$("#cartStatusClear").css("display","block");
			$("#cartStatusFilled").css("display","none");
			$(".cartClear").css("display","none");
			$("#total").html("합계 : 0 원");
			$("#obtn").attr("disabled",true);
		}else {
			$("#cartStatusClear").css("display","none");
			$("#cartStatusFilled").css("display","block");
			$(".cartClear").css("display","block")
			$("#obtn").removeAttr("disabled");
			for(i=0; i<cart.length; i++){
				tag += 
					'<li class="cartLi" id=food'+i+'>'+
						'<div class="row">'+
							'<div class="name">'+
								cart[i]["name"]+
							'</div>'+
							'<div class="left">'+
								'<a class="btn del-menu" onclick="delOrderItem(this)" style="cursor:pointer">삭제</a>'+
								'<span class="price">'+
									cart[i]["price"]+" 원"+
								'</span>'+
							'</div>'+
							'<div class="right">'+
								'<a onclick=" modifyMenuOnCartQty(this, 1)" style="cursor:pointer" >+</a>'+
								'<span class="orderQuantity">'+
									cart[i]["quantity"]+ 
								'</span>'+
								'<a onclick=" modifyMenuOnCartQty(this, -1)" style="cursor:pointer">-</a>'+	
							'</div>'+
						'</div>'+
					'</li>';
					
				totalPrice += cart[i]["price"];
			}
			
			$("#cartUl").html(tag);
			$("#total").html("합계 : "+totalPrice+ " 원");
		}
	}

	

</script>
</head>
<body>
	<table border="1" id="menuTable">	
		<c:forEach var="categorys" items="${requestScope.categoryList}">
			<c:choose>
				<c:when test="${categorys eq '세트 메뉴'}">
					<c:set var="category" value="setMenu"/>
				</c:when>
				<c:when test="${categorys eq '주 메뉴'}">
					<c:set var="category" value="mainMenu"/>
				</c:when>
				<c:when test="${categorys eq '사이드 메뉴'}">
					<c:set var="category" value="sideMenu"/>
				</c:when>
				<c:when test="${categorys eq '음료/주류'}">
					<c:set var="category" value="drink"/>
				</c:when>
			</c:choose>
			<thead>
			<tr>
				<td colspan="3" align="center">${categorys} |
					<button type="button" class="tbtn" onclick="toggleMenuTr(this,'${category}');">
						<img src="images/btn_count_down.gif" class="toggleImg"/>
					</button>	
				</td>
			</tr>	
			</thead>
			
			<tbody>	
			<c:forEach var="menu" items="${requestScope.menuList}">
			<%-- <fmt:parseNumber var="num" value="${menu.level div 10}" type="number" integerOnly="true"/> --%>
			<c:if test="${menu.category==categorys}">
			
			<tr class="${category}" style="display:none;">
				<td>
					<div class="menuImg">
						<span><img src="upload/store/${menu.image}"></span> | 
					</div>
					<div class="menuName">					
					<span class="name">${menu.name}</span>
					</div>
				</td>
				<td  class="basePrice">${menu.price}</td>
				<td>
					<%-- <input type="hidden" name="level" value="${menu.level}"> --%>
					<input type="hidden" class="name" value="${menu.name}"> 
					<input type="hidden" class="price" value="${menu.price}"> 
					<a onclick=" modifyQty(this, 1)" style="cursor: pointer">+</a> 
						<input type="number" id="quantity" name="quantity" class="qty" min="0" value="1" style="width:50px;"> 
					<a onclick=" modifyQty(this, -1)" style="cursor: pointer">-</a> 
						<input type="button" type="button" id="tbtn" value="주문표에 추가" onclick="addToCartStorage(this)">
				</td>
			</c:if>
			</c:forEach>
			</tbody>
		</c:forEach>
	</table>
</body>
</html>