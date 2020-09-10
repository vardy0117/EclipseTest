<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/ceoStoreJSP.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	window.onload = function(){
		var storeNo = "${param.storeNo}";
		$.ajax({
	         async : false,
	         url : "UncheckedOrder.do?storeNo="+storeNo,
	         success : function(count) {
	     		  if(count != 0){
	     			  var audio = new Audio();
	     			  audio.src="./media/order_Voice.mp3";
	     			  console.log(audio);
	     			  audio.play();
	     			  $(".uncheckedOrders").html('<img src="./images/ICON/icons8-meal-50 (3).png">');
	     			
	     		  } else{
	     			 $(".uncheckedOrders").empty();			  
	     		  }
	         }
	   	});
		
		realTimeOrder();
	}

	function showDiv(id, element) {
		document.getElementById('menuDiv').classList.remove('display-on');
		document.getElementById('reviewDiv').classList.remove('display-on');
		document.getElementById('orderDiv').classList.remove('display-on');
		document.getElementById(id).classList.add('display-on');
	}
	
	function realTimeOrder(){
		setInterval(function (){
			var storeNo = "${param.storeNo}";
			$.ajax({
		         async : false,
		         url : "UncheckedOrder.do?storeNo="+storeNo,
		         success : function(count) {
		     		  if(count != 0){
		     			  var audio = new Audio();
		     			  audio.src="./media/order_Voice.mp3";
		     			  console.log(audio);
		     			  audio.play();
		     			  $(".uncheckedOrders").html('<img src="./images/ICON/icons8-meal-50 (3).png">');
		     			
		     		  } else{
		     			 $(".uncheckedOrders").empty();			  
		     		  }
		         }
		   	});
			
			$.ajax({
		         async : false,
		         url : "deliveryFinCheck.do?storeNo="+storeNo,
		         success : function(data){
		        	 if(data!=""){
			        	 var obj = JSON.parse(data);		        	 
		        	 	if(obj.list.length!=0){
		        	 		$.ajax({
				     			async : false,
				     			url : "deliveryFinish.do?orderNo="+orderNo,		
								success : function (){				     		  
				        	 		for(var i=0; i<obj.list.length; i++){
					     			  var audio = new Audio();
					     			  audio.src="./media/delivery_Voice.mp3";
					     			  console.log(audio);
					     			  audio.play();
				        	 		} 
				        	 	}	  
		        	 		});
		        	 	}		
		         
		        	 }
		         }	 
		   	});
		}, 3000);	
	}
	
</script>
</head>
<body>
	<div id="mainDiv">
		<div id="navDiv">
			<div onclick="showDiv('menuDiv',this);">메뉴관리</div>
			<div onclick="showDiv('reviewDiv',this);">리뷰관리</div>
			<div onclick="showDiv('orderDiv',this);">주문내역<span class="uncheckedOrders" style="vertical-align: middle;"></span></div>
		</div>
		
		<div class="contentDiv display-on" id="menuDiv">
		
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '세트 메뉴'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="location.href='updateMenu.do?menuNo=${menu.menuNo}'"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '주 메뉴'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="openChild(${menu.menuNo})"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '사이드 메뉴'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="location.href='updateMenu.do?menuNo=${menu.menuNo}'"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			
			<c:forEach items="${menuList }" var="menu">
				<c:if test="${menu.category eq '음료/주류'}">
					<table>
						<tr>
							<td rowspan="3" width="200">
								<img src="./upload/store/${menu.image }" style="width:100%;">
							</td>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	카테고리 : ${menu.category }
							</td>
							<td rowspan="3">
								<button id="updateBtn" onclick="location.href='updateMenu.do?menuNo=${menu.menuNo}'"></button>
								<button id="deleteBtn" onclick="deleteMenu(${menu.menuNo},${menu.storeNo });"></button>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴이름 : ${menu.name }
							</td>
						</tr>
						<tr>
							<td style="padding-left: 20px; font-size:1.5rem; width: 350px;">
							 	메뉴가격 : ${menu.price }원
							</td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			<div style="text-align: center;">
				<input id="addBtn" type="button" onclick="location.href='addMenu.do?storeNo=${param.storeNo}';">
			</div>
		</div>
		
		
		
		<!---------------------------------- Review----------------------------------->
		
		<div class="contentDiv" id="reviewDiv">
			<c:if test="${requestScope.reviewList ne '[]' }">
			
			
			<c:forEach items="${requestScope.reviewList }" var="review" varStatus="status">
			<c:set value="${status.index }" var="i"/>
				<table id="reviewTable">
					<tr>
						<td><i id="customerName">${requestScope.customerList[i].nickname }</i>님이 작성한 리뷰</td>
						<c:set var="date" value="${review.date}"/>
						<td>${fn:substring(date,0,11) }</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:if test="${review.points eq 0 }">
								<span style="color: #ffa400"></span><span style="color: #e0e0e0">★★★★★</span>
							</c:if>
							<c:if test="${review.points eq 1 }">
								<span style="color: #ffa400">★</span><span style="color: #e0e0e0">★★★★</span>
							</c:if>
							<c:if test="${review.points eq 2 }">
								<span style="color: #ffa400">★★</span><span style="color: #e0e0e0">★★★</span>
							</c:if>
							<c:if test="${review.points eq 3 }">
								<span style="color: #ffa400">★★★</span><span style="color: #e0e0e0">★★</span>
							</c:if>
							<c:if test="${review.points eq 4 }">
								<span style="color: #ffa400">★★★★</span><span style="color: #e0e0e0">★</span>
							</c:if>
							<c:if test="${review.points eq 5 }">
								<span style="color: #ffa400">★★★★★</span><span style="color: #e0e0e0"></span>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${review.image ne null }">
									<img src="./images/${review.image }"> 
								</c:when>
								<c:when test="${review.image eq null}">
									
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span id="orderMenu">${requestScope.orderMenu[i] }</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">${fn:replace(review.contents, newLineChar, "<br/>")}</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${review.comment eq null }">
									<textarea id="commentArea_${review.reviewNo}"></textarea>
									<br>
									<input type="button" value="댓글쓰기" onclick="writeComment(${review.reviewNo })">
								</c:when>
								<c:when test="${review.comment ne null }">
									<textarea class="commentOk" id="commentArea_${review.reviewNo}" readonly="readonly" >${fn:replace(review.comment, newline, "<br/>")}</textarea>
									<%-- <textarea class="commentOk" id="commentArea_${review.reviewNo}" readonly="readonly" >${review.comment }</textarea> --%>
									<br>
									<input type="button" value="댓글삭제" onclick="deleteComment(${review.reviewNo})">
									<input type="button" value="댓글수정" onclick="updateComment(${review.reviewNo})">
								</c:when>
							</c:choose>
						</td>
					</tr>
				</table>
			</c:forEach>
			</c:if>
			<c:if test="${requestScope.reviewList eq '[]' }">
				<h1 align="center">아직 리뷰가 없습니다.</h1>
			</c:if>
		
		<div id="page">
			<c:forEach var="i" begin="1" end="${(requestScope.ceoReviewCount-1)/6+1}">
				<c:if test="${i == requestScope.ceoReviewPageNo }">
					<a id="ceoReviewPageNo" style="color: #ffa400; cursor: pointer;">${i}</a>			
				</c:if>
				<c:if test="${i != requestScope.ceoReviewPageNo }">
					<a href="ceoStore.do?storeNo=${param.storeNo }&ceoReviewPageNo=${i}" id="ceoReviewPageNo">${i }</a>
				</c:if>
			</c:forEach>
		</div>
		</div>
		
		<!---------------------------------/Review---------------------------------------->
		
		
		<div class="contentDiv" id="orderDiv">
			<table>
				<thead>
					<tr> 
						<th>주문 번호 </th>
						<th>주문 확인 </th>
						<th>주문 시간 </th>
						<th>배달 확인 </th>
					</tr>
				</thead>

			<c:forEach items="${orderList}" var="order">
				<tr onclick="location.href='ceoOrder.do?orderNo=${order.orderNo}'">
					<th>${order.orderNo }</th>
					<th>
						<c:if test="${order.orderCheck eq 'F'}">
							<span style="color:green;">주문 확인중</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'T'}">
							<span style="color:red;">수락</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'N'}">
							<span style="color:orange;">주문 취소 처리됨</span>
						</c:if>
					</th>
					<th><fmt:formatDate value="${order.orderTime }" type="both" pattern="yyyy년 MM월 dd일 hh:mm "/></th>
					<th>
						<c:if test="${order.orderCheck eq 'F'}">
							<span style="color:green;">주문 확인중</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'T' and order.deliveryCheck eq 'F'}">
							<span style="color:blue;">배달 준비 중</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'T' and order.deliveryCheck eq 'D'}">
							<span style="color:blue;">배달 중</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'T' and order.deliveryCheck eq 'T'}">
							<span style="color:red;">배달 완료</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'T' and order.deliveryCheck eq 'A'}">
							<span style="color:red;">배달 완료</span>
						</c:if>
						<c:if test="${order.orderCheck eq 'N'}">
							<span style="color:orange;">배달 취소 처리됨</span>
						</c:if>
					</th>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
	
	
	
</body>
<script>
	var ceoReviewPageNo = "${param.ceoReviewPageNo}";
	if(ceoReviewPageNo != ""){
		document.getElementById('menuDiv').classList.remove('display-on');
		document.getElementById('reviewDiv').classList.remove('display-on');
		document.getElementById('orderDiv').classList.remove('display-on');
		document.getElementById('reviewDiv').classList.add('display-on');
	}


	function deleteMenu(menuNo, storeNo) {
		if(confirm(" 메뉴를 삭제 하시겠습니까? ")==true){
			  location.href='deleteMenu.do?menuNo='+menuNo+'&storeNo='+storeNo;
		}
	}
	
	var openWin;
	
	function openChild(menuNo){
		location.href = 'updateMenu.do?menuNo='+menuNo;
	}
	
	function writeComment(reviewNo){
		var comment = $("#commentArea_"+reviewNo).val();
		
		$.ajax({
			type : "post",
			async : false,
			url : "./writeComment.do",
			data : {"comment":comment,"reviewNo":reviewNo},
			dataType : "text",
			success : function(data,textStatus){
				if(data==1){
					alert("댓글등록완료");
					document.getElementById("commentArea_"+reviewNo).classList.add("commentOk");
					$("#commentArea_"+reviewNo).parent('td').children('input').remove();
					var elements = '<input type="button" value="댓글삭제" onclick="deleteComment(' + reviewNo + ')"><input type="button" value="댓글수정" onclick="updateComment(' + reviewNo + ')">';
					$("#commentArea_"+reviewNo).parent('td').append(elements);
					$("#commentArea_"+reviewNo).html(comment);
					$("#commentArea_"+reviewNo).attr("readonly",true);
					
				}else{
					alert("댓글등록실패");
				}
			},error:function(data,textStatus){
				alert("writeComment Ajax Error : "+textStatus);
			}
			
		});//ajax 끝
	}
	function deleteComment(reviewNo){
		$.ajax({
			type : "post",
			async : false,
			url : "./deleteComment.do",
			data : {"reviewNo":reviewNo},
			dataType : "text",
			success : function(data,textStatus){
				if(data==1){
					alert("댓글삭제완료");
					$("#commentArea_"+reviewNo).html("");
					document.getElementById("commentArea_"+reviewNo).classList.remove("commentOk");
					$("#commentArea_"+reviewNo).parent('td').children('input').remove();
					var elements ='<input type="button" value="댓글쓰기" onclick="writeComment('+reviewNo+')">'; 
					$("#commentArea_"+reviewNo).parent('td').append(elements);
					$("#commentArea_"+reviewNo).removeAttr("readonly");
				}else{
					alert("댓글삭제실패");
				}
			},error: function(data,textStatus){
				alert("댓글삭제 에러발생 : "+textStatus);
			}
			
		});
	}
	function updateComment(reviewNo){
		$("#commentArea_"+reviewNo).removeAttr("readonly");
		document.getElementById("commentArea_"+reviewNo).classList.remove("commentOk");
		$("#commentArea_"+reviewNo).parent('td').children('input').remove();
		var elements = '<input type="button" value="댓글수정" onclick="writeComment('+reviewNo+')">';
		$("#commentArea_"+reviewNo).parent('td').append(elements);
	}
	
	
</script>
</html>