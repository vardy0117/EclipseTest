<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
 
<title>Insert title here</title>
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
	}
</style>

<script type="text/javascript">

 function deleteStore(storeNo) {
  if(confirm(" 가게 삭제 하시겠습니까? ")==true){
	  location.href='deletemanage.do?storeNo=${bean.storeNo}'
  }
}




</script>
</head>
<body>
	<div id="mainDiv">
		<h1 style="text-align:center;">업체 관리  </h1>

	
	<c:forEach var="bean" items="${ceoStorelist}">
			
		<!--  <a href='Store.do?storeNo=${bean.storeNo}'>	-->
				
				<div class="storeDetail">
					<font size="10">---가져온 스토어 데이터---</font> <br>
					
					<font color="purple" size="5">가게 이름 :	<c:out value=" ${bean.name}" /> </font> <br>
					<c:out value="<업체 소개 사진> "/> <br>
					 <img src="upload/store/${bean.image}" alt="스토어 음식사진" width="200" height="200"> <br>
					 <input type="button" value=" 수정하기 " onclick="location.href='updateStore.do?storeNo=${bean.storeNo}'" > 
					 <input type="button" value=" 삭제하기 " onclick="deleteStore('${bean.storeNo} ')"> 
				</div>
		
		
		
		
		
		
		
		
			</c:forEach>		
	</div>
</body>