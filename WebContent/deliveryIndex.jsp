<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
@font-face {
	font-family: 'BMEULJIRO';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	margin: 0 0;
	font-family: 'Binggrae-Bold';
}

#mainDiv {
	margin: 0 auto;
	margin-Top: 120px;
}

div {
	box-sizing: border-box;
}

#loginDiv {
	width: 1000px;
	min-height: 600px;
	border: 2px solid green;
	margin: 0 auto;
	margin-top: 50px;
	position: relative;
}

.td_left {
	text-align: right;
}

form>table {
	font-size: 1.2rem;
	margin: 0 auto;
}

.td_right {
	padding-left: 10px;
}

.inputData {
	width: 250px;
	height: 30px;
	border-radius: 12px;
	border: 2px solid gray;
	padding-left: 15px;
	font-family: Binggrae-Bold;
	font-size: 1rem;
}

input[type=password] {
	font-family: 'pass', 'Roboto', Helvetica, Arial, sans-serif;
}

input[type=password]::placeholder {
	font-family: Binggrae-Bold;
}

input:focus {
	outline: none;
}

#formDiv {
	width: 500px;
	height: 300px;
	margin: 0 auto;
	border: 2px solid #c7c7c7;
	border-radius: 15px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.btn {
	width: 245px;
	background: linear-gradient(to bottom, hsl(0deg 0% 0%), hsl(0deg 0% 57%));
	font-family: Binggrae-Bold;
	font-size: 1rem;
	color: white;
	border: none;
	border-radius: 12px;
	width: 270px;
	height: 35px;
	transition-duration: 1s;
	opacity: 0.7;
}

.btn:hover {
	cursor: pointer;
	opacity: 1;
}

@media ( max-width : 900px)and (min-width:400px) {
	.left {
		float: left;
		width: 100%;
		background-color: aqua;
	}
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
	var orderNo = "${param.orderNo}";
	var tag = "";
		$.ajax({
				type : "get",
				async : true,
				url : "./InsertDeliveryInfo.do?orderNo=" + orderNo,
				success : function(data, textStatus) {
					if (data == 0) {
						alert("이미 배차한 주문 입니다.");
						location.href = "./deliveryIndex.jsp";
					} else {
						var obj = JSON.parse(data);
						for (var i = 0; i < obj.list.length; i++) {
							tag += '<tr class="deliveryInfo">' + '<td>'
									+ obj.list[i]["orderNo"] + '</td>' + '<td>'
									+ obj.list[i]["roadAddress"] + '&nbsp;'
									+ obj.list[i]["detailAddress"] + '</td>'
									+ '<td>' + obj.list[i]["customerPhone"]
									+ '</td>' + '<td>' + obj.list[i]["request"]
									+ '</td>'

							if (obj.list[i]["deliveryCheck"] == 'D') {
								tag += '<td><button type="button" onclick="deliveryFinish();">배달 완료 확인!</button></td>';
							} else if (obj.list[i]["deliveryCheck"] == 'T') {
								tag += '<td>' + obj.list[i]["departureTime"]
										+ '</td>';
							}
						}
						$("#deliveryList").append(tag);
					}

				},
				error : function(data, textStatus) {
					alert("Ajax 통신 Error : " + textStatus);
				}

			});//ajax 끝 */

	function mo_chk() {

		var os;

		var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent
				.toLowerCase()));

		if (mobile) {
			var userAgent = navigator.userAgent.toLowerCase();
			if (userAgent.search("android") > -1) {
				return os = "android";
			} else if ((userAgent.search("iphone") > -1)
					|| (userAgent.search("ipod") > -1)
					|| (userAgent.search("ipad") > -1)) {
				return os = "ios";
			} else {
				return os = "otehr";
			}

		} else {
			return os = "pc";
		}
	}

	function action_app_instagram(android_url, ios_url, ios_appstore_url) {
		var result_mo_chk = mo_chk();

		if (result_mo_chk != "pc") {
			if (result_mo_chk == "ios") {

				setTimeout(function() {
					window.open(ios_appstore_url);
				}, 1500);

				location.href = ios_url;
			} else {
				location.href = android_url;
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="/inc/deliveryTop.jsp" />

	<div id=mainDiv>

		<c:choose>
			<c:when test="${empty sessionScope.delivengersNo}">
				<div id="formDiv">
					<h1 style="text-align: center;">배달원 로그인</h1>
					<form action="./DeliveryLoginAction.do" method="post">
						<table>
							<tr>
								<td class="td_right"><input class="inputData" type="text"
									name="delivengersNo" id="delivengersNo" placeholder="폰번호" /></td>
							</tr>
							<tr>
								<td class="td_right"><input class="inputData"
									type="password" name="password" id="password"
									placeholder="비밀번호" /></td>
							</tr>
							<tr>
								<td class="td_right"><input class="btn" type="submit"
									value="로그인" /></td>
							</tr>
						</table>
					</form>
				</div>


				<center>
					<img src="images/배달.jpg" alt="사진이 읎네" width="300" height="300" />
				</center>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="left">
					<a href="intent://paxi.site#Intent;package=com.kitkats.qrscanner;scheme=https;end" target="blank">주문 배차</a>
				</div>
			</div>
			<hr>
			<table id="deliveryList">
				<tr style="text-align: center;">
					<td>주문 번호</td>
					<td>배달 장소</td>
					<td>연락처</td>
					<td>요청 사항</td>
					<td>배달 완료</td>
				</tr>
			</table>
	</c:otherwise>
	</c:choose>
	</div>
</body>
</html>