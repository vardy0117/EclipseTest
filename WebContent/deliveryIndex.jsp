<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>딜리벤져스 배달원</title>

<link rel="stylesheet" href="CSS/deliveryIndexJSP.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
							var departureTime = obj.list[i]["departureTime"];
							tag += '<tr class="deliveryInfo">' + '<td style="text-align: center;">'
									+ obj.list[i]["orderNo"] + '</td>' + '<td>'
									+ obj.list[i]["roadAddress"] + ' '
									+ obj.list[i]["detailAddress"] + '</td>'
									+ '<td>' + obj.list[i]["customerPhone"]
									+ '</td>' + '<td>' + obj.list[i]["request"]
									+ '</td>'

							if (obj.list[i]["deliveryCheck"] == 'D') {
								tag += '<td style="text-align:center;"><button id="deliveryFinishBtn" type="button" onclick="deliveryFinish('+obj.list[i]["orderNo"]+');">완료하기</button></td>';
							} else if (obj.list[i]["deliveryCheck"] == 'T' || obj.list[i]["deliveryCheck"] == 'A') {
								tag += '<td style="text-align:center; color:green;">' + '배달완료'
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
			
			function deliveryFinish(orderNo){
				
				if(confirm(orderNo+"번  배달완료 하시겠습니까?")==true){
					location.href='deleveryTrue.do?orderNo='+orderNo;
				}
			}

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
					<img id="leftImg" src="images/배달.jpg" alt="사진이 읎네" width="150" height="150" />
				</div>


				<%-- <center style="position: absolute; top:23.5%; left:65%;">
					<img style="transform: scaleX(-1);" src="images/배달.jpg" alt="사진이 읎네" width="300" height="300" />
				</center> --%>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="left">
					<a href="intent://paxi.site#Intent;package=com.kitkats.qrscanner;scheme=https;end" target="blank">&nbsp;&nbsp;&nbsp;주문 배차&nbsp;&nbsp;&nbsp;</a>
				</div>
			</div>
			<hr>
			<table id="deliveryList">
				<tr style="text-align: center;">
					<th>No</th>
					<th>배달 주소</th>
					<th>연락처</th>
					<th>요청 사항</th>
					<th>배달 완료</th>
				</tr>
			</table>
	</c:otherwise>
	</c:choose>
	</div>
</body>
</html>