<%@page import="net.ceo.db.CeoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>딜리벤져스 관리자 페이지</title>
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
</head>
<body>
	<jsp:include page="/inc/adminTop.jsp"/>
	<c:choose>
	<c:when test="${empty sessionScope.adminNo}">
		<div id="formDiv">
					<h1 style="text-align: center;">운영자 로그인</h1>
					<form action="./AdminLoginAction.do" method="post">
						<table>
							<tr>
								<td class="td_right"><input class="inputData" type="text"
									name="adminNo" id="delivengersNo"  /></td>
							</tr>
							<tr>
								<td class="td_right"><input class="inputData"
									type="password" name="password" id="password"
									placeholder="비밀번호" /></td>
							</tr>
							<tr>
								<td class="td_right"><input class="btn" type="submit"
									value="로그인" /></td>
							</tr>
							
							
						</table>
					</form>
				</div>
	</c:when>
	<c:when test="${!empty sessionScope.adminNo}">
		<c:set  var="center" value="${param.center}"/>
		
		<c:if test="${center==null}">
			<c:set var="center" value="/main/adminMain.jsp" />
		</c:if>
		
		<jsp:include page="${center }"/>
	</c:when>
	</c:choose>
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</body>
</html>