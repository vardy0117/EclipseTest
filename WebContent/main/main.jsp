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
	#searchDiv {
		width: 600px;
		height: 200px;
		border: 2px solid pink;
		position: absolute;
		top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%)
	}
</style>
</head>
<body>
	<div id="mainDiv">
		<h1 style="text-align: center;">main.jsp</h1>
		<div id="searchDiv">
			<h2 style="text-align: center;">주소검색</h2>
		</div>
	</div>
</body>
</html>