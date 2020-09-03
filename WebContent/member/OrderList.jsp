<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 주문내역</title>
</head>
<style>

	div {
		box-sizing: border-box;
	}
	
		#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 30px;
	}
	#mainDiv li{
		list-style: none;
		float: left;
		border: 1px solid blue;
		margin-right: 50px;
	}
	
	#storeBox {
		float: left;
		width: 49%;
		border: 1px solid #d9d9d9;
		border-radius: 12px;
		/* cursor: pointer; */
		margin-right: 10px;
		margin-bottom: 10px;
	}
	
	#storeBox td {
		padding-left: 15px;
	}
	
	
		.display-none {
		display: none;
	}
	
	#more{
		    text-align: center;
		    padding: 20px;
		    clear:both;
	}
	a{
	cursor: pointer;
	}
	
	
</style>


<body>

	<div id="mainDiv">
		<c:set var="length" value="${fn:length(orderlist) }" />
		<%-- <font color="black" size="5"> 고객번호 : ${customerNo} <br> --%>
		<font color="black" size="5"> ${nickname}님의 주문내역 입니다
		
		</font> <br> <br>
		






	<c:forEach var="orderlist" items="${orderlist}"
			varStatus="status">

			<div id="storeBox">
			
				<table>
					<tr>
						<td>
					
				<a href="
				
				<c:url value="OrderRealDetail.do" >         
  				<c:param name="orderNo" value="${orderlist.orderNo }"> </c:param>
	  			</c:url>	">				   주문번호 : ${orderlist.orderNo} <br>
								  		  주문했던 가게이름 : ${orderlist.name} <br>
								        	가게이름 : ${orderlist.name} <br></a>
					
						
						
						</td>
					
					</tr>
				</table>
			
			</div>	
			
</c:forEach>
	

		
			
		
		<c:if test="${length eq 0 }">
			<font color="black" size="10"> 당신의 주문이 존재하지 않습니다 ^^ <br>주문하러 가시겠어요? <br><br>
			<a href="./SearchStore.do">클릭</a>
			</font>
		</c:if>
	</div>
	
	<div id="more"></div>
	
<!-- <div id="buttonDiv" style="clear:both; text-align: center; padding: 20px;"><button onclick="getStoreList(\'한식\', ' + koreanStartNo + ');">더 보기</button></div> -->

</body>
</html>