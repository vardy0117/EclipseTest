<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
var txt1="test";
var txt2 = txt1.slice(0, 3) + "-" + txt1.slice(3);
// alert(txt2);
</script>
분기확인
		<c:set var="info" value="${requestScope.storeInfo}"/>
		<div id="mainDiv">
		<h1>storeinformation.jsp</h1>
		<br>
		<h2>storeNo : ${info.storeNo}</h2>

	<img src="../images/house.jpg" height="1" width="1" alt="업체정보"> <font size="6">업체정보 </font>
	<hr>
		스토어 넘버 : ${info.storeNo} <br>
		사장님 넘버 : ${info.ceoNo} <br>
		영업 시간 : ${info.storeHours} <br>
		폰 : ${info.phone} <br>	
		도로명 : ${info.roadAddress} <br>
		상세주소 : ${info.detailAddress} <br>
		
		스토어 이름 : ${info.name} <br>
	<img src="../images/house.jpg" height="1" width="1" alt="사업자정보"> <font size="6">사업자정보 </font>
	<hr>
		카테고리 : ${info.category} <br>
		가게이름 : ${info.storeHours} <br>
	

		

		사업자 등록 번호 : ${info.regNo}

		<br> <img src="../images/house.jpg" height="1" width="1" alt="기타"> <font size="6">기타 </font>
	<hr>	
		
		사장님 한마디 : ${info.message} <br>
		가게 사진: ${info.image} <br>
		별점?: ${info.points} <br>
		누적주문수 : ${info.orderCount} <br>
		
		</div>

</body>
</html>