<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#topDiv{
		width:1000px;
		height: 50px;
		background-color: black;
		color: white;
		margin: 0 auto;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 1000;
	}
	
	#topDiv #logo {
		text-align: center;
		margin: 10px 0;
	}
	
	#loginAndJoin {
		position: absolute;
		right: 10px;
		top: 10px;
	}
	#loginAndJoin a {
		text-decoration: none;
		color: white;
	}
	#loginAndJoin a:hover {
		text-decoration: underline;
		color: white;
	}
</style>
</head>
<body>
	<div id="topDiv">
		<h2 id="logo">Delivengers</h2>
		<div id="loginAndJoin">
			<a href="./login.do">로그인</a>
			 | <a href="./join.do">회원가입</a>
		 </div>
	</div>
</body>
</html>