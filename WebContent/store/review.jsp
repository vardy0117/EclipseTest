<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	#reviewT{
		border: 1px solid gray;
		padding: 0;
		margin: 0 auto;
		width: 700px auto;
	}
	#content{
		font-size: 1em;
		font-family: none;
	}

	#star{
		color: #ffa400;
	}
	.nickname{
		font-size: 1.3;em;
	}
	.date{
		color: gray;
	}

</style>

	<!-- 주문한 메뉴 review.jsp로 가져오기는 일단 보류 - 이태우 - --> 	
	<h1>review.jsp 태우</h1>
	
	<c:forEach items="${requestScope.reviewList}" var="rBean" varStatus="status">
		<c:set var="i" value="${status.index }"/>
		
		<div>
			<table id="reviewT" align="center">
				<tr>
					<td>
						<span class="nickname">${nickNameList[i]}님</span>
						&nbsp;
						<span class="date">
							<c:set var="date" value="${rBean.date}"/>
							${fn:substring(date,0,10) }
						</span>
						<br>
						<c:if test="${rBean.points eq 0 }">
							<i id="star">☆☆☆☆☆</i>
						</c:if>
						<c:if test="${rBean.points eq 1 }">
							<i id="star">★☆☆☆☆</i>
						</c:if>
						<c:if test="${rBean.points eq 2 }">
							<i id="star">★★☆☆☆</i>
						</c:if>
						<c:if test="${rBean.points eq 3 }">
							<i id="star">★★★☆☆</i>
						</c:if>
						<c:if test="${rBean.points eq 4 }">
							<i id="star">★★★★☆</i>
						</c:if>
						<c:if test="${rBean.points eq 5 }">
							<i id="star">★★★★★</i>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<img src="./images/${rBean.image }"> 
					</td>
				</tr>
				<tr>
					<td>
						<span id="content">${rBean.contents }</span>
					</td>
				</tr>			
			</table>
		</div>




	</c:forEach>



</body>
</html>