<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	
	input[type=number]::-webkit-inner-spin-button {
     width: 30px;
     height: 30px;
     -webkit-appearance: none;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
 function modifyQty(id, qty){
	 	var q = parseInt($("#"+id).val());
         if(qty==1){
      		q ++;
      		$("#"+id).val(q);
         } else if(qty==-1 && parseInt($("#"+id).val()) !=0){
        	q --;
        	$("#"+id).val(q);
         }
 }
</script>
<body>
	<div id="mainDiv">
		<h1>store.jsp</h1>
		<br>
		<h2>storeNo : ${storeNo}</h2>
		<h2>현재는 우선 storeNo만 들고옴 컨트롤러에서 storeNo를 이용해 storeBean을 들고와야함!!</h2>
		<h2>그리고 storeNo로 menu / review도 들고와야함</h2>
		<h3>여기서 메뉴선택 및 수량지정 할 수 있는 로직을 구현 해야함.</h3>
		<c:set var="info" value="${requestScope.storeInfo}"/>
		스토어 넘버 : ${info.storeNo} <br>
		사장님 넘버 : ${info.ceoNo} <br>
		스토어 이름 : ${info.name} <br>
		도로명 : ${info.roadAddress} <br>
		상세주소 : ${info.detailAddress} <br>
		카테고리 : ${info.category} <br>
		폰 : ${info.phone} <br>
		가게이름 : ${info.storeHours} <br>
		사장님 한마디 : ${info.message} <br>
		가게 사진: ${info.image} <br>
		${info.points} <br>
		${info.orderCount} <br>
		${info.regNo} <br>
		
		<form action="#" method="post">
			<table border="1">
				<c:forEach var="menu" items="${requestScope.storeMenu}">
					<tr>
					<td>${menu.key}</td>
					<td>${menu.value}</td>
					<td><span>수량</span>
					<input type="number" id="${menu.key}" name="${menu.key}" class="qty" min="0" value="0" type="text">
					<a href="#" onclick="modifyQty('${menu.key}', 1)"><img src="images/btn_count_up.gif" alt="수량증가" class="qtyUp" usemap="#map_name_quantity"></a>	   
					<a href="#" onclick="modifyQty('${menu.key}', -1)"><img src="images/btn_count_down.gif" alt="수량감소" class="qtyDown" usemap="#map_name_quantity"></a>	 
				</c:forEach>
			</table>
		</form>
		
	</div>
</body>
</html>