<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
</style>
</head>
<body>
	<div id="mainDiv">
		<h1>store.jsp</h1>
		<br>
		<h2>storeNo : ${storeNo}</h2>
		<h2>현재는 우선 storeNo만 들고옴 컨트롤러에서 storeNo를 이용해 storeBean을 들고와야함!!</h2>
		<h2>그리고 storeNo로 menu / review도 들고와야함</h2>
		<h3>여기서 메뉴선택 및 수량지정 할 수 있는 로직을 구현 해야함.</h3>
	</div>
</body>
</html>