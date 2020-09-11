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
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding: 100px;
	}
	#loginDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	.td_left {
		text-align: right;
	}
	form > table {
		font-size: 1.2rem;
		margin: 0 auto;
	}
	.td_right {
		padding-left: 10px;
	}
	.inputData {
		width: 250px;
    	height: 30px;
    	border-radius: 12px;
    	border: 2px solid gray;
		padding-left: 15px;
		font-family: Binggrae-Bold;
		font-size: 1rem;
	}
	input[type=password] {
		font-family: 'pass', 'Roboto', Helvetica, Arial, sans-serif ;
	}
	input[type=password]::placeholder {
		font-family: Binggrae-Bold;
	}
	input:focus { outline: none; }
	#formDiv {
		width: 500px;
	    height: 300px;
	    margin: 0 auto;
	    border: 2px solid #c7c7c7;
	    border-radius: 15px;
	    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.btn {
		width: 245px;
		background: black;
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
</style>

<body>
	<div id="mainDiv">

		<div id="formDiv">
			<h1 style="text-align: center;">사장님 로그인</h1>
			<form action="./CeoLoginAction.do" method="post">
				<table>
					<tr>
						<!-- <td class="td_left"><label for="id">이메일</label></td> -->
						<td class="td_right"><input class="inputData" type="text" name="email" id="email" placeholder="이메일 주소"/></td>
					</tr>
					<tr>
						<!-- <td class="td_left"><label for="passwd">비밀번호</label></td> -->
						<td class="td_right"><input class="inputData" type="password" name="password"id="password" placeholder="비밀번호"/></td>
					</tr>
					<tr>
						<td class="td_right"><input class="btn" type="submit" value="로그인"/></td>
					</tr>
					<tr>
						<td class="td_right"><input class="btn" type="button" value="회원가입" onclick="location.href='./CeoJoin.do'"/></td>
					</tr>
				</table>
			</form>
		</div> 
	</div>
	
	
</body>
</html>