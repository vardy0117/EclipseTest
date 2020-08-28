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
/*카트 디자인*/
/*******************************************************************/

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<script>
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
</script>	

</script>
<body>
	<jsp:include page="/inc/top.jsp"/>
	
	<!-- 플로팅 배너 -->
	<div class="cart">  
			<div id = "cartTitle">
				<span>주문표</span>
				<a class=".cartTitle" onclick="clearCart()">
				<span class="icoClear"></span>
			</div>
			<div id="">
				<div id = "cartDiv">
					<ul id="cartUl" class="cartUl">
					</ul>
				</div>
				<hr>
		    	<h1 id="total"></h1>
	    	</div>
	    <input type="button" id="obtn" value="주문" onclick="order();">
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
		<div id="reviewDiv" class="display-on">
			<jsp:include page="/store/review.jsp"></jsp:include>
		</div>
		<div id="infoDiv" class="display-on">
			<jsp:include page="/store/info.jsp"></jsp:include>
		</div>
</body>
</html>