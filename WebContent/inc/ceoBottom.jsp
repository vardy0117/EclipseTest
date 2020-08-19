<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#bottomDiv{
		width:1000px;
		min-height: 100px;
		background-color: black;
		color: white;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<div id="bottomDiv">
		bottom
<%-- 			<c:when test="${empty sessionScope.ceoNo}"> --%>
				<div><a href="./CeoLogin.do" target="_blank">사장님 로그인</a></div>
<%-- 		</c:when> --%>
	</div>
	
</body>
</html>