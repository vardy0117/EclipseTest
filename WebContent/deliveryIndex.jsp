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
</script>
</head>
<body>	
	<jsp:include page="/inc/deliveryTop.jsp"/>
	<div id=mainDiv>
	<h1>야야양야</h1>
	</div>
</body>
</html>