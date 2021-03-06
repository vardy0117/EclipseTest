<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<style>
	#topDiv{
		width:100%;
		height: 80px;
		color: white;
		margin: 0 auto;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 1000;
		background: #ff8a19;
	}
	
	#topDiv #logo {
		margin: 10px 10px;
	}
	#topDiv a {
		text-decoration: none;
		color: white;
	}
	
	#loginAndJoin {
		position: absolute;
		right: 10px;
		top: 10px;
		text-align: right;
	}
	#loginAndJoin a {
		text-decoration: none;
		color: white;
	}
	#loginAndJoin a:hover {
		text-decoration: underline;
		color: white;
	}
	
	
	
 /*************************************************/   
@media (max-width: 768px)  {
	
	h2#logo {
		font-size: 1.2rem;
		width: 140px;
	}
    
   
   #loginAndJoin {
		position: absolute;
		right: 10px;
		top: 10px;

	}
	#loginAndJoin a {
		text-decoration: none;
		color: white;
      margin: auto 0;   
    
	}
	#loginAndJoin a:hover {
		text-decoration: underline;
		color: white;
	}
            
    
}
/************************************************ */


</style>
<script>
	window.onload = function(){
		
	}

</script>

</head>
<body>
	<div id="topDiv">
		<h2 id="logo"><a href="deliveryIndex.jsp">Delivengers 배달원</a></h2>
		<c:choose>
			<c:when test="${!empty sessionScope.delivengersNo}">
				<div id="loginAndJoin">
					${sessionScope.delivengersNo} 배달원님 어서 오세요! <br>
					<a href="./DelivengersLogOut.do">로그아웃</a>	
				</div>
			</c:when>
		</c:choose>	
	
	</div>
	
	
	
	
</body>
</html>