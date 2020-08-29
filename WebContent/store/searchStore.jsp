<%@page import="net.store.db.StoreBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		/* border: 2px solid green;  줄그리는건데 보류 */
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	.storeDetail:HOVER{
		background-color: silver;
	}
	
	.storeDetail{
		height:300px;
		width:450px;
		
			float: left;
		margin: 10px auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding: 20px;
		
	}
	
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding: 50px;
	}
 /* 	#storeListDiv {
		margin: 0 auto;
		width: 1000px;
		height: 900px;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding-bottom: 50px;
		
	}  */
	#storeListDiv table {
		margin: 10px auto;
		width: 500px;
		border-bottom: 2px gray solid;
	}
	
	#storeListDiv img { /*이미지 사이즈 여기서 설정됨*/
		border-radius: 15px; /*동그라미? 처리*/
		height: 200px;
        width: 190px;
        
	}
	#storeListDiv a {
		text-decoration: none;
		color: black;
		cursor: pointer;
		
		
	}
	#storeListDiv a:hover {
		text-decoration: underline;
		color: gray;
	}

	
/* 		#storeListDiv { */
/* 		width: 1000px; */
/* 		height: 1000px; */
/* 		text-decoration: underline; */
/* 		color: green; */
/* 	} */
	/* #updateBtn {
		background: url("images/setting_black.svg") no-repeat;
		background-size: 32px;
		width: 35px;
		height: 35px;
		cursor: pointer;
		border: none;
	} */
	#updateBtn:hover {
		background: url("images/setting_gray.svg") no-repeat;
		background-size: 32px;
	}
	#deleteBtn {
		background: url("images/delete_black.svg") no-repeat;
		background-size: 32px;
		width: 35px;
		height: 35px;
		cursor: pointer;
		border: none;
	}
	#deleteBtn:hover {
		background: url("images/delete_gray.svg") no-repeat;
		background-size: 32px;
	}
	
		table {
		margin: 10px auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding: 20px;
	}
	
		.litest{
		float: left;
		margin: 10px auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding: 20px;
		list-style:none; /* li태그쓸때 점 없애기*/
	
	}
	
:root {
    --heightsize: 900px;
}  

#storeListDiv {
    height: var(--heightsize);
}



.moreTab{
		height: 100px;
		text-align: center;
	}
	.moreTab:HOVER {
		background-color: #4d4d4d;	
	}


</style>
</head>
<script>
	function setStoreInStorage(storeNo){
		var store = {
			storeNo : storeNo	
		};
			
		var json = JSON.stringify(store);
		
		sessionStorage.setItem("store",json);	
		
		location.href = "Store.do?storeNo="+storeNo;
	}

	function addStoreNoToStorage(storeNo){
		var cartItem=JSON.parse(sessionStorage.getItem("cart"));
		if(cartItem==null){
		setStoreInStorage(storeNo);
		} else { // 카트가 이미 저장된 메뉴가 있으면 (이미 storeNo는 저장된 상태 )
			var store = JSON.parse(sessionStorage.getItem("store"));
			if (storeNo == store["storeNo"]) {
				location.href="Store.do?storeNo="+storeNo;	
			} else {	
				if(confirm("카트를 비우고 다른 가게를 가시겠어요?") == true){
					var cart = null;
					sessionStorage.setItem("cart",cart);
					setStoreInStorage(storeNo);
					location.href="Store.do?storeNo="+storeNo;
				}
			}
		}
	}
	

	function moreStore(orderSido) {
		 var orderSido = orderSido;
		var storeNo;
		$.ajax({
			type : "post",
			async : false,
			url : "./moreStore.do",
			data : {orderSido: orderSido},
			dataType : "text",
			success : function(data,textStatus){
//			alert("moreStore ajax 받은 데이터 : " + data + " " + orderSido);

			autosize();

						var show;
						show += "<c:forEach var='bean' items='${storelist}'>";
						show += " <ul>";
						show += " <li id='ajaxtest' class='litest'>";
						show += "<a onclick='addStoreNoToStorage(${bean.storeNo})'>";
						show += "<font color='purple' size='5'>${bean.name}</font> <br> ";
						show += "스토어 번호 : ${bean.storeNo} <br>";
						show += "<img src='upload/store/${bean.image}'> <br>";
						show += "  종류 : ${bean.category } <br> ";
						show += "  운영시간 : ${bean.storeHours} <br> ";
						show += "</a>";
						show += "</li>";
						show += " </ul>";
						show += "</c:forEach>";
						$("#storeListDiv").append(show);
						// button_onclick();
			}, 
			error:function(data,textStatus){
		alert("에러발생");
			}
		});
		

	
	}
	
	
</script>	
<body>
​	
<c:set var="length" value="${fn:length(storelist) }" /> <!-- 가게개수 구하는 변수 -->

	<div id="mainDiv">
		<div id="storeListDiv" >

			커스터머 번호 : ${customerNo } <br>귀하의 현재 계정기준 요청주소는 : <font
				color="orange" size="5"> <c:out value="${orderSido}" />
			</font> 입니다 <br>
			
					<font size="5">총 가게 갯수 : ${length}개 </font>
					
<%-- 		<c:if test="${length >= 1 }"> --%>
<!-- 			1개가 넘네 -->

<%-- 		</c:if> --%>

<%-- 			<font size="5">요청된 가게 갯수 : ${storeNo}</font> --%>

	
				<c:forEach var="bean" items="${storelist }">
					<ul>
						<li id="ajaxtest" class="litest">
								<a onclick="addStoreNoToStorage('${bean.storeNo}')"> 
								<font color="purple" size="5"><c:out value="${bean.name}" /> </font>
								<br> <c:out value="스토어 번호 : ${bean.storeNo}" /> <br>
								<img src="upload/store/${bean.image}"> <br> <%-- <c:out value="✆전화번호 : 객체에 아직 안가져옴" /> <br> --%>
								<c:out value="종류 : ${bean.category }" /> <br> 
								<c:out value="운영시간 : ${bean.storeHours }" /> <br>
									
								</a>
						
						</li>
					</ul>
		

				</c:forEach>

	</div>
</div>

			<c:set var="area" value="${storelist}" />
				<c:if test="${area eq '[]' }">
					<font size="6" color="orange">
						<p>귀하의 지역에 맞는 가게가 없습니다</p>
					</font>
				</c:if>

		
	
	
	<div class="moreTab"  onclick="moreStore('${orderSido}');">
		<a class="more">더보기</a>
	</div>	

</body>
</html>​