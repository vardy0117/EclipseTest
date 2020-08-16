<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	#selJoinDiv {
		width: 600px;
		height: 200px;
		position: absolute;
		top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%)
	}
</style>
</head>
<body>
	<div id="mainDiv">
		<div id="selJoinDiv">
			<a href="./CustomerJoin.me">
				<img src="images/customerJoin.jpg" alt="일반회원가입">
			</a>
			
			<a href="#">
				<img src="images/ceoJoin.jpg" alt="사업자회원가입">
			</a>
		</div>
	</div>
</body>
</html>