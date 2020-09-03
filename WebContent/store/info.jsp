<%@page import="net.store.db.StoreBean"%>
<%@page import="net.store.db.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#infoDiv{
		clear: both;
		border: 1px solid #d9d9d9;
		padding-top: 15px;
	}	
	#infoDiv table{
		margin-left: 15px;
	}
	
	img { /*위치 조정*/
		margin-bottom: -8px;	
		margin-left: 15px;
	}
	
	.star { 
    	color: #ffa400;
    	margin-left: 0px
  	}	
  	.td_left {
  		text-align: right;
  	}
  	.td_right {
  		padding-left: 15px;
  	}
  	hr {
  		width: 95%;
  	}
  	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>
	<c:set var="info" value="${requestScope.storeInfo}" />
	<c:set var="star" value="${requestScope.storereview}" />

	<div id="infoDiv">
		<img src="${pageContext.request.contextPath }/images/확성기.svg" height="50" width="50" alt="사장님알림"> <font size="6">사장님 알림</font> <br>
		<hr>
		<div style="padding-left:15px; margin-bottom: 15px;">
			${info.message }
		</div>

		

		<img src="${pageContext.request.contextPath }/images/홈.svg" height="50" width="50" alt="업체정보"> <font size="6">업체정보 </font>
		<hr>
		<table>
			<tr>
				<td class="td_left">영업시간</td>
				<td class="td_right">
					<c:if test="${info.storeHours == '00시~00시'}">
						24시 영업
					</c:if>
					<c:if test="${info.storeHours != '00시~00시'}">
						${info.storeHours }
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="td_left">전화번호</td>
				<td class="td_right">${info.phone }</td>
			</tr>
			<tr>
				<td class="td_left">카테고리</td>
				<td class="td_right">${info.category}</td>
			</tr>
			<tr>
				<td class="td_left">주소</td>
				<td class="td_right">${info.roadAddress } ${info.detailAddress }</td>
			</tr>
		</table>
		
		<br> <img src="${pageContext.request.contextPath }/images/게시글.svg" height="50" width="50" alt="사업자정보"> <font size="6">사업자정보 </font>
		<hr>
		<table>
			<tr>
				<td class="td_left">사업자번호</td>
				<c:set var="regNo" value="${info.regNo }"/>
				<td class="td_right">${fn:replace(regNo, '-', '') }</td>
			</tr>
			<tr>
				<td class="td_left">상호명</td>
				<td class="td_right">${info.name }</td>
			</tr>
		</table>

		<%-- <c:if test="${ info.regNo eq null}">
			<script>
				alert("정보가 없는 페이지 입니다");
				location.href = "index.jsp";
			</script>
		</c:if> --%>

		<c:if test="${po != null }">
		평균별점: ${star.points}점 
		<c:forEach var="rBean" varStatus="status" begin="1"
				end="${star.points}">
				<c:if test="${star.points ne null}">
					<i class="star">★</i>
				</c:if>
				<!-- 별찍는 if문 -->
			</c:forEach>

			<c:forEach var="rBean" varStatus="status" begin="1"
				end="${5-star.points}">
				<i class="star">☆</i>
			</c:forEach>
		</c:if>
		<br>


		<%-- <c:if test="${ po eq null}">
			평균별점 : 등록된 평균 별점이 없네요 <br>
		</c:if>

		누적주문수 : ${info.orderCount} <br>
		<br> --%>

	</div>

	<img src="${pageContext.request.contextPath }/images/위치.svg" height="50" width="50" alt="업체위치"><font size="6">업체위치 </font>
	<hr>
	<div id="map" style="width:95%;height:350px; margin:15px auto;"></div>
	
	


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=875d930afbea1135434d34ec4cd1abb6&libraries=services"></script>
<script>
var address = '<c:out value="${info.roadAddress}"/>';
var storeName = '<c:out value="${info.name}"/>';
var coords;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:0;">' + storeName + '</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>