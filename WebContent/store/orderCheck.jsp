<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/orderCheckJSP.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	window.onload = function(){
		fillOutList();
	}
	var totalPrice=0;
		
	function fillOutList(){		
		// 결제란 정보 입력
		var storeInfo=JSON.parse(sessionStorage.getItem("store"));
		$(".storeName").html(storeInfo.storeName);
		
		var cart=JSON.parse(sessionStorage.getItem("cart"));
		var tag = "";
			for(i=0; i<cart.length; i++){
				tag += '<div class="orderMenu">'+
					   		'<span class="menus">'+cart[i].name+'</span>'+
					   		'&nbsp;x&nbsp;'+
					   		'<sapn class="quantity">'+cart[i].quantity+'</sapn>'+
					   '</div>'+	
					   '<div class="orderPrice">'+
					   '<span class="prcie">'+cart[i].price+' &nbsp;원</span>'+
					   '</div>'+
					   '<div class="clearBoth"></div>';
	
					
				totalPrice += cart[i]["price"];
			}
				
			$(".orderRow").html(tag);
			$(".totalPrice").html(totalPrice +" &nbsp;원");
	}
	
	function discountCoupon(){
	 	/* var url = "store/myCoupon.jsp"
		var title ="myCoupon"
		var status ="toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20";
			window.open(url, title, status);  */
			
			
		var tag = "<tr><th style='width:120px'>이 름</th><th style='width:120px'>만료기한</th></tr>";
		$.ajax({
			url : "DiscountCheck.do",
			type: "post",
			success : function(data, textStatus){
				var coupon = JSON.parse(data).couponList;
				console.log(coupon)
				if(coupon==null || coupon.length==0){
					tag = "<div class='noneCoupon' style='color:#A4A4A4;'>할인 쿠폰이 존재하지 않습니다.</div>"
					$(".myCouponList").html(tag);
				} else {
					for(var i=0 in coupon){
						tag += "<tr class='data' onclick='discountPrice("+coupon[i].discount+","+coupon[i].couponNo+", \""+coupon[i].name+"\")'+ style='cursor:pointer;'>"+
								"<td>"+coupon[i].name+"</td>"+
								"<td>"+coupon[i].expDate+"</td>"+
								"</tr>";
					}
					
					$("#myCouponList").html(tag);
					
					var cancelTag="<tr class='data'><td colspan='2'><a onclick='discountPrice(0, \"false\")' style='cursor:pointer;'>사용 안함</a></td></tr>";		
					$("#myCouponList").append(cancelTag);
				}
			},		
			error:function(couponList,textStatus){
				console.log(data);
				alert("쿠폰 불러오기 에러가 발생했슈");
			}
		}); // $ajax(
				
		$("#myCouponList").css("display","block");		
				
	} 
	
	function discountPrice(dcoupon, couponNo, couponName){
		console.log(dcoupon)
		
		var discountP = -1*totalPrice*(dcoupon/100);
		
		$("#myCouponList").css("display","none");	
		$(".discountPrice").html(discountP + " &nbsp;원");
		$(".discountName").html("할인 금액&nbsp;&nbsp;["+couponName+"]");
		if(dcoupon==0){
			$(".discountPrice").css("display","none");
			$(".discountName").html("할인 금액");
		}
		$(".totalPrice").html((totalPrice+discountP) +" &nbsp;원");
		
		$("#couponNo").val(couponNo);
	}
	
/* 	function order(){
		var storageCart=JSON.parse(sessionStorage.getItem("cart"));
		
		var cartList = new Array();
			cart = sessionStorage.getItem("cart");
		
			$.ajax({
					type : "post",
					async : false,
					url : "Order.do?storeNo="+storeNo,
					data : {"cart":cart,"deliveryInfo":deliveryInfo},
					success : function(result,textStatus){
							kakaoPayment();
					},		
					error:function(data,textStatus){
						console.log(data);
						alert("에러가 발생했슈");
					}
				}); // $ajax()
	} */
	
	function payment(){
		IMP.init('imp93100667');
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 14000, //판매 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
</script>	

</head>	
<body>
	<div id="mainDiv">
		<form action="Order.do" class="orderForm" onsubmit=false method="post">
		<div class="left">
			<div class="subTitle">
				<span>결제하기</span>
			</div>
			<div class="panelGroup">
				<div class="panelGroup-Head">
					<div class="panelHeading">
						<a onclick="deliveryInfoToggle()" style="cursor:pointer">
							<span class="panelTitle">배달정보</span>
							<!-- 올리기 내리기 버튼 -->
						</a>
					</div>
				</div>	
				<div class="panelGroup-Body">
					<div class="formGroup">
						<label class="panelLabel" style="width:100px; margin-right:10px; font-size:14px">주 &nbsp;&nbsp;&nbsp;&nbsp;소</label>
							<div class="formGroupInputRaddr">
								<input type="text" name="roadAddress" class="formRAddress" 
									   value="${sessionScope.orderRoadAddress}"
								  	   style="width:320px;" readOnly>
							</div>
						<div class="clearBoth"></div>
					</div>		
					<div class="formGroup">		
							<div class="formGroupInputDaddr" >
								<input type="text" name="detailAddress" class="fromDAddress"  
								  	   value="${sessionScope.orderDetailAddress}" 
								  	   style="width:320px;" placeholder="(필수) 상세 주소 입력">
							</div>
					</div>
					<div class="clearBoth"></div>
					<div class="formGroupPhone">
						<label calss="panelLabel" style="width:100px; margin-right:10px; font-size:14px">연 락 처</label>
							<div class="formGroupInputPhone" >
								<input type="text" name="phone" class="formPhone" 
									   value="${sessionScope.phone}" 
									   style="width:320px;" placeholder="숫자만 입력하세요 ex)01012345678" numberOnly>
							</div> 
					</div>
				</div>
			</div>	
			<div class="panelGroup">
				<div class="panelGroup-Head">
					<div class="panelHeading">
						<a onclick="deliveryInfoToggle()" style="cursor:pointer">
							<span class="panelTitle" >주문시 요청사항</span>
							<!-- 올리기 내리기 버튼 -->
						</a>
					</div>
				</div>
				<div class="panelGroup-Body">
					<div class="formGroup">
						<label class="panelLabel" style="width:100px; margin-right:10px; font-size:14px">요청사항</label>
							<div class="formGroupTextArea">
								<textarea name="request" style="width:360px;" placeholder="코로나19예방을 위해 비대면 배달을 권장 드립니다. &quot;문 앞 배달&quot;을 요청사항에 남겨주세요."></textarea>
							</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="panelGroup-Default">
				<div class="panelGroup-Default-Head">	
					<div class="panelHeading">
						<span class="panelTitle">주문내역</span>
					</div>
				</div>		
				<div class="panelGroup-Default-Body">
					<div class="storeName"></div>
					<div class="orderRow" id="orderRow"></div>
					<div class="carTotal">
						<div class="orderDiscount">
							<div class="discountName">할인 금액</div>
							<div class="discountPrice"></div>
							<div class="clearBoth"></div>	 	
							<div class="myCouponList">
								<button type=button id="dbtn" onclick="discountCoupon()">할인 쿠폰 확인</button>
								<table id=myCouponList style="display:none">
									
								</table>
							</div>
						</div>
						<div class="clearBoth"></div>
						<div class="orderTotal">
							<div class="totalName">총 결제 금액</div>
							<div class="totalPrice"></div>
						</div>
						<div class="clearBoth"></div>	
					</div>
				</div>
			</div>		
			<div class="AggreedText">
				<span>이용약관, 개인정보 수집 및 이용, 개인정보 제 3자 제공, 전자금융거래 이용약관, 만 14세 이상 이용자 내용을 확인하였으며 결제에 동의합니다.</span>
			</div>		
			<button id="pbtn" onclick="payment();">결 제 하 기</button>
		</div>	
			<input type="hidden" id="couponNo" name="couponNo" value="false">
		</form>
		<div style="clear:both;"></div>
	</div>
</body>
<script>
$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});
</script>
</html> 