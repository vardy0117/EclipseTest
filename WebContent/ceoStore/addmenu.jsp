<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 90px;
		position: relative;
		padding: 50px;
		
	}
	#formDiv{
	
		width: 500px;
		margin: 0 auto;
		
	
	}
	
	#formDiv table{
		margin: 0 auto;
	
	}
</style>
</head>
<body>
	<div id="mainDiv">
		<div id="formDiv">
			<h1 style="text-align : center ;">메뉴 추가하기</h1>
			<form action="addMenuAction.do" method="post"  enctype="multipart/form-data">
				<table>
					<tr>
						<td>메뉴사진</td>
						<td>
							<input type="file" name="menu_image">
						</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select class="select" style="width:130px;" name="menu_category">
								<option value="세트 메뉴">세트 메뉴</option>
								<option value="주 메뉴">주 메뉴</option>
								<option value="사이드 메뉴">사이드 메뉴</option>
								<option value="음료/주류">음료/주류</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>메뉴이름</td>
						<td>
							<input class="textBox" type="text" name="menu_name">
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
							<input class="textBox" type="text" name="menu_price">원
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="추가하기"> </th>
					</tr>
					
				
				</table>
			
			
				<input type="hidden" name="storeNo" value="${param.storeNo }">
			
			</form>
		
		</div>
	</div>
</body>
</html>