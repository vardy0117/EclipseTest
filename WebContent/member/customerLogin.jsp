<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
	div {
		box-sizing: border-box;
	}
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	#loginDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
</style>

<body>
	

	<div id="mainDiv">
		<h1 style="text-align: center;">로그인</h1>
		<center>
		<form action="./CustomerLoginAction.do" method="post">
		
				
				<table>
					<tr>
					
					
						<br>고객전용 로그인
						
					</font>
				
					
						<td class="td_left">
						<label for="id">이메일 : </label>
						</td>
						<td class="td_right">
						<input type="text" name="email" id="email"/>
						</td>
					</tr>
					<tr>
						<td class = "td_left">
						<label for = "passwd">비밀번호 : </label>
						</td>
						<td class = "td_right">
						<input type = "password" name = "password" id = "password"/>
						</td>
					</tr>
				</table>
	
			
				<input type = "submit" value = "로그인" id = "selectButton"/>
		
		</form>
		
	
		
		</center>
	</div>
	
	
</body>
</html>