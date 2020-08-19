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
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 80px;
	}
</style>

</head>
<body>
	<div id="mainDiv">
		<form action="" method="post">
			<table>
				<tr>
					<th>비밀번호 입력</th>
					<td><input type="password" name="password"></td>
					<td><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>