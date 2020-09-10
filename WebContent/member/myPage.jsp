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
	#mainDiv{
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 100px;
		
	}
	#customerModifyDiv, #myOrderDiv, #myReviewDiv, #myCoupon {
		width: 20%;
		height: 400px;
		float: left;
		margin: 0 1%;
		text-align: center;
		border: 1px solid hsl(98 100% 62% / 43%);
   	 	box-shadow: 0 0 20px 0 hsl(98 100% 62% / 25%), 0 5px 5px 0 hsl(204 100% 59% / 25%);
	    border-radius: 15px;
	    transition-duration: 0.4s;
	}
	#customerModifyDiv:hover, #myOrderDiv:hover, #myReviewDiv:hover, #myCoupon:hover {
		box-shadow: 0 0 20px 0 hsl(98 100% 62%), 0 5px 5px 0 hsl(204 100% 59%);
		background: hsl(98 100% 62%);
    	color: white;
    	text-shadow: 2px 1px 1px grey;
    }
	#mainDiv a {
		color: #000000a3;
		text-decoration: none;
	}
	#mainDiv h2 {
		margin-top: 40px;
		font-size: 2rem;
	}
	#customerModifyDiv img, #myOrderDiv img, #myReviewDiv img ,#myCoupon img{
		width: 90%;
	}
</style>
<script>
	function hover(element) {
		var hoverFileName = element.querySelector('img').src.replace('gradient', 'white');
		element.querySelector('img').setAttribute('src', hoverFileName);
	}
	function unhover(element) {
		var unhoverFileName = element.querySelector('img').src.replace('white', 'gradient');
		element.querySelector('img').setAttribute('src', unhoverFileName);
	}
</script>
<body>
		<div id="mainDiv">
			<a href="./CustomerModifyIntro.do" onmouseover="hover(this);" onmouseout="unhover(this);">
				<div id="customerModifyDiv" style="margin-left: 3%;">
					<h2>정보 수정</h2>
					<img src="images/customerModify_gradient.svg">
				</div>
			</a>
			<a href="./OrderDetail.do" onmouseover="hover(this);" onmouseout="unhover(this);">
				<div id="myOrderDiv">
					<h2>나의 주문</h2>
					<img src="images/myOrder_gradient.svg">
				</div>
			</a>
			<a href="./MyReview.do" onmouseover="hover(this);" onmouseout="unhover(this);">
				<div id="myReviewDiv">
					<h2>나의 리뷰</h2>
					<img src="images/myReview_gradient.svg">
				</div>
			</a>
			<a href="./MyCoupon.do" onmouseover="hover(this);" onmouseout="unhover(this);">
				<div id="myCoupon">
					<h2>나의 쿠폰</h2>
					<img src="images/myReview_gradient.svg">
				</div>
			</a>
		</div>
</body>
</html>