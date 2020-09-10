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
		background: linear-gradient( to bottom, hsl(0deg 0% 0%), hsl(0deg 0% 57%));
	}
	
	#topDiv #logo {
		margin: 10px 10px;
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
		<h2 id="logo"><a href="./ceoIndex.jsp">Delivengers 운영자 페이지</a></h2>
		
			<c:if test="${!empty sessionScope.adminNo}">
				<div id="loginAndJoin">
					${sessionScope.adminNo} (${sessionScope.adminNo }) |
					<a href="./AdminLogout.do">logout</a> |	
					
				</div>
			</c:if>

	</div>
	
	
	
	
</body>
</html>