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
		background: linear-gradient( to right, hsl(98 100% 62%), hsl(204 100% 59%) );
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
	}
	#storeBox img {
		width: 100px;
		height: 100px;
		border-radius: 12px; 
	}
	#storeBox td {
		padding-left: 15px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	var koreanStartNo = 0;
	var chineseStartNo = 0;
	var japaneseStartNo = 0;
	
	window.onload = function() {
	
		document.getElementById("koreanTap").addEventListener("click", function() {
			document.getElementById("koreanTap").classList.add("clicked");
			document.getElementById("chineseTap").classList.remove("clicked");
			document.getElementById("japaneseTap").classList.remove("clicked");
			
			document.getElementById("koreanDiv").classList.remove("display-none");
			document.getElementById("chineseDiv").classList.add("display-none");
			document.getElementById("japaneseDiv").classList.add("display-none");
		});
		document.getElementById("chineseTap").addEventListener("click", function() {
			document.getElementById("koreanTap").classList.remove("clicked");
			document.getElementById("chineseTap").classList.add("clicked");
			document.getElementById("japaneseTap").classList.remove("clicked");
			
			document.getElementById("koreanDiv").classList.add("display-none");
			document.getElementById("chineseDiv").classList.remove("display-none");
			document.getElementById("japaneseDiv").classList.add("display-none");
		});
		document.getElementById("japaneseTap").addEventListener("click", function() {
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
				for(var i=0; i<jsonArray.length; i++) {
					var starPoint = jsonArray[i].orderCount == "0" ? 0 : jsonArray[i].points / jsonArray[i].orderCount;
					starPoint = starPoint.toFixed(1);
					var storeHours = jsonArray[i].storeHours == '00시~00시' ? '24시간 영업' : jsonArray[i].storeHours;
					
					var storeBox = '<div id="storeBox" onclick="location.href=\'Store.do?storeNo=' + jsonArray[i].storeNo + '\'">' +
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
</body>
</html>​