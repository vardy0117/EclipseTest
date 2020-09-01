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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

<c:set value="${requestScope.storeNo}" var="storeNo"/>

<style>
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
	<c:if test="${requestScope.reviewList eq '[]'}">
		<div>
			<table id="reviewT" align="center">
				<tr rowspan="3">
					<td style="text-align: center;">아직 리뷰가 없습니다 <br>주문후 첫번째 리뷰를 남겨보세요.</td>
				</tr>			
			</table>
		</div>
	</c:if>
	
	<!-- 등록된 리뷰가 존재할때 -->
	<c:if test="${requestScope.reviewList ne '[]' }">
	
		<!-- ajax때문에 제대로 안나옴 ;;;;  -->	
		<%-- <c:set value="${requestScope.reviewList}" var="rvl"/>
			${fn:length(rvl)}개의 리뷰가 있습니다. --%>
			
			
		<c:forEach items="${requestScope.reviewList}" var="rBean" varStatus="status">
			<c:set var="i" value="${status.index }"/>
			<div id="table">
				<table id="reviewT" align="center">
					<tr>
						<td>
							<span class="nickname">${nickNameList[i]}님</span>
							&nbsp;
							<span class="date">
								<c:set var="date" value="${rBean.date}"/>
							<%-- 	<fmt:formatDate value="${rBean.date}" dateStyle="long" var="date"/> --%>
								${fn:substring(date,0,11) }
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
		<div id="appendDiv">
			<!-- 비동기방식으로 리뷰가 들어갈 자리 -->		
		</div>
		
		</div>
		<div class="moreTab" onclick="moreReview(${requestScope.storeNo})">
			<a class="more">더보기</a>
		</div>
	</c:if>	
	
	
	<!-- ////////////////////////////////더보기 클릭했을때 ////////////////////////////////////////// -->

	<script type="text/javascript">
	
		function moreReview(storeNo) {
 			var startNum = $("#table tr").length / 3;	// 현재 보여지는 게시글의 수
 			var storeNo = storeNo	// 가게고유번호
			
 			
			$.ajax({
				type : "post",
				async : false,
				url : "./moreReview.do",
				data : {"storeNo":storeNo,"startNum":startNum},
				dataType : "text",
				success : function(data,textStatus){
					var jsonData = JSON.parse(data);
					if(jsonData != null){
						
						var stars;
						for(var i = 0; i<jsonData.length; i++){
							
							// image가 null이 아닐때
							if(jsonData[i].image != null){
								if(jsonData[i].points==0){
									stars = "☆☆☆☆☆";
								}else if(jsonData[i].points==1){
									stars = "★☆☆☆☆"
								}else if(jsonData[i].points==2){
									stars = "★★☆☆☆"
								}else if(jsonData[i].points==3){
									stars = "★★★☆☆"
								}else if(jsonData[i].points==4){
									stars = "★★★★☆"
								}else if(jsonData[i].points==5){
									stars = "★★★★★"
								}
								$("#appendDiv").append("<table id='appendT'><tr><td><span class='nickname'>"+jsonData[i].nickname+"님 </span> &nbsp&nbsp"+
									 "<span class='date'>"+jsonData[i].date.substring(0,10)+"</span>"+
									 "<br><i id='star'>"+stars+"</i></td></tr>"+
									 "<tr><td><center><img src='./images/"+jsonData[i].image+"' style='width: 656px; height: 400px;' class='image'></center></td></tr>"+
									 "<tr><td><span id='content'>"+jsonData[i].contents+"</span></td></tr></table>");
			
							// image가 null일때
							}else{
								if(jsonData[i].points==0){
									stars = "☆☆☆☆☆";
								}else if(jsonData[i].points==1){
									stars = "★☆☆☆☆"
								}else if(jsonData[i].points==2){
									stars = "★★☆☆☆"
								}else if(jsonData[i].points==3){
									stars = "★★★☆☆"
								}else if(jsonData[i].points==4){
									stars = "★★★★☆"
								}else if(jsonData[i].points==5){
									stars = "★★★★★"
								}
								$("#appendDiv").append("<table id='appendT'><tr><td><span class='nickname'>"+jsonData[i].nickname+"</span> &nbsp&nbsp"+
									 "<span class='date'>"+jsonData[i].date.substring(0,10)+"</span>"+
									 "<br><i id='star'>"+stars+"</i></td></tr>"+
									 "<tr><td></td></tr>"+
									 "<tr><td><span id='content'>"+jsonData[i].contents+"</span></td></tr></table>");
								
							}
						}
						if(jsonData.length==0){
							alert("남은 리뷰가 없습니다.");
							$("div").remove(".moreTab");
						}
					}						
				}
				,error:function(data,textStatus){
					alert("moreReview에러발생 : "+textStatus)
				}
				
			});
		}
	</script>
</body>
</html>

