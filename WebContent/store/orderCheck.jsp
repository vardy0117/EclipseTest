<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style> 
 #mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
}

 .left {
 	width : 480px; 
 	float: left;
 	padding : 10px;
 }	
 
 .right {
 	width : 380px;
 	float: left;
	padding : 10px;
 }
 
 .panelGroup, .storeName, .orderRow, .carTotal  {
 	border : 1px solid #DCDCDC;
 }
 
 .panelGroup-Default {
 	margin-bottom: 20px;
 }
 
 .panelGroup-Default-Head {
 	height : 40px;
 	padding : 0 0 0 0 ;
 }
 
 .subTitle {
 	background-color : #000000;
 	width : 460px;
 	height : 23px;
 	padding : 10px;
 	margin : 0 auto;
 	color : #F0FFFF;
 	font-weight : bold
 }

 .panelHeading {
 	background-color : #DCDCDC;
 	padding : 10px;
 	margin : 0 auto;
 }	
 
 .panelGroup-Body {
 	padding : 10px;
 	display : inline-block;
 }
 
 div.formGroup{
 	padding : 5px 0 5px;
 }
 
 div.formGroup div.formGroupInputRaddr input, ::placeholder{
 	color : #A4A4A4;
	font-weight : bolder;
 }
 
 div.formGroup div.formGroupInputRaddr, div.formGroupInputDaddr, div.formGroupInputPhone, div.formGroupTextArea{
 	float : right;
 }
 
 input:focus, textarea:focus, button:focus{ 
 	outline: none; 
 }
 
 div.formGroupPhone{
 	margin-top:10px;
 }
 
 .storeName {
 	height : 22px;
 	padding : 10px;
 }
 
 .orderRow {
  	padding : 10px;
  	width : 358px;
  	background-color: #FFF8DC;
  	display : inline-block;
 }
 
 div.orderMenu {
 	float : left;
 }
 
 div.orderPrice{
 	float : right;
 }
 
  .carTotal {
 	padding : 10px;
 }
 
 .orderTotal{
 	margin-top : 10px;
 	color : #DC143C;
 	font-weight : bold;
 }
 
 .discountName, .totalName {
	float : left;
 }
 
  .clearBoth {
	clear : both;	
 }

 .discountPrice, .totalPrice {
 	float : right;
 }

 .AggreedText {
  	clear : both;
  	margin-top : 20px;
 	font-size : 12px;
 }
 
 	button#pbtn{
 	width : 100%;
 	height : 40px;
	margin-top: 20px;
 	background-color:  #DC143C;
 	border:0px;
 	color :  #F0FFFF;
 	font-size : 20px;
 	font-weight : bold;
 	text-align : center;
 	cursor : pointer;
 }
 
 button#dbtn{
 	width : 33%;
 	border:0px;
 	color :  green;
 	font-size : 14px;
 	font-weight : bold;
 	text-align : center;
 	cursor : pointer;
 }
 
 table#myCouponList tr.data:hover {
 	color : green;
 }
 

</style>
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
				if(data==null){
					tag = "<tr class='data' onclick='cancelDiscount()'><td colspan='2'>할인 쿠폰이 없습니다.</td></tr>"
				} else {
					var coupon = JSON.parse(data).couponList;
					for(var i=0 in coupon){
						tag += "<tr class='data' onclick='discountPrice("+coupon[i].discount+","+coupon[i].couponNo+")'+ style='cursor:pointer;'>"+
								"<td>"+coupon[i].name+"</td>"+
								"<td>"+coupon[i].expDate+"</td>"+
								"</tr>";
								
						console.log(coupon[i].discount);
					}
					
					$("#myCouponList").html(tag);
					
					var cancelTag="<tr class='data'><td colspan='2'><a onclick='cancelDiscount()' style='cursor:pointer;'>사용 안함</a></td></tr>";		
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
	
	function discountPrice(dcoupon, couponNo){
		var discount=dcoupon;
		
		var discountP = -1*totalPrice*(dcoupon/100);
		
		var inputHiddenTag = "<input type='hidden' name='couponNo' value="+couponNo+">";
		
		$("#myCouponList").css("display","none");	
		$(".discountPrice").html(discountP + " &nbsp;원");
		$(".totalPrice").html((totalPrice-discountP) +" &nbsp;원");
		
		$(".orderForm").html(inputHiddenTag);
	}
	
	function cancelDiscount(){	
		$("#myCouponList").css("display","none");			
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
</script>	

</head>	
<body>
	<div id="mainDiv">
		<form action="Order.do" class="orderForm" method="post">
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