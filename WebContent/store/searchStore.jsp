<%@page import="net.store.db.StoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		/* border: 2px solid green;  줄그리는건데 삭제 */
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	.storeDetail:HOVER{
		background-color: silver;
	}
	
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding: 50px;
	}
	#storeListDiv {
		margin: 0 auto;
		width: 1000px;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding-bottom: 50px;
	}
	#storeListDiv table {
		margin: 10px auto;
		width: 500px;
		border-bottom: 2px gray solid;
	}
	#storeListDiv img {
		border-radius: 15px;
		width: 100px;
	}
	#storeListDiv a {
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	#storeListDiv a:hover {
		text-decoration: underline;
		color: gray;
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
	
</style>
</head>
<script>
	function setStoreInStorage(storeNo){
		var store = {
			storeNo : storeNo	
		};
			
		var json = JSON.stringify(store);
		
		sessionStorage.setItem("store",json);	
		
		location.href = "Store.do?storeNo="+storeNo;
	}


	function addStoreNoToStorage(storeNo){
		var cartItem=JSON.parse(sessionStorage.getItem("cart"));
		if(cartItem==null){
		setStoreInStorage(storeNo);
		} else { // 카트가 이미 저장된 메뉴가 있으면 (이미 storeNo는 저장된 상태 )
			var store = JSON.parse(sessionStorage.getItem("store"));
			if (storeNo == store["storeNo"]) {
				location.href="Store.do?storeNo="+storeNo;	
			} else {	
				if(confirm("카트를 비우고 다른 가게를 가시겠어요?") == true){
					var cart = null;
					sessionStorage.setItem("cart",cart);
					setStoreInStorage(storeNo);
					location.href="Store.do?storeNo="+storeNo;
				} 
			} 
		}
	}
</script>	
<body>

	<div id="mainDiv">
		<div id="storeListDiv">

<!-- 		<h1>storeList.jsp</h1> -->
<!-- 		<br> -->
<%-- 		<h3>sessionScope.orderRoadAddress : ${sessionScope.orderRoadAddress } (session에 저장해두고 주문시 사용하고 해당세션 비워줌)</h3> --%>
<%-- 		<h3>sessionScope.orderDetailAddress : ${sessionScope.orderDetailAddress } (session에 저장해두고 주문시 사용하고 해당세션 비워줌)</h3> --%>
<%-- 		<h3>sessionScope.orderBname : ${sessionScope.orderBname } (store 리스트를 검색할때 deliveryArea컬럼 문자열에 해당 bname이 포함되어 있어야함.)</h3> --%>
<%-- 		<h3>sessionScope.orderSido : ${sessionScope.orderSido }</h3> --%>
<!-- 		<h1>위의 데이터로 리스트 보여주기</h1> -->
		
<!-- 		<a href="./Store.do?storeNo=100"> 경로=./Store.do?storeNo=100 -> 100번가게로 이동</a> -->

<!-- 		<br> -->
		
<%-- 		<c:set var="good" value="${customerNo}" /> <!-- 로그인 세션중 customerNo가져옴 --> --%>
		커스터머 번호 : ${customerNo } <br>
		

	
		
		<c:if test="${customerNo ne null }">
<!-- 	<p>----------------------------------------------------------------------------------------</p> -->
	귀하의 현재 계정기준 요청주소는 :  <font color="blue" size="5">	
	<c:out value="${orderSido}" />
	 </font> 입니다 <br>
	
<!-- 	 <p>----------------------------------------------------------------------------------------</p> -->
	
		<c:forEach var="bean" items="${storelist}">
			<a onclick="addStoreNoToStorage('${bean.storeNo}')">	
				<div class="storeDetail">
<!-- 					<font size="10">---가져온 스토어 데이터---</font> <br> -->
					
					<font color="purple" size="5">가게 이름 :		<c:out value=" ${bean.name}" /> </font> <br>
					<c:out value="스토어 번호 : ${bean.storeNo}" /><br>
		   			<font color="red" size="5">시도 :		<c:out value=" ${bean.sido}" /> </font> <br>
		   			 <font color="orange" size="5">		<c:out value="도로명 주소 : ${bean.roadAddress}" /> </font> <br>
					 <font color="green" size="5">		<c:out value="운영시간 : ${bean.storeHours}" /> </font> <br>
					
					<c:out value="<업체 소개 사진> "/> <br>
					 <img src="upload/store/${bean.image}" alt="스토어 음식사진" width="200" height="200"> <br>
		<%-- 			${pageContext.request.contextPath} --%>
					<c:out value="사진주소 : upload/store/${bean.image}"/><br>
					<c:out value="카테고리 : ${bean.category}" /><br>
					<c:out value="사장님 한마디 : ${bean.message}" /><br>
				</div>
			</a>
		</c:forEach>

				<c:set var="area" value="${storelist}" /> 
				<c:if test="${area eq '[]' }">
					<font size="6" color="orange"> <p>귀하의 지역에 맞는 가게가 없습니다</p> </font>
				</c:if>
		
</c:if> <!-- 로그인 확인여부 if문 -->
	</div>
	
	</div>
		
		
</body>
</html>