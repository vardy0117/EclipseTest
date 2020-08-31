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
		margin: 0 auto;
		margin-top: 80px;
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
	/* #topMenu {
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
	
	#topMenu .menuLink:hover, #topMenu .reviewLink:hover, #topMenu .infoLink:hover {
		color: red;
		background-color: #4d4d4d;
		cursor:pointer;
	} */
	#topMunu{
		padding: 0;
		margin: 0;
		padding-left: 0;
	}
	#topMenu li{
		margin-top: 0;
		list-style: none;
		float: left;
		width: 300px;
		text-align: center;	
		border : 1px solid #d9d9d9;
		line-height: 50px;
	}
	#topMenu .menuLink:hover, #topMenu .reviewLink:hover, #topMenu .infoLink:hover {
		color: red;
		background-color: #4d4d4d;
		cursor:pointer;
	}
	.clicked{
		background-color: #4d4d4d;
		color: red;
		cursor: pointer;
	}
	.unclicked{
		cursor: pointer; 
	 }
	.display-on {
		display: block;
	}
	.display-off {
		display: none;
	}
	.storeName{
		padding: 10px;
    	font-size: 110%;
		border: 1px solid #d9d9d9;
		margin: 30px 30px;
		margin-bottom: 0;
		padding-left: 30px;
		margin-left: 0;
		margin-right: 0;
	}
	.guideText{
		color: #999;
	}
	.avg{
		float: right;
		margin-right: 250px;
		margin-top: 30px;
	}
	#storeAvgStar{
		font-size: 15px;
		color: #ffa400;
	}
	#storeAvgScore{
		float: right;
	}
	.storeInfo{
		padding: 10px;
    	font-size: 110%;
		border: 1px solid #d9d9d9;
		margin: 30px 30px;
		overflow: hidden;	
		margin-top: 0;
		margin-left: 0;
		margin-right: 0;
	}


	#topMenu a,#topMenu li{
		height: 46px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<div id="mainDiv">
	
		


		
		<c:set var="info" value="${requestScope.storeInfo}"/>
		<div class="storeName"><h2>${info.name}</h2></div>
		<div class="storeInfo">
			<span class="storeImg"><img src="upload/store/${info.image}" style="width: 200px; margin: 30px 30px;"></span>
			<div class="avg">
				<c:set value="${requestScope.storeNo }" var="storeNo"/>
				
				<c:set var="info" value="${requestScope.storeInfo}"/>
				<c:set var="star" value="${requestScope.storereview}"/> <br>
				<%-- <div id="storeAvgScore">${star.points}</div> --%> 
				<c:if test="${star.points eq 0 }">
					<div id="storeAvgStar">☆☆☆☆☆</div>
				</c:if>
				<c:if test="${star.points eq 1 }">
					<div id="storeAvgStar">★☆☆☆☆</div>
				</c:if>
				<c:if test="${star.points eq 2 }">
					<div id="storeAvgStar">★★☆☆☆</div>
				</c:if>
				<c:if test="${star.points eq 3 }">
					<div id="storeAvgStar">★★★☆☆</div>
				</c:if>
				<c:if test="${star.points eq 4 }">
					<div id="storeAvgStar">★★★★☆</div>
				</c:if>
				<c:if test="${star.points eq 5 }">
					<div id="storeAvgStar">★★★★★</div>
				</c:if>
				<c:if test="${star.points eq null}">
					<!-- <div id="storeAvgScore">0</div> -->
					<div id="storeAvgStar">☆☆☆☆☆</div>
				</c:if>
				
				<div class="storeHours"><span class="guideText">영업시간 :</span> ${info.storeHours}</div>
				<div class="storeMessage"><span class="guideText">사장님 한마디 :</span> ${info.message}</div>
			</div>
		</div>
		
		<!-- 플로팅 배너 -->
		<div class="cart">  
			<h2>장바구니</h2>
				<div id = "cartDiv">
					<ul id="cartUl" class="cartUl">
					</ul>
				</div>
				<hr>
		    	<h1 id="total"></h1>
		    <input type="button" value="주문" onclick="location.href='OrderCheck.do';">
		</div>
		<c:set var="info" value="${requestScope.storeInfo}"/>
	
		<nav id="topMenu">
			<ul>
				<li class="menuLink" id="menuLink">메뉴</li>
				<li class="reviewLink" id="reviewLink">리뷰</li>
				<li class="infoLink" id="infoLink">정보</li>
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
	
	</div>
</body>
<script>
	document.querySelector(".menuLink").addEventListener("click", function() {
		document.getElementById("menuDiv").setAttribute("class", "display-on");
		document.getElementById("reviewDiv").setAttribute("class", "display-off");
		document.getElementById("infoDiv").setAttribute("class", "display-off");
		
		document.getElementById("menuLink").setAttribute("class", "clicked");
		document.getElementById("reviewLink").setAttribute("class", "unclicked");
		document.getElementById("infoLink").setAttribute("class", "unclicked");
		
	});
	document.querySelector(".reviewLink").addEventListener("click", function() {
		document.getElementById("menuDiv").setAttribute("class", "display-off");
		document.getElementById("reviewDiv").setAttribute("class", "display-on");
		document.getElementById("infoDiv").setAttribute("class", "display-off");
		
		document.getElementById("reviewLink").setAttribute("class", "clicked");
		document.getElementById("infoLink").setAttribute("class", "unclicked");
		document.getElementById("menuLink").setAttribute("class", "unclicked");
	});
	document.querySelector(".infoLink").addEventListener("click", function() {
		document.getElementById("menuDiv").setAttribute("class", "display-off");
		document.getElementById("reviewDiv").setAttribute("class", "display-off");
		document.getElementById("infoDiv").setAttribute("class", "display-on");
		
		document.getElementById("infoLink").setAttribute("class", "clicked");
		document.getElementById("reviewLink").setAttribute("class", "unclicked");
		document.getElementById("menuLink").setAttribute("class", "unclicked");
	});
	
	
</script>
</html>