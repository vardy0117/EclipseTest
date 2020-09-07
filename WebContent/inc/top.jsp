<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#topDiv{
		width:100%;
		height: 80px;
		color: white;
		margin: 0 auto;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 1000;
		
		background: linear-gradient(
			to right, 
			hsl(98 100% 62%), 
			hsl(204 100% 59%)
		);
		
	}
	#topDiv #logo {
		font-size: 2rem;
		text-shadow: 4px 2px 2px gray;
	}
	
	#loginAndJoin {
		position: absolute;
		right: 10px;
		top: 10px;
		text-decoration: none;
		color: white;
		text-shadow: 2px 1px 1px gray;
	}
	
	#loginAndJoin_sub {
		margin-top: 15px;
		float : right
	}
	
	.cartButton {
		float : left;
		display: table;
		padding : 5px;
	}
	
	.cartIco {
		display : table-cell;
		border : 0;
		margin-left : 10px;
		background: none;
		cursor : pointer;
	}
	
	#loginAndJoin a {
		text-decoration: none;
		color: white;
	}
	#loginAndJoin a:hover {
		text-decoration: underline;
		color: white;
	}
	#logo {
		margin: 0;
	}
	#logo img {
		width: 250px;
	}
	

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
		setInterval(function (){
			console.log("야");
			var cartItem = JSON.parse(sessionStorage.getItem("cart"));
			if(cartItem==null){
				$(".cartButton").css("display","none");
			} else {
				$(".cartButton").css("display","block");
			}
		}, 1000);	
	
	function moveStore(){
	var store = JSON.parse(sesssionStorage.getItem("store"));
	storeNo = store["storeNo"];
	location.href="Store.do?storeNo="+storeNo;
	}

	function createCart(){
		var cart = null;
		sessionStorage.setItem("cart",cart);
	}
	
	function logOut(){
		sessionStorage.clear();
		location.href = "./LogOut.do"; 
	}
</script>
<body>
	<div id="topDiv">
		<div id="logoBody">
			<h2 id="logo"><a href="./"><img src="./images/logo_white.png"></a></h2>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.customerNo}">
				<div id="loginAndJoin" style="	margin-top: 15px;">
					<a href="./CustomerLogin.do" onclick="createCart();">로그인</a> | 
					<a href="./CustomerJoin.do">회원가입</a>
				</div>
			</c:when>
			<c:when test="${!empty sessionScope.customerNo}">
				<div id="loginAndJoin">
					<div class ="cartButton" style="display:none;">
						<button type="button" class="cartIco"><img src="./images/ICON/icons8-meal-50 (3).png" width="40" height="40"></button>
					</div>
					<div id="loginAndJoin_sub">
						${sessionScope.nickname} 회원님 어서 오세요! | 
						<a onclick = "logOut()" style="cursor:pointer;">logout</a> |	
						<!-- <a href="./CustomerModifyIntro.do">회원수정</a> | -->
						<a href="./MyPage.do">MyPage</a>
					</div>
				</div>
			</c:when>
		</c:choose>	
	</div>
	
</body>
</html>