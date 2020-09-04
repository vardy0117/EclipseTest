<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
		margin: 0 auto;
		margin-top: 90px;
		position: relative;
	}
	#navDiv {
		width: 100%;
		height: 80px;
		border-radius: 12px;
    	border: 2px solid #0000009c;
	}
	#navDiv > div {
		width: 33.3333333%;
		height: 100%;
		float: left;
		text-align: center;
		font-size: 1.5rem;
		line-height: 80px;
		cursor: pointer;
		background-color: #80808021;
		border-left: 1px solid #0000009c;
		border-right: 1px solid #0000009c;
	}
	.btn-on {
		background-color: #80808054;
	}
	#navDiv > div:hover {
		background-color: #80808054;
	}
	.contentDiv {
		width:100%;
		display: none;
		padding: 50px;
	}
	.contentDiv table {
		margin: 10px auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding: 20px;
	}
	.contentDiv table img {
		border-radius: 12px;
	}
	.display-on {
		display: block;
	}
	#updateBtn {
		background: url("images/setting_black.svg") no-repeat;
		background-size: 32px;
		width: 35px;
		height: 35px;
		cursor: pointer;
		border: none;
	}
	#updateBtn:hover {
		background: url("images/setting_gray.svg") no-repeat;
		background-size: 32px;
	}
	#deleteBtn {
		background: url("images/delete_black.svg") no-repeat;
		background-size: 32px;
		width: 35px;
		height: 35px;
		cursor: pointer;
		border: none;
	}
	#deleteBtn:hover {
		background: url("images/delete_gray.svg") no-repeat;
		background-size: 32px;
	}
	#addBtn {
		background: url("images/addBtn.svg") no-repeat;
		background-size: 32px;
		width: 35px;
		height: 35px;
		cursor: pointer;
		border: none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	window.onload = function(){
		realTimeOrder();
	}

	function showDiv(id, element) {
		document.getElementById('menuDiv').classList.remove('display-on');
		document.getElementById('reviewDiv').classList.remove('display-on');
		document.getElementById('orderDiv').classList.remove('display-on');
		document.getElementById(id).classList.add('display-on');
	}
	
	function realTimeOrder(){
		setInterval(function (){
			var storeNo = "${param.storeNo}";
			$.ajax({
		         async : false,
		         url : "UncheckedOrder.do?storeNo="+storeNo,
		         success : function(count) {
		     		  if(count != 0){
		     			  $(".uncheckedOrders").html('<img src="./images/ICON/icons8-meal-50 (3).png">');
		     			 
		     			
		     		  } else{
		     			 $(".uncheckedOrders").empty();			  
		     		  }
		         }
		   	});
		}	
		, 5000);	
	}
	
</script>
</head>
<body>
	<div id="mainDiv">
		<div id="navDiv">
			<div onclick="showDiv('menuDiv',this);">메뉴관리</div>
			<div onclick="showDiv('reviewDiv',this);">리뷰관리</div>
			<div onclick="showDiv('orderDiv',this);">주문내역<span class="uncheckedOrders" style="vertical-align: middle;"></span></div>
		</div>
		
		<div class="contentDiv display-on" id="menuDiv">
		
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '세트 메뉴'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="location.href='updateMenu.do?menuNo=${menu.menuNo}'"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '주 메뉴'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="openChild(${menu.menuNo})"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '사이드 메뉴'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="location.href='updateMenu.do?menuNo=${menu.menuNo}'"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '음료/주류'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="location.href='updateMenu.do?menuNo=${menu.menuNo}'"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			<div style="text-align: center;">
				<input id="addBtn" type="button" onclick="location.href='addMenu.do?storeNo=${param.storeNo}';">
			</div>
		</div>
		
		
		
		
		<div class="contentDiv" id="reviewDiv">
			reviewDiv
		</div>
		
		<div class="contentDiv" id="orderDiv">
			orderDiv
		</div>
	</div>
	
	
	
</body>
<script>
	function deleteMenu(menuNo, storeNo) {
		if(confirm(" 메뉴를 삭제 하시겠습니까? ")==true){
			  location.href='deleteMenu.do?menuNo='+menuNo+'&storeNo='+storeNo;
		}
	}
	
	var openWin;
	
	function openChild(menuNo){
		location.href = 'updateMenu.do?menuNo='+menuNo;
	}
	
	
	
	
</script>
</html>