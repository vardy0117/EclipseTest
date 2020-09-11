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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
/* setInterval(function(){
	  $("#ordercheck").toggle();
	}, 250); */


</script>

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
	
	#storeBox {
		float: left;
		width: 31.33%;
		/* cursor: pointer; */
		margin-right: 10px;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	#storeBox table {
		border: 1px solid #d9d9d9;
		width: 100%;
	}
	#storeBox th {
		padding-left: 5px;
		padding-right: 5px;
		background: #19ce60;
		width: 30%;
		color: white;
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
		text-decoration: none;
		color: black;
	}
	a:hover {
		text-decoration: underline;
		color: gray;
	}
	
	
</style>


<body>

	<div id="mainDiv">
		<c:set var="length" value="${fn:length(orderlist) }" />
		<%-- <font color="black" size="5"> 고객번호 : ${customerNo} <br> --%>
		<h2 style="text-align: center; border-bottom: 1px solid #d9d9d9;padding-bottom: 20px;">${nickname}님의 주문내역 입니다</h2>
		
		<br> <br>
		

	<c:forEach var="orderlist" items="${orderlist}"
			varStatus="status">
			<div id="storeBox">
				<a href="
				<c:url value="OrderRealDetail.do" >         
	 				<c:param name="orderNo" value="${orderlist.orderNo }"> </c:param>
	  			</c:url>">	
					<table>
						<tr>
							<th>주문번호</th>
							<td>${orderlist.orderNo }</td>
						</tr>
						<tr>
							<th>가게명</th>
							<td>${orderlist.name }</td>
						</tr>
						<tr>
							<th>주문상태</th>
							<td>
								<c:choose>
								<c:when test="${orderlist.orderCheck eq 'F'}">
										<span style="color:green;">주문 접수 중!</span>
								</c:when>	
								<c:when test="${orderlist.orderCheck eq 'N'}">
										<span style="color:red;">주문 취소!</span>
								</c:when>
								<c:when test="${orderlist.orderCheck eq 'T' && orderlist.deliveryCheck eq 'T'}">
										<span style="color:orange;">배달 완료!</span>
								</c:when>
								<c:when test="${orderlist.orderCheck eq 'T' && orderlist.deliveryCheck eq 'A'}">
										<span style="color:orange;">배달 완료!</span>
								</c:when>	
								<c:when test="${orderlist.orderCheck eq 'T' && orderlist.deliveryCheck eq 'F'}">
										<span style="color:blue;">음식 준비 중!</span>
								</c:when>
								<c:when test="${orderlist.orderCheck eq 'T' && orderlist.deliveryCheck eq 'D'}">
										<span style="color:blue;">배달 중!</span>
								</c:when>
								
								</c:choose>	
							</td>
						</tr>
					</table>
				</a>
			</div>	
	</c:forEach>
	

		
			
		
		<c:if test="${length eq 0 }">
			<font color="black" size="10"> 고객님의 주문이 존재하지 않습니다 ^^ <br>주문하러 가시겠어요? <br><br>
<!-- 			 <a href="./SearchStore.do">클릭</a> -->
			</font>
		</c:if>
	</div>
	
	<div id="more"></div>
	
<!-- <div id="buttonDiv" style="clear:both; text-align: center; padding: 20px;"><button onclick="getStoreList(\'한식\', ' + koreanStartNo + ');">더 보기</button></div> -->

</body>
</html>