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
	}
	#customerJoinDiv {
		width: 400px;
		height: 300px;
		border: 2px solid blue;
		float: left;
		margin-left: 70px;
		padding: 50px;
		text-align: center;
		border-radius: 15px;
	}
	#customerJoinDiv > h2, #customerJoinDiv > p {
		color: blue;
		text-align: center;
	}
	#customerJoinBtn {
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
	#customerJoinBtn:hover {
		color: blue;
		background-color: white;
		border: 2px solid blue;
	}
	
	#ceoJoinDiv {
		width: 400px;
		height: 300px;
		border: 2px solid orange;
		float: right;
		margin-right: 70px;
		padding: 50px;
		text-align: center;
		border-radius: 15px;
	}
	#ceoJoinDiv > h2, #ceoJoinDiv > p {
		color: orange;
		text-align: center;
	}
	#ceoJoinBtn {
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
	#ceoJoinBtn:hover {
		color: orange;
		background-color: white;
		border: 2px solid orange;
	}
</style>
</head>
<body>
	<div id="mainDiv">
		<div style="height: 100px;"></div>
		<div id="customerJoinDiv">
			<h2>일반회원</h2>
			<p>주문을 원하시는 고객을 위한 회원</p>
			<input id="customerJoinBtn" type="button" value="가입하기" onclick="location.href='./CustomerJoin.do'">
		</div>
		<div id="ceoJoinDiv">
			<h2>사업자회원</h2>
			<p>판매를 원하시는 사업주를 위한 회원</p>
			<input id="ceoJoinBtn" type="button" value="가입하기" onclick="location.href='./CeoJoin.do'">
		</div>
	</div>
</body>
</html>