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
		padding: 50px;
	}
	#storeListDiv {
		margin: 0 auto;
		width: 600px;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		padding-bottom: 50px;
	}
	#storeListDiv table {
		margin: 10px auto;
		width: 500px;
		border-bottom: 2px gray solid;
	}
	#storeListDiv img {
		border-radius: 15px;
		width: 100px;
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
	#updateBtn {
		background: url("images/setting_black.svg") no-repeat;
		background-size: 32px;
		width: 35px;
		height: 35px;
		cursor: pointer;
		border: none;
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
</style>
</head>
<body>
	<div id="mainDiv">
		<div id="storeListDiv">
			<h1 style="text-align:center;">업체 관리</h1>
			<c:forEach var="bean" items="${ceoStorelist}">
					<table>
						<tr>
							<td width="100" height="100">
								<img src="upload/store/${bean.image}" alt="가게사진">
							</td>
							<td width="300">
								<h2 style="padding-left: 20px;"><a href="./ceoStore.do?storeNo=${bean.storeNo }">${bean.name }</a></h2>
							</td>
							<td width="100">
								<button id="updateBtn" onclick="location.href='updateStore.do?storeNo=${bean.storeNo}'"></button>
								<button id="deleteBtn" onclick="deleteStore(${bean.storeNo});"></button>
							</td>
						</tr>
					</table>
			</c:forEach>
		</div>
		
					
	</div>
	
	
	
	<script type="text/javascript">

 function deleteStore(storeNo) {
  if(confirm(" 가게 삭제 하시겠습니까? ")==true){
	  location.href='deletemanage.do?storeNo='+storeNo;
  }
}
</script>
	

</body>