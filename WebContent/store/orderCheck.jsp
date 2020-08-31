<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 #orderCheckMain{
 	width : 1000px;
 	margin: 0 auto;
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
 
 div.formGroup div.formGroupInputRaddr, div.formGroupInputDaddr, div.formGroupInputPhone, div.formGroupTextArea{
 	float : right;
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

</style>


</head>


<script>
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
<body>
	<div id="orderCheckMain">
	<form>
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
							<input type="text" name="roadAddress" class="formRAddress" style="width:320px;" readOnly>
						</div>
					<div class="clearBoth"></div>
				</div>		
				<div class="formGroup">		
						<div class="formGroupInputDaddr" >
							<input type="text" name="detailAddress" class="fromDAddress" style="width:320px;" placeholder="(필수) 상세 주소 입력">
						</div>
				</div>
				<div class="clearBoth"></div>
				<div class="formGroupPhone">
					<label calss="panelLabel" style="width:100px; margin-right:10px; font-size:14px">연 락 처</label>
						<div class="formGroupInputPhone" >
							<input type="number" name="phone" class="formPhone" style="width:320px;" placeholder="숫자만 입력하세요 ex)01012345678">
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
				<div class="storeName">가게명</div>
				<div class="orderRow">
					<div class="orderMenu">
						<span class="menus">음식</span>
						x
						<sapn class="quantity">3</sapn>
					</div>	
					<div class="orderPrice">
						<span class="prcie">1500 &nbsp;원</span>
					</div>
				</div>
				<div class="carTotal">
					<div class="orderDiscount">
						<div class="discountName">할인 금액</div>
						<div class="discountPrice">1000 &nbsp;원</div> 	
					</div>
					<div class="clearBoth"></div>
					<div class="orderTotal">
						<div class="totalName">총 결제 금액</div>
						<div class="totalPrice">1000 &nbsp;원</div>
					</div>
					<div class="clearBoth"></div>	
				</div>
			</div>
		</div>		
		<div class="AggreedText">
			<span>이용약관, 개이정보 수집 및 이용, 개인정보 제 3자 제공, 전자금융거래 이용약관, 만 14세 이상 이용자 내용을 확인하였으며 결제에 동의합니다.</span>
		</div>
		<button id="pbtn" onclick="payment();">결 제 하 기</button>
	</div>	
	</form>
	</div>
</body>
</html> 