<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<form>
<fieldset>
<div>배달 정보</div>
주소 : <input type="text" name="roadAddress" readOnly>
     <input type="text" name="detailAddress">
연락처 : <input type="text" name="phone">
<div>주문 시 요청 사항</div>
	<textarea placeholder="코로나 19예방을  위해 비대면 배달을 권장드립니다. 요기서 결제 선택 후, 문 앞 배달을 요청 사항에 남겨주세요'"></textarea >
<fieldset>
</form>

<주문내역>


</body>
</html>