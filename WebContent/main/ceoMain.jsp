<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 100px;
	}
	#leftDiv {
		width: 30%; 
		height: 350px; 
		float: left;
		margin-left: 9%;
		margin-right: 9%;
		border: 2px solid #c7c7c7;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		border-radius: 15px;
		text-align: center;
	}
	#rightDiv {
		width: 30%; 
		height: 350px; 
		float: right;
		margin-left: 9%;
		margin-right: 9%;
		border: 2px solid #c7c7c7;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		border-radius: 15px;
		text-align: center;
	}
	#leftDiv > h2, #rightDiv > h2 {
		text-align: center;
	}
	#leftDiv img, #rightDiv img {
		width: 250px;
	}
	#mainDiv > a {
		color: black;
		text-decoration: none;
	}
	#leftDiv, #rightDiv {
		transition-duration: 1s;
	}
	#leftDiv:hover, #rightDiv:hover {
		box-shadow: 0 0 20px 0 rgb(0 0 0), 0 5px 5px 0 rgb(0 0 0);
		border: 2px solid rgba(0, 0, 0, 0.7);
	}
</style>
</head>
<body>

	<c:choose>
	<c:when test="${sessionScope.permission eq 'T' }">
		<div id="mainDiv">
			<a href="./addStore.do">
				<div id="leftDiv">
					<h2>업체 등록하기</h2>
					<img src="./images/addStore.svg">
				</div>
			</a>
			<a href="./manageStore.do">
				<div id="rightDiv">
					<h2>업체 관리하기</h2>
					<img src="./images/manageStore.svg">
				</div>
			</a>
		</div>
	</c:when>
	<c:otherwise>
		<div id="mainDiv">
			<h1>아직 Delivenger의 승인을 받지 못했습니다. 기다려주세요!</h1>
		</div>
	</c:otherwise>
	</c:choose>
</body>
</html>