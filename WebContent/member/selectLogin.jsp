<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 80px;
	}
	#customerLoginDiv {
		width: 400px;
		height: 300px;
		border: 2px solid blue;
		float: left;
		margin-left: 70px;
		padding: 50px;
		text-align: center;
		border-radius: 15px;
	}
	#customerJLoginDiv > h2, #customerJoinDiv > p {
		color: blue;
		text-align: center;
	}
	#customerLoginBtn {
		font-family: 'BMEULJIRO';
		width: 200px;
		height: 50px;
		background-color: blue;
		border-radius: 12px;
		color: white;
		font-size: 1.5rem;
		border: 0px;
		transition-duration: 0.4s;
	}
	#customerLoginBtn:hover {
		color: blue;
		background-color: white;
		border: 2px solid blue;
	}
	
	#ceoLoginDiv {
		width: 400px;
		height: 300px;
		border: 2px solid orange;
		float: right;
		margin-right: 70px;
		padding: 50px;
		text-align: center;
		border-radius: 15px;
	}
	#ceoLoginDiv > h2, #ceoJoinDiv > p {
		color: orange;
		text-align: center;
	}
	#ceoLoginBtn {
		font-family: 'BMEULJIRO';
		width: 200px;
		height: 50px;
		background-color: orange;
		border-radius: 12px;
		color: white;
		font-size: 1.5rem;
		border: 0px;
		transition-duration: 0.4s;
	}
	#ceoLoginBtn:hover {
		color: orange;
		background-color: white;
		border: 2px solid orange;
	}
</style>

</head>

<body>
	
		<div id="mainDiv">
		<div style="height: 100px;"></div>
		<div id="customerLoginDiv">
			<h2>일반회원</h2>
			<p>주문을 원하시는 고객을 위한 회원</p>
			<input id="customerLoginBtn" type="button" value="로그인하기" onclick="location.href='./CustomerLogin.do'">
		</div>
		<div id="ceoLoginDiv">
			<h2>사업자회원</h2>
			<p>판매를 원하시는 사업주를 위한 회원</p>
			<input id="ceoLoginBtn" type="button" value="로그인하기" onclick="location.href='./BusinessLogin.do'">
		</div>
	</div>
	
	
</body>
</html>