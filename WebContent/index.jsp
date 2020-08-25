<%@page import="net.ceo.db.CeoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	@font-face {
		font-family: 'BMEULJIRO';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
    	font-family: 'Binggrae-Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
            
            
	body {
		margin: 0 0;
		font-family: 'Binggrae-Bold';
	}
</style>
<script>
	var cart = null;
	sessionStorage.setItem("cart",cart);
</script>
</head>
<body>
	<c:set  var="center" value="${param.center}"/>
	<c:if test="${center==null}">
		<c:set var="center" value="/main/main.jsp" />
	</c:if>
	<jsp:include page="/inc/top.jsp"/>
	<jsp:include page="${center }"/>
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
	
</body>
</html>