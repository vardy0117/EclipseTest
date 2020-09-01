<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/storeJSP.css">.
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<c:set var="info" value="${requestScope.storeInfo}"/>
	<c:set var="star" value="${requestScope.storereview}"/>

	<div id="mainDiv">
		<div id="storeDiv">
		
			<div id="storeNameDiv">
				<h3>${info.name }</h3>
			</div>
			
			<div id="storeBasicInfoDiv">
				<table>
					<tr>
						<td rowspan="2">
							<img src="upload/store/${info.image}">
						</td>
						<td style="padding-left: 15px;">
							<c:if test="${star.points eq 0 }">
								<span style="color: #ffa400"></span><span style="color: #e0e0e0">★★★★★</span>
							</c:if>
							<c:if test="${star.points eq 1 }">
								<span style="color: #ffa400">★</span><span style="color: #e0e0e0">★★★★</span>
							</c:if>
							<c:if test="${star.points eq 2 }">
								<span style="color: #ffa400">★★</span><span style="color: #e0e0e0">★★★</span>
							</c:if>
							<c:if test="${star.points eq 3 }">
								<span style="color: #ffa400">★★★</span><span style="color: #e0e0e0">★★</span>
							</c:if>
							<c:if test="${star.points eq 4 }">
								<span style="color: #ffa400">★★★★</span><span style="color: #e0e0e0">★</span>
							</c:if>
							<c:if test="${star.points eq 5 }">
								<span style="color: #ffa400">★★★★★</span><span style="color: #e0e0e0"></span>
							</c:if>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 15px;">영업시간 : ${info.storeHours}</td>
					</tr>
				</table>
			</div>
			
			<div id="topMenu">
				<div class="menuLink clicked" id="menuLink">메뉴</div>
				<div class="reviewLink" id="reviewLink">리뷰</div>
				<div class="infoLink" id="infoLink">정보</div>
			</div>
			<div style="clear:both;"></div>
			
			<div id="menuDiv" class="display-on">
				<jsp:include page="/store/menu.jsp"></jsp:include>
			</div>
			<div id="reviewDiv" class="display-off">
				<jsp:include page="/store/review.jsp"></jsp:include>
			</div>
			<div id="infoDiv" class="display-off">
				<jsp:include page="/store/info.jsp"></jsp:include>
			</div>

		</div>
		
		<div id="cartDiv">
			<div class="cartGroup">
				<div class="cart-Head">	
					<div class="cart-Head-left">
						<span class="panelTitle"><h3>주 문 표</h3></span>
					</div>
					<div class="cart-Head-right">
						<button type="button" id="clearCartBtn" onclick="clearCart()"><img src="./images/ICON/trash_bin_remove_delete_icon_133483.ico" width="30" height="30"></button>
					</div>
				</div>	
				<div class="clearBoth"></div>	
				<div class="cart-Body">
					<div class="emptyCart">
						<span class="emptyCartSpan">주문표에 담긴 메뉴가 없습니다.</span>
					</div>
					<ul class="cartUl">
					</ul>
				</div>			
				<div class="clearBoth"></div>
				<div class="cartTotal">
					<span class="cartTotalSpan"></span>
				</div>
					<div class="clearBoth"></div>
			</div>				
			<button id="obtn" onclick="location.href='OrderCheck.do';">주 문 하 기</button>
		</div>
		
		


		
		<%-- <div class="storeName">
			<h2>${info.name}</h2>
		</div>
		<div class="storeInfo">
			<span class="storeImg"><img src="upload/store/${info.image}" style="width: 200px; margin: 30px 30px;"></span>
			<div class="avg">
				<c:set value="${requestScope.storeNo }" var="storeNo"/>
				
				<c:set var="info" value="${requestScope.storeInfo}"/>
				<c:set var="star" value="${requestScope.storereview}"/> <br>
				<div id="storeAvgScore">${star.points}</div> 
				<c:if test="${star.points eq 0 }">
					<div id="storeAvgStar">☆☆☆☆☆</div>
				</c:if>
				<c:if test="${star.points eq 1 }">
					<div id="storeAvgStar">★☆☆☆☆</div>
				</c:if>
				<c:if test="${star.points eq 2 }">
					<div id="storeAvgStar">★★☆☆☆</div>
				</c:if>
				<c:if test="${star.points eq 3 }">
					<div id="storeAvgStar">★★★☆☆</div>
				</c:if>
				<c:if test="${star.points eq 4 }">
					<div id="storeAvgStar">★★★★☆</div>
				</c:if>
				<c:if test="${star.points eq 5 }">
					<div id="storeAvgStar">★★★★★</div>
				</c:if>
				<c:if test="${star.points eq null}">
					<!-- <div id="storeAvgScore">0</div> -->
					<div id="storeAvgStar">☆☆☆☆☆</div>
				</c:if>
				
				<div class="storeHours"><span class="guideText">영업시간 :</span> ${info.storeHours}</div>
				<div class="storeMessage"><span class="guideText">사장님 한마디 :</span> ${info.message}</div>
			</div>
		</div>
		
		<!-- 플로팅 배너 -->
		<div class="cart">  
			<h2>장바구니</h2>
				<div id = "cartDiv">
					<ul id="cartUl" class="cartUl">
					</ul>
				</div>
				<hr>
		    	<h1 id="total"></h1>
		    <input type="button" value="주문" onclick="location.href='OrderCheck.do';">
		</div>
		<c:set var="info" value="${requestScope.storeInfo}"/>
	
		<nav id="topMenu">
			<ul>
				<li class="menuLink" id="menuLink">메뉴</li>
				<li class="reviewLink" id="reviewLink">리뷰</li>
				<li class="infoLink" id="infoLink">정보</li>
			</ul>
		</nav> --%>
			
		<%-- <div id="menuDiv" class="display-on">
			<jsp:include page="/store/menu.jsp"></jsp:include>
		</div>
		<div id="reviewDiv" class="display-off">
			<jsp:include page="/store/review.jsp"></jsp:include>
		</div>
		<div id="infoDiv" class="display-off">
			<jsp:include page="/store/info.jsp"></jsp:include>
		</div> --%>
	
	</div>
	<div style="clear:both; margin-bottom: 15px;"></div>
</body>
<script>
	document.querySelector(".menuLink").addEventListener("click", function() {
		document.getElementById("menuDiv").setAttribute("class", "display-on");
		document.getElementById("reviewDiv").setAttribute("class", "display-off");
		document.getElementById("infoDiv").setAttribute("class", "display-off");
		
		document.getElementById("menuLink").setAttribute("class", "clicked");
		document.getElementById("reviewLink").setAttribute("class", "unclicked");
		document.getElementById("infoLink").setAttribute("class", "unclicked");
		
	});
	document.querySelector(".reviewLink").addEventListener("click", function() {
		document.getElementById("menuDiv").setAttribute("class", "display-off");
		document.getElementById("reviewDiv").setAttribute("class", "display-on");
		document.getElementById("infoDiv").setAttribute("class", "display-off");
		
		document.getElementById("reviewLink").setAttribute("class", "clicked");
		document.getElementById("infoLink").setAttribute("class", "unclicked");
		document.getElementById("menuLink").setAttribute("class", "unclicked");
	});
	document.querySelector(".infoLink").addEventListener("click", function() {
		document.getElementById("menuDiv").setAttribute("class", "display-off");
		document.getElementById("reviewDiv").setAttribute("class", "display-off");
		document.getElementById("infoDiv").setAttribute("class", "display-on");
		
		document.getElementById("infoLink").setAttribute("class", "clicked");
		document.getElementById("reviewLink").setAttribute("class", "unclicked");
		document.getElementById("menuLink").setAttribute("class", "unclicked");
	});
	
	document.addEventListener("scroll", function() {
		document.getElementById("cartDiv").style.top = (window.scrollY+15) + "px";
	});
	
	
</script>
</html>