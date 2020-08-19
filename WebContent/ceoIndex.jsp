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
            
	body {
		margin: 0 0;
		font-family: 'BMEULJIRO';
	}
</style>
</head>
<body>
	<c:set  var="center" value="${param.center}"/>
	<c:if test="${center==null}">
		<c:set var="center" value="/main/main.jsp" />
	</c:if>
	<jsp:include page="/inc/ceoTop.jsp"/>
	<jsp:include page="${center }"/>
	<jsp:include page="/inc/ceoBottom.jsp"></jsp:include>
	
</body>
</html>