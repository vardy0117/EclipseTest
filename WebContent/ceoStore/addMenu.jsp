<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 150px;
	}
	#formDiv {
		width: 600px;
		height: 350px;
		margin: 0 auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	#formDiv table {
		margin : 0 auto;
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
	.btn {
		width: 25px;
		background: linear-gradient( to bottom, hsl(0deg 0% 0%), hsl(0deg 0% 57%));
		font-family: Binggrae-Bold;
		font-size: 1rem;
		color: white;
		border: none;
		border-radius: 12px;
		width: 140px;
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
	    padding-left : 15px;
	}
	input:focus { outline: none; }
	select:focus { outline: none; }
	.td_right {
		padding-left: 15px;
	}
</style>
</head>
<body>

<div id="mainDiv">
	<div  id="formDiv" >
		<h1 style="text-align: center;">메뉴 추가 </h1>
		<form action="addMenuAction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="storeNo" value="${param.storeNo }">
			<table>
				<tr>
					<th>메뉴사진</th>
					<td class="td_right"><input type="file" name="image"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td class="td_right">
						<select class="select" style="width:130px;" name="category">
							<option value="세트 메뉴">세트 메뉴</option>
							<option value="주 메뉴">주 메뉴</option>
							<option value="사이드 메뉴">사이드 메뉴</option>
							<option value="음료/주류">음료/주류</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이름 </th>
					<td  class="td_right"><input class="textBox" type="text" name="name"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td  class="td_right"><input class="textBox" type="text" name="price"></td>
				</tr>
				<tr>
					<th colspan="2">
						<br>
						<input class="btn" type="submit" value="메뉴 추가 ">
						<input class="btn" type="button" value="뒤로가기" onclick="history.back();">
					</th>
				</tr>
				<input type="hidden" value="${menuBean.storeNo }" >
			</table>
		</form>
	</div>
</div>


</body>
</html>