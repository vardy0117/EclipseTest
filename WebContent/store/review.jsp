<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% pageContext.setAttribute("crlf", "\n"); %>
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
	.reviewT{
		border-bottom: 1px solid #d9d9d9;
		padding: 0;
		margin: 0 auto;
		width: 100%;
		padding-bottom: 15px;
	}
	.appendT{
		border-bottom: 1px solid #d9d9d9;
		padding: 0;
		margin: 0 auto;
		width: 100%;
		padding-bottom: 15px;
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
	#comment{
		background: #e2e2e2;
		min-height: 150px;
		border-radius: 20px;
		padding-left: 1em;
		padding-top: 1em;
		width: 90%;
		margin: 5px auto;
	}
	#ceoNick{
		font-size: 20px;
	}
	#commentFont{
		font-size: 1em;
		font-family: none;
	}

	#orderMenu{
		margin-left: 40px;
		font-size: 12px;
		color: #d1bca4;
	}
</style>

	
	
<!-- ---------------------------------	평균 별점  --------------------------------------------->
	<c:set var="info" value="${requestScope.storeInfo}"/>
	<c:set var="star" value="${requestScope.storereview}"/> <br>
			<div id="avgScore">${star.points}</div> 
			<c:if test="${star.points eq 0 }">
				<div id="avgStar"><span style="color: #ffa400"></span><span style="color: #e0e0e0">★★★★★</span></div>
			</c:if>
			<c:if test="${star.points eq 1 }">
				<div id="avgStar"><span style="color: #ffa400">★</span><span style="color: #e0e0e0">★★★★</span></div>
			</c:if>
			<c:if test="${star.points eq 2 }">
				<div id="avgStar"><span style="color: #ffa400">★★</span><span style="color: #e0e0e0">★★★</span></div>
			</c:if>
			<c:if test="${star.points eq 3 }">
				<div id="avgStar"><span style="color: #ffa400">★★★</span><span style="color: #e0e0e0">★★</span></div>
			</c:if>
			<c:if test="${star.points eq 4 }">
				<div id="avgStar"><span style="color: #ffa400">★★★★</span><span style="color: #e0e0e0">★</span></div>
			</c:if>
			<c:if test="${star.points eq 5 }">
				<div id="avgStar"><span style="color: #ffa400">★★★★★</span><span style="color: #e0e0e0"></span></div>
			</c:if>
			<c:if test="${ star.points eq null}">
				<div id="avgScore">0</div>
				<div id="avgStar"><span style="color: #ffa400"></span><span style="color: #e0e0e0">★★★★★</span></div>
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
				<table class="reviewT" align="center">
					<tr>
						<td>
							<span class="nickname">${nickNameList[i]}님</span>
							&nbsp;
							<span class="date">
								<c:set var="date" value="${rBean.date}"/>
							<%-- 	<fmt:formatDate value="${rBean.date}" dateStyle="long" var="date"/> --%>
								${fn:substring(date,0,11) }
							</span>
							<br/>
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
								<center><img src="./images/${rBean.image }" style="width: 100%; height: 300px;"></center> 
							</td>
						</c:if>
					</tr>
					<tr>
						<td>
							<span id="orderMenu">${requestScope.menuListInReview[i] }</span>
						</td>
					</tr>
					<tr>
						<td>
							<div id="content">${fn:replace(rBean.contents, newLineChar, "<br/>")}</div>
						</td>
					</tr>
					<c:if test="${rBean.comment ne null }">
						<tr>
							<td>
								<div id="comment"><i id="ceoNick">사장님</i><br><i id="commentFont">${fn:replace(rBean.comment, newLineChar, "<br/>")}</i></div>
							</td>
						</tr>
					</c:if>
				</table>
			</div>
		</c:forEach>
		<div class="appendDiv">
			<!-- 비동기방식으로 리뷰가 들어갈 자리 -->		
		</div>
		
		<!-- 리뷰를 2개씩 보여주기때문에 더보기 버튼은 리뷰가 3개 이상일때만 보여준다 -->
		<!-- 더보기 버튼 클릭했을때 남아있는 리뷰수와 전체 리뷰수를 비교해서 더보기 버튼을 지워줄지 판단하기위해서 매개변수로 전체 리뷰수 넘겨줌 -->
		<c:if test="${requestScope.count>2 }">
			<div class="moreTab" onclick="moreReview(${requestScope.storeNo},${requestScope.count })">
				<a class="more">더보기</a>
			</div>
		</c:if>
	</c:if>	
	
	
	<!-- ////////////////////////////////더보기 클릭했을때 ////////////////////////////////////////// -->

	<script type="text/javascript">
		var startNum = 0;
		function moreReview(storeNo,count) {
			//2개씩 뿌려줄거다
			
 			//var startNum = $("#table tr").length / 4;	// 현재 보여지는 게시글의 수 (기존) 2->4->6 이렇게 2씩 커져야함
 			//var startNum = $(".reviewT").length;	// 현재 보여지는 게시글의 수
 			//var startNum = $("#table table").length;	// 현재 보여지는 게시글의 수
 			startNum += 2;
 			var storeNo = storeNo;	// 가게고유번호
			var count = count; 		// 전체 리뷰 수
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
						var unStars;
						for(var i = 0; i<jsonData.length; i++){
							
							// 줄바꿈 처리
							//var contents = jsonData[i].contents.replace('\n','<br>');	
							var contents = jsonData[i].contents;
							contents = contents.replace(/(?:\r\n|\r|\n)/g, '<br />');
							
							var comment = jsonData[i].comment;
							if(comment != null) {
								comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br />');
							}
							
							// image가 null이 아닐때
							if(jsonData[i].image != null){
								if(jsonData[i].points==0){
									stars = "";
									unStars = "★★★★★";
								}else if(jsonData[i].points==1){
									stars = "★";
									unStars="★★★★";
								}else if(jsonData[i].points==2){
									stars = "★★";
									unStars="★★★";
								}else if(jsonData[i].points==3){
									stars = "★★★";
									unStars="★★";
								}else if(jsonData[i].points==4){
									stars = "★★★★";
									unStars="★";
								}else if(jsonData[i].points==5){
									stars = "★★★★★";
									unStars="";
								}
								
								// comment가 null이 아닐때
								if(jsonData[i].comment == null){
									$(".appendDiv").append("<table class='appendT'><tr><td><span class='nickname'>"+jsonData[i].nickname+"님 </span> &nbsp&nbsp"+
										 "<span class='date'>"+jsonData[i].date.substring(0,10)+"</span>"+
										 "<br><i id='star'>"+stars+"</i><i id='unStar'>"+unStars+"</i></td></tr>"+
										 "<tr><td><center><img src='./images/"+jsonData[i].image+"' style='width: 656px; height: 400px;' class='image'></center></td></tr>"+
										 "<tr><td><span id='orderMenu'>"+jsonData[i].orderMenu+"</span></td></tr>"+
										 "<tr><td><div id='content'>"+contents+"</div></td></tr></table>");
								}else{
									$(".appendDiv").append("<table class='appendT'><tr><td><span class='nickname'>"+jsonData[i].nickname+"님 </span> &nbsp&nbsp"+
											 "<span class='date'>"+jsonData[i].date.substring(0,10)+"</span>"+
											 "<br><i id='star'>"+stars+"</i><i id='unStar'>"+unStars+"</i></td></tr>"+
											 "<tr><td><center><img src='./images/"+jsonData[i].image+"' style='width: 656px; height: 400px;' class='image'></center></td></tr>"+
											 "<tr><td><span id='orderMenu'>"+jsonData[i].orderMenu+"</span></td></tr>"+
											 "<tr><td><div id='content'>"+contents+"</div></td></tr>"+
											 "<tr><td><div id='comment'><i id='ceoNick'>사장님</i><br><div id='commentFont'>"+comment+"</div></div></td></tr></table>");
								}
							// image가 null일때
							}else{
								if(jsonData[i].points==0){
									stars = "";
									unStars = "★★★★★";
								}else if(jsonData[i].points==1){
									stars = "★";
									unStars="★★★★";
								}else if(jsonData[i].points==2){
									stars = "★★";
									unStars="★★★";
								}else if(jsonData[i].points==3){
									stars = "★★★";
									unStars="★★";
								}else if(jsonData[i].points==4){
									stars = "★★★★";
									unStars="★";
								}else if(jsonData[i].points==5){
									stars = "★★★★★";
									unStars="";
								}
								
								if(jsonData[i].comment == null){
									$(".appendDiv").append("<table class='appendT'><tr><td><span class='nickname'>"+jsonData[i].nickname+"님 </span> &nbsp&nbsp"+
										 "<span class='date'>"+jsonData[i].date.substring(0,10)+"</span>"+
										 "<br><i id='star'>"+stars+"</i><i id='unStar'>"+unStars+"</i></td></tr>"+
										 "<tr><td><span id='orderMenu'>"+jsonData[i].orderMenu+"</span></td></tr>"+
										 //"<tr><td><span id='content'>"+jsonData[i].contents+"</span></td></tr></table>");
										 "<tr><td><div id='content'>"+contents+"</div></td></tr></table>");
								}else{
									$(".appendDiv").append("<table class='appendT'><tr><td><span class='nickname'>"+jsonData[i].nickname+"님 </span> &nbsp&nbsp"+
											 "<span class='date'>"+jsonData[i].date.substring(0,10)+"</span>"+
											 "<br><i id='star'>"+stars+"</i><i id='unStar'>"+unStars+"</i></td></tr>"+
											 "<tr><td><span id='orderMenu'>"+jsonData[i].orderMenu+"</span></td></tr>"+
											 //"<tr><td><div id='content'>"+jsonData[i].contents.replace('\n','<br>')+"</div></td></tr>"+
											 "<tr><td><div id='content'>"+contents+"</div></td></tr>"+
											 "<tr><td><div id='comment'><i id='ceoNick'>사장님</i><br><div id='commentFont'>"+comment+"</div></div></td></tr></table>");
								}
							}
						
						}
						
						var showReview = $(".appendDiv table").length+2;	// 지금까지 보여진 리뷰 수
						if(showReview==count){	// 총 리뷰수와 지금까지 보여준 리뷰수가 같으면 [더보기]탭 제거
							$("div").remove(".moreTab");
						}
						
					}						
				}
				,error:function(data,textStatus){
					alert("moreReview에러발생 : "+textStatus)
				}
				
			});// moreReview ajax 끝
		
		}// moreReview 끝
		
		
		
	</script>
</body>
</html>

