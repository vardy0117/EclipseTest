<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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


	<form action="./CustomerModifyAction.do" id="modify" method="post" name="fr">
		<table>
			<tr>
				<th>이메일</th>
				<td><input type="text" value="${ cBean.email }" readonly name="email"></td>
			</tr>
			<tr>
				<th>새 비밀번호</th>
				<td><input type="text" value=" " name="password"></td>
			</tr>
			<tr>
				<th>별명</th>
				<td><input type="text" value="${ cBean.nickname }" readonly name="nickname"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" value="${ cBean.phone }" readonly name="phone"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="roadAddress" name="roadAddress" class="roadAddress" size="50" placeholder="주소검색" onclick="execDaumPostcode()" value="${ cBean.loadAddress } "></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" id="detailAddress"  name="detailAddress" class="detailAddress" size="50" placeholder="상세 주소 입력" value="${cBean.detailAddress} }"></td>		
			</tr>
			<input type="hidden" id="bname" name="bname">
			
			<tr>
				<td></td>
				<td><input type="submit" value="회원정보수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>