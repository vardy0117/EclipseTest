<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#bottomDiv{
		width:100%;
		min-height: 100px;
		color: white;
		margin: 0 auto;
		background-color: #19ce60;
		padding-bottom: 20px;
	}
	#bottomWrap {
		width: 1000px;
		margin: 20px auto;
		color: white;
		padding-top: 25px;
	}
	#company-logo {
		position: absolute;
	}
	#company-logo img{
		width: 150px;
	}
	#company-info {
		margin-left: 200px;
	}
	#githubLink {
		position: absolute;
	}
	#ceoLink {
		position: absolute;
	}
	#githubLink img, #ceoLink img {
		width: 50px;
	}
	#linkWrap {
		margin-left: 200px;
		width: 700px;
		text-align: right;
	}
	#linkWrap a {
		color: white;
		text-decoration: none;
	}
	#linkWrap a:hover {
		text-decoration: underline;
	}
</style>
</head>

<body>
	<div id="bottomDiv">
		<div id="bottomWrap">
			<div id="company-logo">
				<img src="./images/logo_white.png">
			</div>
			<div id="company-info">
				<strong>(주)딜리벤져스</strong>
				<p>
					부산시 부산진구 동천로109 삼한골든게이트 7층 6강의장 1조
				</p>
				<p style="font-size: 0.7rem; width: 700px;">
					딜리벤져스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품/ 거래정보 및 거래와 관련하여 요기요에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 딜리벤져스는 책임을 지지 않습니다. 상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다. Copyright Delivengers. All Rights Reserved.
				</p>
			</div>
			<div id="linkWrap">
				<a href="./CeoLogin.do" target="_blank">딜리벤져스 사장님</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="https://github.com/vardy0117/Group1-Team-Project" target="_blank">Github 바로가기</a>			
			</div>
		</div>
		<!-- <div><a href="./CeoLogin.do" target="_blank">사장님 로그인</a></div> -->
	</div>
	
	
</body>
</html>