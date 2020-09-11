<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#mainDiv{
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 100px;
	}
	#couponT{
		width: 900px;
		margin: 0 auto;
	}
	#title td{
		background: #19ce60;
    	color: white;
		border-bottom: 1px solid black;
	}
	#tableInner:HOVER{
		background-color: #f5f5f5;
	}
	#unUsedCoupon {
		text-align: center;
		font-size: 1.5rem;
	}
</style>
<body>
	<div id="mainDiv">
		<div id="unUsedCoupon">사용 가능한 쿠폰</div>
		<hr>
		<table id="couponT">
			<tr style="border-bottom: 1px; text-align: center;" id="title">
				<td>쿠폰 번호</td>
				<td>쿠폰 이름</td>
				<td>할인률</td>
				<td>쿠폰 마감일</td>
			</tr>
			<c:forEach items="${requestScope.unUsedCouponList }" var="unUsedCoupon">
				<tr style="text-align: center;" id="tableInner">
					<td>${unUsedCoupon.couponNo }</td>
					<td>${unUsedCoupon.name }</td>
					<td>${unUsedCoupon.discount }%</td>
					<td>${fn:substring(unUsedCoupon.expDate,0, 10) }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>