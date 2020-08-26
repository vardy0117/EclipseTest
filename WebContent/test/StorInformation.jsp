<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<style type="text/css">


/*메뉴 디자인*/
/*******************************************************************/
#topMenu {
	height: 30px;
	width: 850px;
	margin: 0 auto;
	margin-top: 80px;
	position: relative;
	padding: 100px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	background: linear-gradient(to right, hsl(98 100% 62%),
		hsl(204 100% 59%));
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS";
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav id="topMenu" >
		<ul>
		<li><a class="menuLink" href="Menu.do">메뉴</a></li>
		<li>|</li>
		<li><a class="menuLink" href="Review.do">리뷰</a></li>
		<li>|</li>
		<li><a class="menuLink" href="StoreInformation.do">정보</a></li>
		<li>|</li>

	</ul>
	</nav>
		
</body>
</html>