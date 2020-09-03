<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

 	#mainDiv {
		width: 750px;
	    height: 350px;
	    margin: auto;
	    margin-top: 150px;
	    padding: 30px;
	    margin-bottom: 100px;
	} 
	#formDiv {
	    width: 500px;
	    height: 350px;
	    margin: auto auto;
	    border: 2px solid #c7c7c7;
	    border-radius: 15px;
	    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	#formDiv table {
		margin: 0 auto;
	}
	.textBox {
		width: 150px;
		height: 30px;
		border-radius: 12px;
		border: 2px solid gray;
		padding-left: 15px;
		font-family: Binggrae-Bold;
		font-size: 1rem;
	}
	input:focus { outline: none; }
	select:focus { outline: none; }
	.btn {
		width: 25px;
		background: linear-gradient( to bottom, hsl(0deg 0% 0%), hsl(0deg 0% 57%));
		font-family: Binggrae-Bold;
		font-size: 1rem;
		color: white;
		border: none;
		border-radius: 12px;
		width: 270px;
		height: 35px;
		transition-duration: 1s;
		opacity: 0.7;
	}
	.btn:hover {
		cursor: pointer;
		opacity: 1;
	}
	select {
		border-radius: 12px;
	    width: 100px;
	    height: 37px;
	    border: 2px solid gray;
	    font-family: Binggrae-Bold;
	    font-size: 1rem;
    	padding-left: 10px;
	}
</style>


</head>
<body>
	
	${menuBean.price }
	${menuBean.category }
	
	<div id="mainDiv">
		<div id="formDiv">
			<h1 style="text-align: center;">메뉴 수정</h1>

		
			<form name="fr" action="updateMenuAction.do" method="post" enctype="multipart/form-data">
				<table  id="updatemenu">
					<tr>
						<th>메뉴사진</th>
						<td>
							<input type="file" value="${cBean.image }" onchange="document.getElementById('imageflag').value = 'true';" name="image">
							<br><span style="color:red; font-size: 0.7rem;">※변경안할시 원본상태 유지됩니다.</span>
						</td>
					</tr>
					<tr>
						<th>음식명</th>
						<td><input class="textBox"  type="text" value="${menuBean.name }" name="name"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input class="textBox" type="text" value="${menuBean.price }" name="price"></td>
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
							<input class="btn" type="submit" value="수정하기">
							
							<input type="hidden" value="${menuBean.storeNo }" name="storeNo" >
							<input type="hidden" value="${menuBean.menuNo }" name="menuNo">
							<input type="hidden" value="false" id="imageflag" name="imageflag">
							<input type="hidden" value="${menuBean.image }" name="before_image">
							
							<!--  onclick="setParentText()"> -->
						</th>
					</tr>
					
 				</table>
			</form>
		</div>
	</div>
</body>

<script>
	document.fr.category.value = '${menuBean.category}';
</script>



</html>