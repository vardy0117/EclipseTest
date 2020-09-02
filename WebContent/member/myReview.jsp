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
	#mainDiv{
		margin-top: 80px;
		width:1000px;
		min-height:600px;
	}
	#reviewT{
		border: 1px solid gray;
		padding: 0;
		margin: 0 auto;
		width: 100%;
	}
	
	#appendT{
		border: 1px solid gray;
		padding: 0;
		margin: 0 auto;
		width: 100%;
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
	.nickname i{
		color: #DBA901;
	}
	.date{
		color: gray;
		font-size: 14px;
	}
	.moreTab{
		height: 100px;
		text-align: center;
	}
	.moreTab:HOVER {
		background-color: #4d4d4d;	
	}
	
</style>
<div id="mainDiv">
	<!-- 리뷰 작성 가능한 곳 ( 아직 리뷰를 적지 않은 가게 ) -->
	
	<!-- 내가 작성한 리뷰 -->
	
	<!-- 아직 리뷰를 작성하지 않았을 경우 -->
	<c:if test="${requestScope.reviewList eq '[]'}">
		<h1>작성한 리뷰가 없습니다.</h1>
	</c:if>
	

	<!-- 작성한 리뷰가 존재하는 경우 -->
	<h1>내가 작성한 리뷰</h1>
	<c:if test="${requestScope.reviewList ne '[]'}">
	
	<div id="table">	
		<c:forEach items="${requestScope.reviewList }" var="rBean" varStatus="status">
			<table id="reviewT" align="center">
				<c:set var="i" value="${status.index }"/>
					<tr>
						<td>
							<span class="nickname"><i>${requestScope.storeName[i]}</i>에게 작성한 리뷰</span>
							
							<c:set var="date" value="${rBean.date}"/>
							<span class="date">${fn:substring(date,0,11) }</span>
						</td>
					</tr>
					<tr><td>
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
					</td></tr>
					<tr>
						<c:if test="${rBean.image eq null}">
							<td>
							</td>
						</c:if>
						<c:if test="${rBean.image ne null}">
							<td>
								<center><img src="./images/${rBean.image }" style="width: 100%; height: 300px;"></center> 
							</td>
						</c:if>
					</tr>
					<tr>
						<td>
							<span id="content">${rBean.contents }</span>
						</td>
					</tr>	
				</table>		
			</c:forEach> 
	</div>		
			
	
	</c:if>
	
</div>
</body>
</html>