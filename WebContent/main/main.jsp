<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var customerNo = "${sessionScope.customerNo}";
		if(customerNo != "") {
			$.ajax({
				type: "post",
				url: "./getCustomer.do",
				data: {customerNo: customerNo},
				dataType: 'json',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					document.fr.roadAddress.value = data.roadAddress;
					document.fr.detailAddress.value = data.detailAddress;
					document.fr.bname.value = data.bname;
					document.fr.sido.value = data.sido;
				}
			});
		}
		
	}
</script>

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
	}
	#searchDiv {
		width: 450px;
		height: 300px;
		position: absolute;
		top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	border: 2px solid #c7c7c7;
	    border-radius: 15px;
	    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	#postDiv {
		width: 300px;
		margin: 0 auto;
		text-align: center;
	}
	.textBox {
		width: 250px;
		height: 30px;
		border-radius: 12px;
		border: 2px solid gray;
		padding-left: 15px;
		font-family: Binggrae-Bold;
		font-size: 1rem;
		margin-bottom: 10px;
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
		margin-bottom: 10px;
	}
	.btn:hover {
		cursor: pointer;
		opacity: 1;
	}
	input:focus { outline: none; }
</style>
</head>
<body>
	<div id="mainDiv">
		<!-- <h1 style="text-align: center;">main.jsp</h1>
		<h2 style="text-align: center;">session에 customerNo를 이용해서 ajax통신해 회원주소를 가져와 default값으로 지정</h2> -->
		<div id="searchDiv">
			<c:if test="${empty sessionScope.customerNo }">
				<h2 style="text-align: center;">배달 주소 설정</h2>
				<input type="hidden" id="sample6_postcode" placeholder="우편번호" disabled="disabled">
				<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" disabled="disabled">
				<form action="./SearchStore.do" method="post" name="fr">
					<div id="postDiv">
							<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="주소변경" disabled="disabled"> <br>
							<input class="textBox" type="text" id="sample6_address" placeholder="로그인 이후 이용가능" name="roadAddress" readonly disabled="disabled">
							<input class="textBox" type="text" id="sample6_detailAddress" name="detailAddress" disabled="disabled">
							<input type="hidden" id="bname" name="bname" disabled="disabled">
							<input type="hidden" id="sido" name="sido">
							<input class="btn" type="submit" value="배달가능 가게 검색" disabled="disabled">
					</div>			
				</form>
			</c:if>
			<c:if test="${!empty sessionScope.customerNo }">
				<h2 style="text-align: center;">배달 주소 설정</h2>
				<input type="hidden" id="sample6_postcode" placeholder="우편번호">
				<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
				<form action="./SearchStore.do" method="post" name="fr">
					<div id="postDiv">
							<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="주소변경"> <br>
							<input class="textBox" type="text" id="sample6_address" placeholder="주소" name="roadAddress" readonly>
							<input class="textBox" type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
							<input type="hidden" id="bname" name="bname">
							<input type="hidden" id="sido" name="sido">
							<input class="btn" type="submit" value="배달가능 가게 검색">
					</div>			
				</form>
			</c:if>
		</div>
		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px auto;position:absolute;top: 50%; left: 50%; transform: translate(-50%, -50%);">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
	</div>
</body>
</html>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            	document.getElementById("bname").value = data.bname;

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                document.getElementById("sido").value = data.sido;
            }
        }).open();
    }
</script>