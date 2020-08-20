<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#topDiv{
		width:1000px;
		height: 50px;
		background-color: black;
		color: white;
		margin: 0 auto;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 1000;
	}
	
	#topDiv #logo {
		text-align: center;
		margin: 10px 0;
	}
	#topDiv a {
		text-decoration: none;
		color: white;
	}
	
	#loginAndJoin {
		position: absolute;
		right: 10px;
		top: 10px;
	}
	#loginAndJoin a {
		text-decoration: none;
		color: white;
	}
	#loginAndJoin a:hover {
		text-decoration: underline;
		color: white;
	}
</style>
</head>
<body>
	<div id="topDiv">
		<h2 id="logo"><a href="">Delivengers 사장님 페이지</a></h2>
		
			<div id="topDiv">
		<h2 id="logo"><a href="./">Delivengers</a></h2>
		<c:choose>
			<c:when test="${empty sessionScope.ceoNo}">
				<div id="loginAndJoin">
				
					<a href="./CeoLogin.do">로그인</a> | 
					<a href="./CeoJoin.do">회원가입</a> |
				</div>
			</c:when>
			<c:when test="${!empty sessionScope.email}">
				<div id="loginAndJoin">
					${sessionScope.email} 사장님 어서 오세요!
					<a href="#"></a> | 
					<a href="./LogOut.do">logout</a> |	
					<a href="./CeoModifyIntro.do">사장님 정보수정</a>
				</div>
			</c:when>
		</c:choose>	
	</div>
	
	</div>
	
	
	
	
</body>
</html>