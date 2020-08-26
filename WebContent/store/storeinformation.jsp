<!--store information  -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="mainDiv">
		<h1>storeinformation.jsp</h1>
		<br>
		<h2>storeNo : ${storeNo}</h2>
		<h2>현재는 우선 storeNo만 들고옴 컨트롤러에서 storeNo를 이용해 storeBean을 들고와야함!!</h2>
		<h2>그리고 storeNo로 menu / review도 들고와야함</h2>
		<h3>여기서 메뉴선택 및 수량지정 할 수 있는 로직을 구현 해야함.</h3>
		<c:set var="info" value="${requestScope.storeInfo}"/>
		스토어 넘버 : ${info.storeNo} <br>
		사장님 넘버 : ${info.ceoNo} <br>
		스토어 이름 : ${info.name} <br>
		도로명 : ${info.roadAddress} <br>
		상세주소 : ${info.detailAddress} <br>
		카테고리 : ${info.category} <br>
		폰 : ${info.phone} <br>
		가게이름 : ${info.storeHours} <br>
		사장님 한마디 : ${info.message} <br>
		가게 사진: ${info.image} <br>
		별점?: ${info.points} <br>
		누적주문수 : ${info.orderCount} <br>
		사업자 등록 번호 : ${info.regNo} <br>
		</div>
</body>
</html>