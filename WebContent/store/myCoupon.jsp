<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

 div#popupMain{
 	margin : 0 auto;
 }

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function discountAjax(){
	var dcoupon=0;
/* 	var url = "store/myCoupon.jsp"
	var title ="myCoupon"
	var status ="toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20";
		window.open(url, title, status); */
		
	var tag = "";
	$.ajax({
		url : "DiscountCheck.do",
		type: "post",
		success : function(data, textStatus){
			
			var coupon = JSON.parse(data).couponList;
			for(var i=0 in coupon){
				tag += "<tr>"+
						"<td>"+coupon[i].name+"</td>"+
						"<td>"+coupon[i].expDate+"</td>"+
						"<td><input type='checkbox' name='coupon' value="+coupon[i].name+"></td>"+
						"</tr>";
			}
			
			$("#myCouponList").append(tag);
			
		},		
		error:function(couponList,textStatus){
			console.log(data);
			alert("쿠폰 불러오기 에러가 발생했슈");
		}
	}); // $ajax(	
} 	
	discountAjax();
</script>
</head>
<body>
	<div class="popupMain">
		<div class="panelGroup-Default-Head">	
			<div class="panelHeading">
				<span class="panelTitle">주문내역</span>
			</div>
		</div>
		<div class="panelGroup-Default-Body">	
			<table id=myCouponList border="1">
				<tr><td>이름</td><td>사용기한</td><td>적용여부</td></tr>
			</table>
		</div>
	</div>			
</body>
</html>