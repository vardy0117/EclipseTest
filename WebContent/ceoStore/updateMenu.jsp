<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	${menuBean.name }
	${menuBean.price }
	${menuBean.category }
	${menuBean.storeNo }
	
	<h1 style="text-align: center;">메뉴 수정</h1>

			<form name="fr" action="updateMenuAction.do" method="post" enctype="multipart/form-data">
				<table  id="updatemenu">
					<tr>
						<th>메뉴사진</th>
						<td><input type="file" value="${cBean.image }" onchange="document.getElementById('imageflag').value = 'true';" name="image"></td>
					</tr>
					<tr>
						<th>음식명</th>
						<td><input  type="text" value="${menuBean.name }" name="name"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" value="${menuBean.price }" name="price"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td id="category2">
							<select class="select" style="width:130px;" name="category">
								<option value="세트 메뉴">세트 메뉴</option>
								<option value="주 메뉴">주 메뉴</option>
								<option value="사이드 메뉴">사이드 메뉴</option>
								<option value="음료/주류">음료/주류</option>
							</select>  
						</td>
						
					</tr>
					<tr>
						<th colspan="2">
							<br>
							
							<input type="hidden" value="${menuBean.storeNo }" name="storeNo" >
							<input type="hidden" value="${menuBean.menuNo }" name="menuNo">
							<input type="hidden" value="false" id="imageflag" name="imageflag">
							<input type="hidden" value="${menuBean.image }" name="before_image">
							<input class="btn" type="submit" value="수정하기">
							<!--  onclick="setParentText()"> -->
						</th>
					</tr>
					
 				</table>
			</form>
	
	
	
</body>

<script>
	document.fr.category.value = '${menuBean.category}';
</script>



</html>