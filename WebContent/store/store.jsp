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
	

/*메뉴 디자인*/
/*******************************************************************/
#topMenu {
	height: 30px;
	width: 850px;
	margin: 0 auto;
	margin-top: 80px;
	position: relative;
	padding: 100px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink, #topMenu .reviewLink, #topMenu .infoLink {
	text-decoration: none;
	color: white;
	display: block;
	background: linear-gradient(to right, hsl(98 100% 62%),
		hsl(204 100% 59%));
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS";
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}

.display-on {
	display: block;
}
.display-off {
	display: none;
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

 	function modifyMenuOnCartQty(element, qty){
 		var cartItem = JSON.parse(sessionStorage.getItem("cart"));
 		
 		var name=$(element).parents("li").find(".name").html();
		var basePrice=parseInt($(element).parents("li").find(".price").html())/
					  parseInt($(element).parents("li").find(".qty").val());
		if(qty == 1) {
			 element.parentNode.querySelector(".qty").value++;
		 } else if (element.parentNode.querySelector(".qty").value > 0 && qty ==-1) {
			 element.parentNode.querySelector(".qty").value--;
		 }
		
		var quantity=parseInt(element.parentNode.querySelector(".qty").value);
		var price = basePrice*quantity
 		
		var orderItem = {
				 name:name,
				 basePrice:basePrice,
				 quantity:quantity,
				 price:price
				}
		
		for(var j=0; j<cartItem.length; j++){
			if (name == JSON.parse(cartItem[j])["name"]){		
				
				var json = JSON.stringify(orderItem);
					
				cartItem.splice(j, 1, json);
				break;
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
	
	
	window.onload = function() {
		document.querySelector(".menuLink").addEventListener("click", function() {
			document.getElementById("menuDiv").setAttribute("class", "display-on");
			document.getElementById("reviewDiv").setAttribute("class", "display-off");
			document.getElementById("infoDiv").setAttribute("class", "display-off");
		});
		document.querySelector(".reviewLink").addEventListener("click", function() {
			document.getElementById("menuDiv").setAttribute("class", "display-off");
			document.getElementById("reviewDiv").setAttribute("class", "display-on");
			document.getElementById("infoDiv").setAttribute("class", "display-off");
		});
		document.querySelector(".infoLink").addEventListener("click", function() {
			document.getElementById("menuDiv").setAttribute("class", "display-off");
			document.getElementById("reviewDiv").setAttribute("class", "display-off");
			document.getElementById("infoDiv").setAttribute("class", "display-on");
		});
	}

	
</script>
<body>
	<jsp:include page="/inc/top.jsp"/>
	
	<!-- 플로팅 배너 -->
	<div class="cart">  
		<h2>장바구니</h2>
			<div id = "cartDiv">
				<ul id="cartUl" class="cartUl">
				</ul>
			</div>
			<hr>
	    	<h1 id="total"></h1>
	    <input type="button" value="주문" onclick="order();">
	</div>
<c:set var="info" value="${requestScope.storeInfo}"/>
	

		<nav id="topMenu">
		<ul>
			<li><a class="menuLink">메뉴</a></li>
			<li>|</li>
			<li><a class="reviewLink">리뷰</a></li>
			<li>|</li>
			<li><a class="infoLink">정보</a></li>
			<li>|</li>

		</ul>
		</nav>
		
		<div id="menuDiv" class="display-on">
			<jsp:include page="/store/menu.jsp"></jsp:include>
		</div>
		<div id="reviewDiv" class="display-off">
			<jsp:include page="/store/review.jsp"></jsp:include>
		</div>
		<div id="infoDiv" class="display-off">
			<jsp:include page="/store/info.jsp"></jsp:include>
		</div>
</body>
</html>