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
		padding: 70px;
	}
	#formDiv {
		width: 800px;
		height: 450px;
		margin: 0 auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.textBox {
		width: 200px;
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
	#roadAddress, #detailAddress {
		width: 256px;
	}
	.btn {
		width: 25px;
		background: linear-gradient(
			to right, 
			hsl(98 100% 62%), 
			hsl(204 100% 59%)
		);
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                var bname = data.bname

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('roadAddress').value = roadAddr;
                document.getElementById('bname').value = bname;
            }
        }).open();
    } 
	
	</script>

	<div id="mainDiv">
		<div id="formDiv">
			<h1 style="text-align: center;">회원 정보 수정</h1>
			<form action="./CustomerModifyAction.do" id="modify" method="post" name="fr">
				<table>
					<tr>
						<th>이메일</th>
						<td><input class="textBox" type="text" value="${ cBean.email }" readonly name="email"></td>
					</tr>
					<tr>
						<th>새 비밀번호</th>
						<td><input class="textBox" type="text" name="password" placeholder="공백시 변경사항 없음"></td>
					</tr>
					<tr>
						<th>별명</th>
						<td><input class="textBox" type="text" value="${ cBean.nickname }" name="nickname"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input class="textBox" type="text" value="${ cBean.phone }" name="phone"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input class="textBox" type="text" id="roadAddress" name="roadAddress" class="roadAddress" size="50" placeholder="주소검색" onclick="execDaumPostcode()" value="${ cBean.roadAddress } "></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="textBox" type="text" id="detailAddress"  name="detailAddress" class="detailAddress" size="50" placeholder="상세 주소 입력" value="${cBean.detailAddress}"></td>		
					</tr>
					<input type="hidden" id="bname" name="bname">
					<input type="hidden" id="customerNo" name="customerNo" value="${cBean.customerNo }">
					<input type="hidden" id="oldPass" name="oldPass" value="${cBean.password}">
					<tr>
						<td colspan="2">
							<br>
							<input class="btn" type="submit" value="회원정보수정">
							<input class="btn" type="button" value="회원탈퇴" onclick="delCustomer()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function delCustomer() {
			var inputString = prompt('"탈퇴하기"를 입력해주세요',""); 
			if(inputString == "탈퇴하기"){
				alert("탈퇴가 완료되었습니다.");
				location.href="./deleteCustomer.do";
			}else{
				alert("잘못입력하셨습니다.");
			}
		}
	</script>
</body>
</html>