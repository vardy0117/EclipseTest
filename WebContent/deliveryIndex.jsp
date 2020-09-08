<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">

	var orderNo= ${param.orderNo};
	$.ajax({
		type : "get",
		async : false,
		url : "./getdelivery.do?orderNo="+orderNo,
		success : function(data,textStatus){
			console.log(type)
		
				
				console.log("jjjjjjjj");
			
						console.log(data);
		//console.log("랄라라"+JSON.parse(data)["orderNo"]);
			//console.log(JSON.parse(data)["orderNo"]);
			var obj = data;
			console.log(obj["orderNo"]);
		},error:function(data,textStatus){
			alert("Ajax 통신 Error : "+textStatus);
		}
		
	});//ajax 끝
	




</script>
</head>
<body>
<!-- 큐알 코드 찍은 페이지  -->\delivengersNo, storeNo, orderNo, roadAddress, detailAddress, customerPhone, departureTime, arrivalTime, deliveryCheck, storeNo, orderNo, roadAddress, detailAddress, customerPhone, departureTime, arrivalTime, deliveryCheck
	<table>

			<tr>
				<td>주문번호 </td>
				<td>${orderList.orderNo}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${orderList.roadAddress} ${orderList.detailAddress }</td>
			</tr>
			<tr>
				<td>연락처 </td>
				<td>${orderList.phone}</td>
			</tr>
			<tr>
				<td>요청사항 </td>
				<td>${orderList.request}</td>
			</tr>
		</table>
		
		

</body>
</html>