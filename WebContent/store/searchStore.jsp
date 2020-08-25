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
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
</style>
</head>
<body>
	<div id="mainDiv">
		<h1>storeList.jsp</h1>
		<br>
		<h3>sessionScope.orderRoadAddress : ${sessionScope.orderRoadAddress } (session에 저장해두고 주문시 사용하고 해당세션 비워줌)</h3>
		<h3>sessionScope.orderDetailAddress : ${sessionScope.orderDetailAddress } (session에 저장해두고 주문시 사용하고 해당세션 비워줌)</h3>
		<h3>sessionScope.orderBname : ${sessionScope.orderBname } (store 리스트를 검색할때 deliveryArea컬럼 문자열에 해당 bname이 포함되어 있어야함.)</h3>
		<h3>sessionScope.orderSido : ${sessionScope.orderSido }</h3>
		<h1>위의 데이터로 리스트 보여주기</h1>
		
		<a href="./Store.do?storeNo=100"> 경로=./Store.do?storeNo=100 -> 100번가게로 이동</a>

		<br>
	<p>----------------------------------------------------------------------------------------</p>
	귀하의 현재 계정기준 요청주소는 :  <font color="blue" size="5">	
	<c:out value="${orderSido}" />
	 </font> 입니다 <br>

	 <p>----------------------------------------------------------------------------------------</p>
	
			
		<c:forEach var="bean" items="${storelist}">

				
			
			<font size="10">---가져온 스토어 데이터---</font> <br>
			
			<font color="purple" size="5">가게 이름 :		<c:out value=" ${bean.name}" /> </font> <br>
			<c:out value="스토어 번호 : ${bean.storeNo}" /><br>
   			<font color="red" size="5">시도 :		<c:out value=" ${bean.sido}" /> </font> <br>
   			 <font color="orange" size="5">		<c:out value="도로명 주소 : ${bean.roadAddress}" /> </font> <br>
			 <font color="green" size="5">		<c:out value="운영시간 : ${bean.storeHours}" /> </font> <br>
			<c:out value="사진 : ${bean.image}" /><br>
			<c:out value="카테고리 : ${bean.category}" /><br>
			<c:out value="사장님 한마디 : ${bean.message}" /><br>
			
				
				
		</c:forEach>


				<c:set var="area" value="${storelist}" /> 
				<c:if test="${area eq '[]' }">
					<font size="6" color="orange"> <p>귀하의 지역에 맞는 가게가 없습니다</p> </font>
				</c:if>
		

	</div>
	
	
</body>
</html>