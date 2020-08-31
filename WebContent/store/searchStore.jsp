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
		/* width: 1000px; */
		width: auto;
		min-height: auto;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		display: grid;
		/* padding: 50px; */
	}
/*   	#storeListDiv {
		margin: 0 auto;
		width: 1000px;
		height: 900px;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding-bottom: 50px;
		
	}   */
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
	


.moreTab{
		height: 100px;
		text-align: center;
	}
	.moreTab:HOVER {
		background-color: #4d4d4d;	
	}

#search {
    width: 306px;
    height: 50px;
    border-radius: 0 0 0 0;
    padding: 0 0 0 0;
 /*    border: 0; 
/   border-top-color: initial;
    border-top-style: initial;
    border-top-width: 0px;
    border-right-color: initial;
    border-right-style: initial;
    border-right-width: 0px;
    border-bottom-color: initial;
    border-bottom-style: initial;
    border-bottom-width: 0px;
    border-left-color: initial;
    border-left-style: initial;
    border-left-width: 0px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial; */
    line-height: 45px;
    font-size: 15px;
    color: #7c8389;
    background: #fff;
        text-indent: 15px;
    -webkit-transition: .5s;
    -moz-transition: .5s;
    transition: .5s;
    z-index: 12;
     border-radius: 15px;
}

/* #searchstore img {
width: 50px;
height: 50px;
border: none;
vertical-align: top;
    
} */
input:focus {outline:none;} /*input클릭시 자체 테두리 생기는 거 삭제 */

#searchbutton {
background: url("images/search.jpg") no-repeat;
width: 70px;
height: 50px;
border: none;
vertical-align: top;
 border-radius: 15px
}

#searchcenter{ /* 검색창 높낮이 */
height: 80px;
}

/* #customerfont{ /*폰트*/
    position: absolute;
    right: 10px;
    top: 10px;
    text-decoration: none;
    color: white;
    text-shadow
    
} */
</style>
</head>
<script>
	function setStoreInStorage(storeNo, storeName){
		console.log(storeName);
		var store = {
			storeNo : storeNo,	
			storeName : storeName
		};
			
		var json = JSON.stringify(store);
		
		sessionStorage.setItem("store",json);	
		
		location.href = "Store.do?storeNo="+storeNo;
	}

	function addStoreNoToStorage(storeNo, storeName){
		var cartItem=JSON.parse(sessionStorage.getItem("cart"));
		if(cartItem==null){
		setStoreInStorage(storeNo, storeName);
		} else { // 카트가 이미 저장된 메뉴가 있으면 (이미 storeNo는 저장된 상태 )
			var store = JSON.parse(sessionStorage.getItem("store"));
			if (storeNo == store["storeNo"]) {
				location.href="Store.do?storeNo="+storeNo;	
			} else {	
				if(confirm("카트를 비우고 다른 가게를 가시겠어요?") == true){
					var cart = null;
					sessionStorage.setItem("cart",cart);
					setStoreInStorage(storeNo, storeName);
					location.href="Store.do?storeNo="+storeNo;
				}
			}
		}
	}


	function moreStore(orderSido) {
		var startNum = $("#storeListDiv ul").length / 4;	// 나누기해서 짝수로 만듦
 		var orderSido = orderSido;


 		
			console.log("storeLiveDiv길이 " + startNum);
		$.ajax({
			type : "post",
			async : false,
			url : "./moreStore.do",
			data : {"orderSido":orderSido,"startNum":startNum},
			dataType : "text",
			success : function(data,textStatus){
			var MoreStoreData = JSON.parse(data);
			var show="";
			alert("아직 상태가 안좋습니다");
			var jsonlength = MoreStoreData.length;
		
			if (MoreStoreData != null) {
				for (var i=0; i<MoreStoreData.length; i++) {
					console.log("json길이 " + MoreStoreData.length);
						show += " <ul id='unlength'>";
						show += " <li id='appendtest' class='litest'>";
						show += "<a onclick='addStoreNoToStorage(" + MoreStoreData[i].storeNo +")'>";
						show += "<font color='purple' size='5'>" + MoreStoreData[i].name + "</font> <br> ";
						show += "스토어 번호 : " + MoreStoreData[i].storeNo + " <br>";
						show += "<img src='upload/store/" + MoreStoreData[i].image +  "'> <br>";
						show += "  종류 : " + MoreStoreData[i].category + " <br> ";
						show += "  운영시간 : " + MoreStoreData[i].storeHours + "  <br> ";
						show += "</a>";
						show += "</li>";
						show += " </ul>"; 
						$("#storeListDiv").append(show);

						
						// console.log("가져온 가게 갯수 : " + MoreStoreData[i].length);
				}

	
						}
						
						if(MoreStoreData.length==0){
							alert("더 이상 가게가 없습니다.");
						
						}			
						
			}, 
			error:function(data,textStatus){
				alert("에러발생");
			}
		});
		

	
	}

	
/* 	function SearchmoreStore(orderSido, search) { // 검색후 ajax 함수 실행
		 var orderSido = orderSido;
		var search = search;
		$.ajax({
			type : "get",
			async : false,
			url : "./searchmoreStore.do",
			data : {orderSido: search},
			dataType : "text",
			success : function(data,textStatus){
				
			alert("search 내용 : " + search + " : " + orderSido);
						var show="";
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
						console.log("show 내용 " + data);
			}, 
			error:function(data,textStatus){
		alert("에러발생");
			}
		});
		

	
	} */
</script>	
<body>
​	<!-- -------------------------------------------------------------------------- -->
<c:set var="length" value="${fn:length(storelist) }" /> <!-- 가게개수 구하는 변수 -->
<c:set var="SearchStoreLength" value="${fn:length(UserSearchStorelist) }" /> <!-- 검결과과 가게 개수  -->
<c:set var="searchcontent" value="${param.search}"/>
	
	<div id="mainDiv">
	
		<div id="storeListDiv" >


	
			고객 번호 : ${customerNo } <br>
		반갑습니다	<font id="customerfont" size="5" color="#FF6347"> ${nickname } </font>님<br>
			귀하의 현재 계정기준 요청주소는 : 
			<font color="orange" size="5"> <c:out value="${orderSido}" /> </font> 입니다 <br>
<!-- ------------------------------------------------------ -->
<c:choose>

	<c:when test="${length >= 0 && searchcontent eq null}"> 	
		<font size="5"><font color="blue">일반</font> DB에 들어있는 총 가게 갯수 : ${length}개 </font> <br> 
	</c:when>

	<c:when test="${SearchStoreLength >= 0 && searchcontent ne null}"> 
		<font size="5"><font color="powerblue">검색결과</font> DB에 들어있는 총 가게 갯수 : ${SearchStoreLength}개 </font> <br> 
	</c:when>

<c:otherwise> otherwise임</c:otherwise>


</c:choose>

<!-- ------------------------------------------------------ -->


<%-- 					<font size="5">DB에 들어있는 총 가게 갯수 : ${length}개 </font> <br> --%>
<%-- 			파람 : ${param.search} <!-- input에 saerch name값 가져옴 --> --%>
			
			<div id="searchstore">
					
		<form action="UserSearchStore.do" method="get" id="frm">
			<center id="searchcenter">
			<input id="search" name="search" placeholder="검색할 가게를 입력하세요">	
<!-- 			<a href="#"><img src="images/search.jpg" alt="사진" onclick="search();"/></a> -->
		<button id="searchbutton" onclick="location.href = '#"></button>
			</center>
 		</form> 
		</div>
<!-- -------------------------------------------------------------------------- -->

	<!-- -------------------------------------------------------------------------- -->
				<c:forEach var="bean" items="${storelist }">
					<ul id="unlength">
						<li id="ajaxtest" class="litest">
								<a onclick="addStoreNoToStorage('${bean.storeNo}','${bean.name}')"> 
								<font color="purple" size="5"><c:out value="${bean.name}" /> </font>
								<br> <c:out value="스토어 번호 : ${bean.storeNo}" /> <br>
								<img src="upload/store/${bean.image}"> <br> <%-- <c:out value="✆전화번호 : 객체에 아직 안가져옴" /> <br> --%>
								<c:out value="종류 : ${bean.category }" /> <br> 
								<c:out value="운영시간 : ${bean.storeHours }" /> <br>
									
								</a>
						
						</li>
					</ul>
		

				</c:forEach>

	<!-- -------------------------------------------------------------------------- -->
				
	<!-- 검색결과로 나온 스토어 표시---------------------------------------------------------- -->
	<!-- storelist로 통합해서 쓰려고 했는데 가게 존재 유무 확인할때 겹쳐서 따로 나눔 -->			
					<c:forEach var="bean" items="${UserSearchStorelist }">
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
	<!-- 검색결과로 나온 스토어 표시---------------------------------------------------------- -->
	</div>
</div>
<!-- -------------------------------------------------------------------------- -->
<!-- 일반 가게 리스트 출력 (배달 가능 가게로 검색을 했을 경우) -->
			<c:set var="area" value="${storelist}" />
				<c:if test="${area eq '[]' }">
					<font size="6" color="orange">
						<p>귀하의 지역에 맞는 가게가 없습니다</p>
					</font>
				</c:if>
	<!-- -------------------------------------------------------------------------- -->	
<!-- 검색된 결과가 없을 경우 -->		
			<c:set var="UserSearchStore" value="${UserSearchStorelist}" />
				<c:if test="${UserSearchStore eq '[]' }">
					<font size="6" color="black">
						<p> "${param.search }" 라는 가게는 존재하지 않습니다</p>
					</font>
				</c:if>
	<!-- -------------------------------------------------------------------------- -->	

<!-- 검색하기전의 더보기 상태랑 아닐때랑 나눔  -->
<!-- 괜히 나눠가지고 ㅡ.ㅡ;;;;;;;;;;;;;;;; -->

	<c:if test="${length >= 2 }"> <!-- 검색전 storesize가 8개 이상이면 더보기창 활성화 -->
<%-- 	storelistsize 조건문 실행 = ${length} --%>
		<c:choose>

		<c:when test="${length >= 0 && searchcontent eq null}"> 	
			<div class="moreTab"  onclick="moreStore('${orderSido}'); ">
			<a class="more">더보기</a>
			</div>	
		</c:when>

	</c:choose>
	</c:if>
	<!-- -------------------------------------------------------------------------- -->	
	<%-- <c:if test="${SearchStoreLength >= 2 }"> <!-- 검색후 storesize가 8개 이상이면 더보기창 활성화 -->
		검색후 더보기 : ${SearchStoreLength } <br>
		ordersido : ${orderSido }
		<c:choose>
		<c:when test="${SearchStoreLength >= 0 && searchcontent ne null}"> 
			<div class="moreTab"  onclick="SearchmoreStore('${orderSido}','${searchcontent}');">
			<!-- 이거 아마 검색후 전용 함수 또만들 ㅡ.ㅡ????? -->
			<a class="more">더보기</a>
			</div>	
		</c:when>

	</c:choose>
	</c:if> --%>
</body>
</html>​