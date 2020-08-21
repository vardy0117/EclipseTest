<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./CeoModifyAction.do" method="post">
		<table>
			<tr>
				<th>email</th>
				<td><input type="text" value="${cBean.email }" name="email"></td>
			</tr>
			<tr>
				<th>new password</th>
				<td><input type="password" placeholder="공백시 기존값" name="password"></td>
			</tr>
			<tr>
				<th>name</th>
				<td><input type="text" value="${cBean.name }" name="name"></td>
			</tr>
			<tr>
				<th>phone</th>
				<td><input type="text" value="${cBean.phone }" name="phone"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="수정하기"></td>
			</tr>
			<input type="hidden" value="${cBean.ceoNo }" name="ceoNo">
			<input type="hidden" value="${cBean.password }" name="oldPass">
		</table>
	</form>
</body>
</html>