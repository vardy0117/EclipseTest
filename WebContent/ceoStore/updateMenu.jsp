<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${menuBean.image }
	${menuBean.name }
	${menuBean.price }
	${menuBean.category }
	${menuBean.storeNo }
	
	<h1 style="text-align: center;">메뉴 수정</h1>
			<form action="updateMenu.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>메뉴사진</th>
						<td><input type="file" value="${cBean.email }" ></td>
					</tr>
					<tr>
						<th>가게명</th>
						<td><input  type="text" value="${menuBean.name }"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" value="${menuBean.price }"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><input type="text" value="${menuBean.category }"></td>
					</tr>
					<tr>
						<th colspan="2">
							<br>
							<input class="btn" type="submit" value="수정하기">
						</th>
					</tr>
					<input type="hidden" value="${menuBean.storeNo }" >
 				</table>
			</form>
	
	
	
</body>

<script type="text/javascript">
	
	function getParentText(){
    	document.getElementById("cInput").value = opener.document.getElementById("pInput").value;
		}




</script>


</html>