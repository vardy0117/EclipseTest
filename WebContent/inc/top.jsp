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
</head>
<script>
	function createCart(){
		var cart = null;
		sessionStorage.setItem("cart",cart);
		var store = null
		sessionStorage.setItem("store",store);
	}
	
</script>
<body>
	<div id="topDiv">
		<div id="logoBody">
			<h2 id="logo"><a href="./"><img src="./images/logo_white.png"></a></h2>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.customerNo}">
				<div id="loginAndJoin">
				
					<a href="./CustomerLogin.do" onclick="createCart();">로그인</a> | 
					<a href="./CustomerJoin.do">회원가입</a>
				</div>
			</c:when>
			<c:when test="${!empty sessionScope.customerNo}">
				<div id="loginAndJoin">
					${sessionScope.nickname} 회원님 어서 오세요!
					<a href="#"></a> | 
					<a href="./LogOut.do">logout</a> |	
					<a href="./CustomerModifyIntro.do">회원수정</a>
				</div>
			</c:when>
		</c:choose>	
	</div>
	
</body>
</html>