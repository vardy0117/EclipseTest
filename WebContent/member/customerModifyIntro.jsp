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
		margin-top: 80px;
		padding: 190px;
	}
	#formDiv {
		width: 400px;
	    height: 200px;
	    margin: auto auto;
	    border: 2px solid #c7c7c7;
	    border-radius: 15px;
	    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.textBox {
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
	.btn {
		width: 245px;
		/* background: linear-gradient(
			to right, 
			hsl(98 100% 62%), 
			hsl(204 100% 59%)
		); */
		background-color:#19ce60;
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
	form > table {
		margin: 0 auto;
	}
</style>

</head>
<body>
	<div id="mainDiv">
		<div id="formDiv">
			<h2 style="text-align: center;">회원정보 수정</h2>
			<form action="" method="post">
				<table>
					<tr>
						<td>
							<input class="textBox" type="password" name="password" placeholder="비밀번호를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<input class="btn" type="submit" value="입력">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>