<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 30px;
	}
	#tapMenu > div {
		float: left;
		width: 33.33333%;
		height: 50px;
    	line-height: 50px;
		border: 1px solid #d9d9d9;
		text-align: center;
		cursor: pointer;
	}
	.clicked {
		color: white;
		/* background: linear-gradient( to right, hsl(98 100% 62%), hsl(204 100% 59%) ); */
		background-color:#19ce60;
    	text-shadow: 2px 1px 1px grey;
	}
	
	.display-none {
		display: none;
	}
	
	#storeBox {
		float: left;
		width: 49%;
		border: 1px solid #d9d9d9;
		border-radius: 12px;
		cursor: pointer;
		margin-right: 10px;
		margin-bottom: 10px;
	}
	#storeBox:hover {
		background-color: #8080800f;
	}
	#storeBox img {
		width: 100px;
		height: 100px;
		border-radius: 12px; 
	}
	#storeBox td {
		padding-left: 15px;
	}
	#buttonDiv button {
		/* background: linear-gradient( to right, hsl(98 100% 62%), hsl(204 100% 59%) ); */
		background-color:#19ce60;
	    font-family: Binggrae-Bold;
	    font-size: 1rem;
	    color: white;
	    border: none;
	    border-radius: 12px;
	    width: 270px;
	    height: 35px;
	    transition-duration: 1s;
	    opacity: 0.7;
	    margin-bottom: 10px;
	}
	#buttonDiv button:hover {
		cursor: pointer;
		opacity: 1;
	}
	#prevBtn,#nextBtn {
		font-size: 2rem;
	    font-family: 'Binggrae-Bold';
	    color: gray;
	    border: none;
	    border-radius: 12px;
	    cursor: pointer;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	var koreanStartNo = 0;
	var chineseStartNo = 0;
	var japaneseStartNo = 0;
	
	var tapIndex = 1;
	
	window.onload = function() {
		
		document.getElementById("prevBtn").addEventListener("click", function() {
			if(tapIndex > 0) {
				tapIndex -= 1;
			}
			if(tapIndex==1) document.getElementById("koreanTap").click();
			else if(tapIndex==2) document.getElementById("chineseTap").click();
		});
		document.getElementById("nextBtn").addEventListener("click", function() {
			if(tapIndex <= 2) {
				tapIndex += 1;
			}
			if(tapIndex==2) document.getElementById("chineseTap").click();
			else if(tapIndex==3) document.getElementById("japaneseTap").click();
		});
	
		document.getElementById("koreanTap").addEventListener("click", function() {
			tapIndex = 1;
			document.getElementById("koreanTap").classList.add("clicked");
			document.getElementById("chineseTap").classList.remove("clicked");
			document.getElementById("japaneseTap").classList.remove("clicked");
			
			document.getElementById("koreanDiv").classList.remove("display-none");
			document.getElementById("chineseDiv").classList.add("display-none");
			document.getElementById("japaneseDiv").classList.add("display-none");
		});
		document.getElementById("chineseTap").addEventListener("click", function() {
			tapIndex = 2;
			document.getElementById("koreanTap").classList.remove("clicked");
			document.getElementById("chineseTap").classList.add("clicked");
			document.getElementById("japaneseTap").classList.remove("clicked");
			
			document.getElementById("koreanDiv").classList.add("display-none");
			document.getElementById("chineseDiv").classList.remove("display-none");
			document.getElementById("japaneseDiv").classList.add("display-none");
		});
		document.getElementById("japaneseTap").addEventListener("click", function() {
			tapIndex = 3;
			document.getElementById("koreanTap").classList.remove("clicked");
			document.getElementById("chineseTap").classList.remove("clicked");
			document.getElementById("japaneseTap").classList.add("clicked");
			
			document.getElementById("koreanDiv").classList.add("display-none");
			document.getElementById("chineseDiv").classList.add("display-none");
			document.getElementById("japaneseDiv").classList.remove("display-none");
		});
		
		getStoreList('한식', koreanStartNo);
		getStoreList('중식', chineseStartNo);
		getStoreList('일식', japaneseStartNo);
	}
	
	function getStoreList(category, startNo) {
		var currentHour = new Date().getHours();
		$.ajax({
			type : "post",
			url : "./getStoreListByCategory.do",
			data : {category:category, startNo:startNo, currentHour:currentHour},
			dataType : "json",
			success : function(jsonArray) {
				console.log(jsonArray);
				for(var i=0; i<jsonArray.length; i++) {
					var starPoint = jsonArray[i].reviewCount == "0" ? 0 : Math.round(jsonArray[i].points / jsonArray[i].reviewCount);
					starPoint = starPoint.toFixed(1);
					var storeHours = jsonArray[i].storeHours == '00시~00시' ? '24시간 영업' : jsonArray[i].storeHours;
					var storeBox = /* '<div id="storeBox" onclick="location.href=\'Store.do?storeNo='+jsonArray[i].storeNo+'\'">'+  */
									'<div id="storeBox" onclick="addStoreNoToStorage('+jsonArray[i].storeNo +', \''+jsonArray[i].name+'\')">'+ 
										'<table>' + 
											'<tr>' +
												'<td rowspan="4">' +
													'<img src="upload/store/' + jsonArray[i].image +'">' +
												'</td>' +
												'<td>' + jsonArray[i].name + '</td>' +
											'</tr>' +
											'<tr>' +
												'<td><span style="color: #ffa400;">★ ' + starPoint +'</span></td>' +
											'</tr>' +
											'<tr>' +
												'<td>주문수 : ' + jsonArray[i].orderCount + '</td>' +
											'</tr>' +
											'<tr>' +
												'<td>주문가능시간 : ' + storeHours +'</td>' +
											'</tr>' +
										'</table>' +
									'</div>';
					if(category == '한식') {
						$("#koreanDiv").append(storeBox);	
					} else if(category == '중식') {
						$("#chineseDiv").append(storeBox);
					} else if(category == '일식') {
						$("#japaneseDiv").append(storeBox);
					}
				}
				if(category == '한식') {
					koreanStartNo += 10;
					
					$("#koreanDiv #buttonDiv").remove();
					if(jsonArray.length == 10) {
						var moreBtn = '<div id="buttonDiv" style="clear:both; text-align: center; padding: 20px;"><button onclick="getStoreList(\'한식\', ' + koreanStartNo + ');">더 보기</button></div>';
						$("#koreanDiv").append(moreBtn);
					}
				} else if(category == '중식') {
					chineseStartNo += 10;
					
					$("#chineseDiv #buttonDiv").remove();
					if(jsonArray.length == 10) {
						var moreBtn = '<div id="buttonDiv" style="clear:both; text-align: center; padding: 20px;"><button onclick="getStoreList(\'중식\', ' + koreanStartNo + ');">더 보기</button></div>';
						$("#chineseDiv").append(moreBtn);
					}
				} else if(category == '일식') {
					japaneseStartNo += 10;
					
					$("#japaneseDiv #buttonDiv").remove();
					if(jsonArray.length == 10) {
						var moreBtn = '<div id="buttonDiv" style="clear:both; text-align: center; padding: 20px;"><button onclick="getStoreList(\'일식\', ' + koreanStartNo + ');">더 보기</button></div>';
						$("#japaneseDiv").append(moreBtn);
					}
				}
			}
		});
	}
	
	
	function setStoreInStorage(storeNo, storeName){
		//console.log(storeName);
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
	
</script>
<body>
	<div id="mainDiv">
		<div id="tapMenu">
			<div class="clicked" id="koreanTap">한식</div>
			<div id="chineseTap">중식</div>
			<div id="japaneseTap">일식</div>
		</div>
		
		<div style="clear:both; height:20px;"></div>
		
		<div id="koreanDiv">
		</div>
		<div class="display-none" id="chineseDiv">
		</div>
		<div class="display-none" id="japaneseDiv">
		</div>
		
		<div style="clear:both;"></div>
	</div>
	<div style="position:fixed; left:10px; top:50%;"><button id="prevBtn">&lt;</button></div>
	<div style="position:fixed; right:10px; top:50%;"><button id="nextBtn">&gt;</button></div>
</body>
</html>​