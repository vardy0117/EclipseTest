<%@page import="net.store.db.StoreBean"%>
<%@page import="net.store.db.StoreDAO"%>
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
<style>
	#infoDiv{
		clear: both;
		border: 1px solid #d9d9d9;
}	

img{ /*위치 조정*/
margin-bottom: -8px;	
	}
	
.star { 
    color: #ffa400;
    margin-left: 0px
  }	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


		<c:set var="info" value="${requestScope.storeInfo}"/>
		<c:set var="star" value="${requestScope.storereview}"/>
		
		<div id="infoDiv">

	<img src="${pageContext.request.contextPath }/images/홈.svg" height="50" width="50" alt="업체정보"> <font size="6">업체정보 </font>
	<hr>
		스토어 넘버 : ${info.storeNo} <br>
		사장님 넘버 : ${info.ceoNo} <br>
		영업 시간 : ${info.storeHours} <br>
		폰 : ${info.phone} <br>	
		도로명 : ${info.roadAddress} <br>
		상세주소 : ${info.detailAddress} <br>
		
		스토어 이름 : ${info.name} <br><br>
	<img src="${pageContext.request.contextPath }/images/게시글.svg" height="50" width="50" alt="사업자정보"> <font size="6">사업자정보 </font>
	<hr>
		카테고리 : ${info.category} <br>
		가게이름 : ${info.storeHours} <br>

<c:if test="${ info.regNo eq null}">
		<script>

			alert("정보가 없는 페이지 입니다");
			location.href="index.jsp";
		</script>
		</c:if>

		<br> <img src="${pageContext.request.contextPath }/images/확성기.svg" height="50" width="50" alt="게시글"> <font size="6">게시글</font>
		<br>
	<hr>	
	<c:set var="po" value="${star.points}" /> <!-- 포인트 전용 변수 -->
		
		사장님 한마디 : ${info.message} <br>
		가게 사진: ${info.image} <br>
		
		<c:if test="${po != null }">
		평균별점: ${star.points}점 
		<c:forEach var="rBean" varStatus="status" begin="1" end="${star.points}">
				<c:if test="${star.points ne null}">
					<i class="star">★</i>
				</c:if> <!-- 별찍는 if문 -->	
		</c:forEach>
		
		<c:forEach var="rBean" varStatus="status" begin="1" end="${5-star.points}">
				<i class="star">☆</i>
				</c:forEach>
		</c:if>
		<br>
		
		
		<c:if test="${ po eq null}">
			평균별점 : 등록된 평균 별점이 없네요 <br>
		</c:if>

		누적주문수 : ${info.orderCount} <br><br>
		
		</div>

	<img src="${pageContext.request.contextPath }/images/위치.svg" height="50" width="50" alt="업체위치"> <font size="6">업체위치 </font>
	<hr>
	<div id="map" style="width:400px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8aab9da70f9c5bec74d9ebf3d0437a3&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8aab9da70f9c5bec74d9ebf3d0437a3&libraries=LIBRARY"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8aab9da70f9c5bec74d9ebf3d0437a3&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8aab9da70f9c5bec74d9ebf3d0437a3"></script>




<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var data = '<c:out value="${info.roadAddress}"/>'; // jstl변수 여기로 보냄
var data2 ='<c:out value="${info.detailAddress}"/>';   
var storename = '<c:out value="${info.name}"/>';   
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(data + " "+ data2, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:0px 0;">'+ storename + '</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    

	
</script>

</body>
</html>