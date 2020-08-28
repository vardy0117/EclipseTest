<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		width: 996px;
	}
	#content{
		font-size: 1em;
		font-family: none;
		margin-left: 40px;
	}

	#star{
		color: #ffa400;
		margin-left: 40px;
	}
	#avgStar{
		color: #ffa400;
		font-size: 2em;
		text-align: center;
	}
	#avgScore{
		text-align: center;
		font-size: 3em;
		clear: both;
	}
	.nickname{
		font-size: 20px;
		margin-left: 40px;
	}
	.date{
		color: gray;
		font-size: 14px;
	}

</style>

	<!-- 주문한 메뉴 review.jsp로 가져오기는 일단 보류 - 이태우 - --> 	
	
	
<!-- ---------------------------------	평균 별점  --------------------------------------------->
	<c:set var="info" value="${requestScope.storeInfo}"/>
	<c:set var="star" value="${requestScope.storereview}"/> <br>
			<div id="avgScore">${star.points}</div> 
			<c:if test="${star.points eq 0 }">
				<div id="avgStar">☆☆☆☆☆</div>
			</c:if>
			<c:if test="${star.points eq 1 }">
				<div id="avgStar">★☆☆☆☆</div>
			</c:if>
			<c:if test="${star.points eq 2 }">
				<div id="avgStar">★★☆☆☆</div>
			</c:if>
			<c:if test="${star.points eq 3 }">
				<div id="avgStar">★★★☆☆</div>
			</c:if>
			<c:if test="${star.points eq 4 }">
				<div id="avgStar">★★★★☆</div>
			</c:if>
			<c:if test="${star.points eq 5 }">
				<div id="avgStar">★★★★★</div>
			</c:if>
			<c:if test="${ star.points eq null}">
				<div id="avgScore">0</div>
				<div id="avgStar">☆☆☆☆☆</div>
			</c:if>
<!-- ---------------------------------	평균 별점  --------------------------------------------->

	<!-- 등록된 리뷰가 없을때 -->
	<c:if test="${requestScope.reviewList eq '[]' }">
		<div>
			<table id="reviewT" align="center">
				<tr rowspan="3">
					<td>주문후 첫번째 리뷰를 남겨보세요.</td>
				</tr>			
			</table>
		</div>
	</c:if>
	
	
	<!-- 등록된 리뷰가 존재할때 -->
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
							<fmt:formatDate value="${rBean.date}" dateStyle="long" var="date"/>
							${fn:substring(date,0,12) }
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
						<center><img src="./images/${rBean.image }" style="width: 900px; height: 400px;"></center> 
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
