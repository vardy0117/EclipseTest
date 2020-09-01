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
		margin-top: 80px;
		width:1000px;
		min-height:600px;
	}
	#mainDiv li{
		list-style: none;
		float: left;
		border: 1px solid blue;
		margin-right: 50px;
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