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
	//	var num = 2;
		var startNum = $("#ullength ul").length;
 		var orderSido = orderSido;


	//	console.log("storeLiveDiv길이" + startNum + " / " + num + " = " + startNum  / num);
		$.ajax({
			type : "post",
			async : false,
			url : "./moreStore.do",
			data : {"orderSido":orderSido,"startNum":startNum},
			dataType : "text",
			success : function(data,textStatus){
			var MoreStoreData = JSON.parse(data);
		
		
			if (MoreStoreData != null) {
				for (var i=0; i<MoreStoreData.length; i++) { // json길이가 줄어들때 까지
					console.log("json길이 : " + MoreStoreData.length);
					var show="";
			      		show += " <ul>";
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
						$("#appendMoreStore").append(show);  
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

	<!-- -------------------------------------------------------------------------- -->

			<c:forEach var="bean" items="${storelist}" varStatus="status">
				<div id="ullength">
					<ul >
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
			</div>
		

				</c:forEach>
				
	

	</div>
</div>


</body>
</html>​