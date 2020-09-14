<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/orderCheckJSP.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	window.onload = function(){
		fillOutList();
	}
	
	var totalPrice=0;
	var firstFood = "";
	var totalQuantity = 0;
	var storeNo="";
	
	
	function fillOutList(){		
		// 결제란 정보 입력
		var storeInfo=JSON.parse(sessionStorage.getItem("store"));
			$(".storeName").html(storeInfo.storeName);
			// $(".storeNo").val(storeInfo.storeName);
			storeNo= storeInfo.storeNo;

		var cart=JSON.parse(sessionStorage.getItem("cart"));
		var tag = "";
		firstFood = cart[0].name;
		
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
	
				totalQuantity += cart[i]["quantity"];	
				totalPrice += cart[i]["price"];
			}
				
			$(".orderRow").html(tag);
			$(".totalPrice").html(totalPrice +" &nbsp;원");
			$("#payment").val(totalPrice);
	}
	
	function discountCoupon(){			
		var tag = "<tr><th style='width:200px'>이 름</th><th style='width:120px'>만료기한</th></tr>";
		$.ajax({
			url : "DiscountCheck.do",
			type: "post",
			success : function(data, textStatus){
				var coupon = JSON.parse(data).couponList;
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
					
					var cancelTag="<tr class='data'><td colspan='2'><a onclick='discountPrice(0, -1)' style='cursor:pointer;'>사용 안함</a></td></tr>";		
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
		$("#payment").val((totalPrice+discountP));
 		console.log($("#couponNo").val());
	}

	function checkData(){
		if(document.getElementById("detailAddress").value == ""){
			$(".alertAddr").css("display", "block");
			$(".alertAddr").text("상세 주소를 입력해 주세요");
			$(".alertAddr").css("color", "red");
			document.getElementById("detailAddress").focus();
	    	return false;
	 	} 
		
		if(document.getElementById("detailAddress").value != ""){
			$(".alertAddr").css("display", "none");
	 	}
 	
		if(document.getElementById("phone").value == ""){
			$(".alertPhone").css("display", "block");
			$(".alertPhone").text("연락처를 입력해 주세요");
			$(".alertPhone").css("color", "red");
			document.getElementById("phone").focus();
		   	return false;
		}
		
		if(document.getElementById("phone").value != ""){
			$(".alertPhone").css("display", "none");
	 	}
 	} 
	
	function doPayment(){	
		checkData();
 		var msg = '주문 확인 \n\n'+
				  '배달 장소 : '+ 
				   document.getElementById("roadAddress").value + ' [상세주소: '+
				   document.getElementById("detailAddress").value + '] \n' +
				  '연 락 처 : '+
				   document.getElementById("phone").value + '\n' +
				   '주문 메뉴 : '+ firstFood+" 외 "+totalQuantity + '\n'+
				   '총 결제 금액 : '+ document.getElementById("payment").value+ '원 \n';
				   
					if( document.getElementById("request").value==""){
						document.getElementById("request").value="없음";
						msg += '주문 시 요청 사항 : 없음 \n\n'+
							   '해당 주문을 결제하시겠습니까?';
					} else {
						msg += '주문 시 요청 사항 : ' + document.getElementById("request").value + '\n\n' +
						       '해당 주문을 결제하시겠습니까?';
					}		   
   					
		console.log(msg);
				   
		 if(confirm(msg)==true){
			IMP.init('imp59001566');
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : $(".storeName").html(),
			    amount : document.getElementById("payment").value,
			    buyer_email : 'iamport@siot.do',
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			       
			        alert(msg);
			
				var cart = sessionStorage.getItem("cart");  
				var deliveryInfoItem ={
								   roadAddress:document.getElementById("roadAddress").value,
						           detailAddress:document.getElementById("detailAddress").value,
						           phone:document.getElementById("phone").value,
						           payment:document.getElementById("payment").value,
						           request:document.getElementById("request").value,
						           couponNo:document.getElementById("couponNo").value
								  }
			
				deliveryInfo = JSON.stringify(deliveryInfoItem);
				console.log(deliveryInfo);
			
		        $.ajax({
		               type : "post",
		               async : false,
		               url : "Order.do?storeNo="+storeNo,
		               data : {"cart":cart,"deliveryInfo":deliveryInfo},
		               success : function(orderNo) {
		           		   sessionStorage.clear();
		            	   alert("주문이 완료되었습니다.");
		            	   location.href='./OrderRealDetail.do?orderNo='+orderNo;
		               }
		         });
        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			}); 
		 }
	}
</script>	

</head>	
<body>
	<div id="mainDiv">
		<form action="Order.do" id="orderfr" method="post">
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
								<input type="text" id="roadAddress" name="roadAddress" class="formRAddress" 
									   value="${sessionScope.orderRoadAddress}"
								  	   style="width:320px;" readOnly>
							</div>
						<div class="clearBoth"></div>
					</div>		
					<div class="formGroup">		
							<div class="formGroupInputDaddr" >
								<input type="text" id="detailAddress" name="detailAddress" class="fromDAddress"  
								  	   value="${sessionScope.orderDetailAddress}" 
								  	   style="width:320px;" placeholder="(필수) 상세 주소 입력">
								<div class="alertAddr"></div>  	   
							</div>
					</div>
					<div class="clearBoth"></div>
					<div class="formGroupPhone">
						<label calss="panelLabel" style="width:100px; margin-right:10px; font-size:14px">연 락 처</label>
							<div class="formGroupInputPhone" >
								<input type="text" id="phone" name="phone" class="formPhone"
									   value="${sessionScope.phone}" 
									   style="width:320px;" placeholder="숫자만 입력하세요 ex)01012345678" numberOnly>
								<div class="alertPhone"></div>
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
								<textarea id="request" name="request" style="width:360px;" placeholder="코로나19예방을 위해 비대면 배달을 권장 드립니다. &quot;문 앞 배달&quot;을 요청사항에 남겨주세요."></textarea>
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
							<div id="totalPrice" class="totalPrice"></div>
						</div>
						<div class="clearBoth"></div>	
					</div>
				</div>
			</div>		
			<div class="AggreedText">
				<span>이용약관, 개인정보 수집 및 이용, 개인정보 제 3자 제공, 전자금융거래 이용약관, 만 14세 이상 이용자 내용을 확인하였으며 결제에 동의합니다.</span>
			</div>
			<input type="hidden" id="payment" name="payment">
			<input type="hidden" name="storeNo" class="storeNo">
			<input type="hidden" id="couponNo" name="couponNo" value="-1">		
			<button type="button" id="pbtn" onclick="doPayment()">결 제 하 기</button>
		</div>	
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