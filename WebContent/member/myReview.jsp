<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<style>
	#mainDiv{
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 15px;
		padding-bottom: 15px;
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
	
	#unStar{
		color: #e0e0e0;
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
	
	#reviewStatus{
		background-color: #E6E6E6;
		padding-left: 20px;
	}
	
	.storeName{
		font-size: 30px;
	}
	#storeImg{
		width: 60px;
	}
	.orderDateTxt{
		border: 1px solid;
		font-size: 12px;
	}
	.orderDate{
		color: gray;
	}
	#btnReview{
		color: white;
		background-color: red;
		border: 1px solid red;
		font-size: 15px;
		font-weight: 800; 
		padding: 0.8em;
		
	}
	#unReviewPageNo{
		text-decoration: none;
		font-size: 30px;
		color: black;
		margin-right: 5px;
	}
	#unReviewPageNo:HOVER{
		text-decoration: underline;
	}
	#pagingDiv{
		text-align: center;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	#unReviewTable{
		float: left;
		width: 49%;
	}
	#orderMenu{
		margin-left: 40px;
		font-size: 12px;
		color: #d1bca4;
	}
	#orderMenuUnReview{
		font-size: 12px;
		color: #d1bca4;
	}
	#comment{
		background: #e2e2e2;
		min-height: 150px;
		border-radius: 20px;
		padding-left: 1em;
		padding-top: 1em;
	}
	#ceoNick{
		font-size: 20px;
	}
	#commentFont{
		font-size: 1em;
		font-family: none;
	}
</style>


<div id="mainDiv">
	<!-- 리뷰 작성 가능한 곳 ( 아직 리뷰를 적지 않은 가게 ) -->
	<div id="reviewStatus"><h1>작성 가능한 리뷰</h1></div>
	
	<c:forEach items="${requestScope.unReviewOrderList }" var="unReviewOrder" varStatus="status">
		<c:set var="i" value="${status.index }"/>
			<table id="unReviewTable">
				<tr>
					<td rowspan="3">
						<img src="./upload/store/${unReviewStoreNameList[i].image}" id="storeImg"> 
					</td>
					<td>
						<span class="storeName">${unReviewStoreNameList[i].name}</span>
					</td>
					<td>
						<button onclick="location.href='writeReview.do?storeNo=${unReviewStoreNameList[i].storeNo}&orderNo=${unReviewOrder.orderNo }'" id="btnReview" style="cursor: pointer;">리뷰쓰기</button>
					</td>
				</tr>
				<tr>
					<td>
						<span id="orderMenuUnReview">${requestScope.menusList[i]}</span>
					</td>
				</tr>
				<tr>
					<td> 
						<c:set var="date" value="${unReviewOrder.orderTime}"/>
						<span class="orderDateTxt">주문날짜</span>  <i class="orderDate">${fn:substring(date,0,11) }</i>
					</td>
				</tr>
			</table>
	</c:forEach>
	<div style="margin: 10px 0; clear: both; ">
	</div>
	
	
	<!-- 페이징 작업 -->
	<div id="pagingDiv">
	<c:forEach var="i" begin="1" end="${(requestScope.unReviewCount-1)/6+1}">
		<c:if test="${i == requestScope.unReviewPageNo }">
			<a href="" id="unReviewPageNo" style="color: #ffa400;">${i}</a>
		</c:if>
		<c:if test="${i != requestScope.unReviewPageNo }">
			<a href="MyReview.do?unReviewPageNo=${i}&writedPageNo=${requestScope.writedPageNo}" id="unReviewPageNo">${i}</a>
		</c:if>
	</c:forEach>
	</div>
	
	
	<!-- 내가 작성한 리뷰 -->
	<div id="reviewStatus"><h1>내가 작성한 리뷰</h1></div>
	
	<!-- 아직 리뷰를 작성하지 않았을 경우 -->
	<c:if test="${requestScope.reviewList eq '[]'}">
		<table>
			<tr>
				<td><h1>작성한 리뷰가 없습니다.</h1></td>
			</tr>
		</table>
	</c:if>
	

	<!-- 작성한 리뷰가 존재하는 경우 -->
	<c:if test="${requestScope.reviewList ne '[]'}">
	
	<div id="table">	
		<c:forEach items="${requestScope.reviewList }" var="rBean" varStatus="status">
			<table id="reviewT" align="center">
				<c:set var="i" value="${status.index }"/>
					<tr>
						<td>
							<span class="nickname"><i>${requestScope.storeName[i].name}</i>에게 작성한 리뷰</span>
							
							<c:set var="date" value="${rBean.date}"/>
							<span class="date">${fn:substring(date,0,11) }</span>
						</td>
					</tr>
					<tr>
						<td>
							<c:if test="${rBean.points eq 0 }">
								<i id="star"></i><i id="unStar">★★★★★</i>
							</c:if>
							<c:if test="${rBean.points eq 1 }">
								<i id="star">★</i><i id="unStar">★★★★</i>
							</c:if>
							<c:if test="${rBean.points eq 2 }">
								<i id="star">★★</i><i id="unStar">★★★</i>
							</c:if>
							<c:if test="${rBean.points eq 3 }">
								<i id="star">★★★</i><i id="unStar">★★</i>
							</c:if>
							<c:if test="${rBean.points eq 4 }">
								<i id="star">★★★★</i><i id="unStar">★</i>
							</c:if>
							<c:if test="${rBean.points eq 5 }">
								<i id="star">★★★★★</i>
							</c:if>
						</td>
					</tr>
					<tr>
						<c:if test="${rBean.image eq null}">
							<td>
							</td>
						</c:if>
						<c:if test="${rBean.image ne null}">
							<td>
									<center><img src="./upload/review/${rBean.image }" style="width: 100%; height: 300px;"></center> 
							</td>
						</c:if>
					</tr>
					<tr>
						<td>
							<span id="orderMenu">${requestScope.menusList2[i]}</span>
						</td>
					</tr>
					<tr>
						<td>
							<div id="content">${fn:replace(rBean.contents, newLineChar, "<br/>")}</div>
							<%-- <span id="content">${rBean.contents }</span> --%>
						</td>
					</tr>
					<c:if test="${rBean.comment ne null }">
						<tr>
							<td>
								<div id="comment"><i id="ceoNick">사장님</i> <br><i id="commentFont">${fn:replace(rBean.comment, newLineChar, "<br/>")}</i></div>
							</td>
						</tr>	
					</c:if>
				</table>		
			</c:forEach> 
		</div>
		
		<div id="pagingDiv">
			<c:forEach var="i" begin="1" end="${(requestScope.writedReviewCount-1)/6+1}">
				<c:if test="${i==requestScope.writedPageNo }">
					<a href="" id="unReviewPageNo" style="color: #ffa400;">${i}</a>
				</c:if>
				<c:if test="${i!=requestScope.writedPageNo }">
					<a href="MyReview.do?unReviewPageNo=${requestScope.unReviewPageNo}&writedPageNo=${i}" id="unReviewPageNo">${i}</a>
				</c:if>
			</c:forEach>
		</div>		
	</c:if>
	
</div>
</body>
</html>