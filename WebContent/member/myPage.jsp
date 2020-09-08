<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#mainDiv{

		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 30px;
		
	}
	#mainDiv li{
/* 		list-style: none;
		float: left;
		border: 1px solid blue;
		margin-right: 50px; */
		
		border: 1px solid blue;
		list-style: none;
		float: left;
		width: 25.33333%;
		height: 50px;
    	line-height: 50px;
		border: 1px solid #d9d9d9;
		text-align: center;
		cursor: pointer;
	}
	
	#mainDiv li{
	
	box-sizing: border-box;}
	
	#mainDiv li:hover {
		cursor: pointer;
		opacity: 1;
	}
	

</style>
<body>
		<div id="mainDiv">
			<ul>
				<li><a href="./CustomerModifyIntro.do">회원수정</a></li>
				<li><a href="./OrderDetail.do">나의 주문</a></li>
				<li><a href="./MyReview.do">나의 리뷰</a></li>
			</ul>
		</div>
</body>
</html>