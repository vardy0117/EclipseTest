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
		<h1>storeList.jsp</h1>
		<br>
		<h3>sessionScope.orderRoadAddress : ${sessionScope.orderRoadAddress } (session에 저장해두고 주문시 사용하고 해당세션 비워줌)</h3>
		<h3>sessionScope.orderDetailAddress : ${sessionScope.orderDetailAddress } (session에 저장해두고 주문시 사용하고 해당세션 비워줌)</h3>
		<h3>sessionScope.orderBname : ${sessionScope.orderBname } (store 리스트를 검색할때 deliveryArea컬럼 문자열에 해당 bname이 포함되어 있어야함.)</h3>
		<h1>위의 데이터로 리스트 보여주기</h1>
		
		<a href="./Store.do?storeNo=1"> 경로=./Store.do?storeNo=1 -> 1번가게로 이동</a>
	</div>
</body>
</html>