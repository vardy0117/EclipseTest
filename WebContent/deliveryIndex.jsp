<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@font-face {
		font-family: 'BMEULJIRO';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
    	font-family: 'Binggrae-Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
            
	body {
		margin: 0 0;
		font-family: 'Binggrae-Bold';
	}
	
	#mainDiv{
		margin-Top:100px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
	var orderNo= ${param.orderNo};
	$.ajax({
		type : "get",
		async : false,
		url : "./InsertDeliveryInfo.do?orderNo="+orderNo,
		success : function(data,textStatus){
			var obj = JSON.parse(data);
			var tag = '<tr>'
					+ 	'<td>주문번호 </td>'
					+ 	'<td>'+obj.orderNo+'</td>'
					+ '</tr>'
					+ '<tr>'
					+ 	'<td>주 소</td>'
					+ 	'<td>'+obj.roadAddress+'&nbsp;'+obj.detailAddress+'</td>'
					+ '</tr>'
					+ 	'<td>연락처 </td>'
					+ 	'<td>'+obj.orderNo+'</td>'
					+ '</tr>'
					+ 	'<td>요청사항 </td>'
					+ 	'<td>'+obj.request+'</td>'
					+ '</tr>'
					+ '</tr>'
					+ 	'<td>출발시각 </td>'
					+ 	'<td>'+obj.departureTime+'</td>'
					+ '</tr>'
					+ '</tr>'
					+ 	'<td>도착시각 </td>'
					+ 	'<td onclick = >배달완료 클릭!</td>'
					+ '</tr>';			
		},error:function(data,textStatus){
			alert("Ajax 통신 Error : "+textStatus);
		}
		
	});//ajax 끝 */
	
	
	
	function mo_chk(){

		var os;

		var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase()));	 

		if (mobile) {
			var userAgent = navigator.userAgent.toLowerCase();
			if (userAgent.search("android") > -1){
				return os = "android";
			}else if ((userAgent.search("iphone") > -1) || (userAgent.search("ipod") > -1) || (userAgent.search("ipad") > -1)){
				return os = "ios";
			}else{
				return os = "otehr";
			}

		} else {
			return os = "pc";
		}
	}


	function action_app_instagram(android_url , ios_url , ios_appstore_url){
		var result_mo_chk = mo_chk();

		if(result_mo_chk!="pc"){
			if(result_mo_chk == "ios"){

				setTimeout( function() {
					window.open(ios_appstore_url);
				}, 1500);

				location.href = ios_url;
			}else{
				location.href = android_url;
			}
		}
	}
	
	
	
</script>
</head>
<body>	
	<jsp:include page="/inc/deliveryTop.jsp"/>
	
	
	
	<div id=mainDiv>
		
		<!--  <span onclick="action_app_instagram('intent://instagram.com/#Intent;package=com.instagram.android;scheme=https;end', 'instagram://media', 'https://itunes.apple.com/kr/app/instagram/id389801252?mt=8')"> -->
<!--            App 실행  -->
<!--         </span> -->

<h1> QR코드 연결 안드로이드 전용 버튼 (컴퓨터에서 안됨)</h1>
<a href="intent://paxi.site#Intent;package=com.kitkats.qrscanner;scheme=https;end" target="blank">qr코드 안드로이드 전용 버튼 </a>
<!-- playstore로 연결 (안드로이드 전용) -->
<br>
<br>

<h1> 아이폰 전용 버튼 (컴퓨터에서 안됨)</h1>
<a href="instagram://media" target="blank">아이폰 전용 버튼 (인스타 그램으로 연결 됨)</a>
<!--인스타그램으로 연결 아이폰 전용 버튼 -->
	




	</div>
</body>
</html>