<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding: 80px;
	}
	#formDiv {
		width: 650px;
	    height: 660px;
	    margin: 0 auto;
	    border: 2px solid #c7c7c7;
	    border-radius: 15px;
	    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24); 
	}
	
	#formDiv table {
		width: 560px;
		margin: 0 auto;
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
	.textArea {
		border: 2px gray solid;
	    border-radius: 12px;
	    width: 300px;
	    height: 80px;
	    padding-left: 15px;
		font-family: Binggrae-Bold;
		font-size: 0.8rem;
	}
	.select {
		border: 2px solid gray;
	    border-radius: 12px;
	    width: 80px;
	    height: 30px;
	    font-family: 'Binggrae-Bold';
	    padding-left: 15px;
	    font-size: 1rem;
	}
	.select:foucs { outline:none; }
	.textArea:focus {outline: none;}
	input:focus { outline: none; }
	.btn {
		background: black;
		font-family: Binggrae-Bold;
		font-size: 1rem;
		color: white;
		border: none;
		border-radius: 12px;
		width: 150px;
		height: 35px;
		transition-duration: 1s;
		opacity: 0.7;
	}
	.btn:hover {
		cursor: pointer;
		opacity: 1;
	}
</style>
</head>
<body>
	<div id="mainDiv">
		
		<div id="formDiv">
			<h1 style="text-align:center;">업체 수정</h1>
			<form action="updateStoreAction.do"  method="post" enctype="multipart/form-data" name="fr">
				<input type="hidden" name="storeNo" value="${param.storeNo }">
				<table>
					<tr>
						<td>가게명</td>
						<td>
							<input class="textBox" type="text" name="name" value="${storeBean.name }">
						</td>
					</tr>
					<tr>
						<td>대표이미지</td>
						<td>
							<input type="file" name="image" onchange="document.fr.fileFlag.value = 'true';" style="width:221px;">
							<input type="hidden" name="fileFlag" value="false"> 
							<span style="color:red; font-size: 0.7rem;">※변경안할시 원본상태 유지됩니다.</span>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="hidden" id="sample6_postcode" placeholder="우편번호">
							<input class="textBox" type="text" id="sample6_address" placeholder="주소" name="roadAddress" value="${storeBean.roadAddress }">
							<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" >
							<input class="btn" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<input class="textBox" type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress" value="${storeBean.detailAddress }">
						</td>
					</tr>
					<tr>
						<td>카테고리 </td>
						<td>
							<select class="select" name="category">
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
							</select>	  
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<input class="textBox" type="text" name="phone" value="${storeBean.phone }">
						
						</td>
						
					</tr>
					<tr>
						<td>영업시간</td>
						<td>
							<select class="select" name="opentime">
								<option value="00시">00시</option>
								<option value="01시">01시</option>
								<option value="02시">02시</option>
								<option value="03시">03시</option>
								<option value="04시">04시</option>
								<option value="05시">05시</option>
								<option value="06시">06시</option>
								<option value="07시">07시</option>
								<option value="08시">08시</option>
								<option value="09시">09시</option>
								<option value="10시">10시</option>
								<option value="11시">11시</option>
								<option value="12시">12시</option>
								<option value="13시">13시</option>
								<option value="14시">14시</option>
								<option value="15시">15시</option>
								<option value="16시">16시</option>
								<option value="17시">17시</option>
								<option value="18시">18시</option>
								<option value="19시">19시</option>
								<option value="20시">20시</option>
								<option value="21시">21시</option>
								<option value="22시">22시</option>
								<option value="23시">23시</option>
							</select>~
							<select class="select" name="closetime">
								<option value="00시 ">00시</option>
								<option value="01시">01시</option>
								<option value="02시">02시</option>
								<option value="03시">03시</option>
								<option value="04시">04시</option>
								<option value="05시">05시</option>
								<option value="06시">06시</option>
								<option value="07시">07시</option>
								<option value="08시">08시</option>
								<option value="09시">09시</option>
								<option value="10시">10시</option>
								<option value="11시">11시</option>
								<option value="12시">12시</option>
								<option value="13시">13시</option>
								<option value="14시">14시</option>
								<option value="15시">15시</option>
								<option value="16시">16시</option>
								<option value="17시">17시</option>
								<option value="18시">18시</option>
								<option value="19시">19시</option>
								<option value="20시">20시</option>
								<option value="21시">21시</option>
								<option value="22시">22시</option>
								<option value="23시">23시</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>배달가능지역</td>
						<td>
							<input class="textBox" type="text" name="areaTyping">
							<button class="btn" type="button" name="areaAddBtn">추가하기</button>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input class="textBox" type="text" name="deliveryArea" readonly value="${storeBean.deliveryArea }">
							<button class="btn" type="button" onclick="document.fr.deliveryArea.value = ''; areaFlag = false;">초기화</button>
						</td>
					</tr>
					<tr>
						<td>가게한마디</td>
						<td><textarea class="textArea" name="message">${storeBean.message }</textarea></td>
					</tr>
					<tr>
						<td>사업자등록번호</td>
						<td>
							<input class="textBox" type="text" name="regNo" value="${storeBean.regNo }">
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<br>
							<input class="btn" type="submit" value="수정하기">
						</th>
					</tr>
				</table>
				<input type="hidden" name="sido" id="sido" value="${storeBean.sido }">
			</form>
		</div>
	</div>	
</body>

<script>
	var category = "${storeBean.category}";
	var storeHours = "${storeBean.storeHours}";
	var areaFlag = true;
	
	storeHours = storeHours.replace(/ /g,"");
	
	console.log(storeHours);
	
	document.fr.category.value = category;
	
	var opentime = storeHours.substr(0, 3);
	var closetime = storeHours.substr(storeHours.length-3, storeHours.length);
	
	console.log(opentime);
	console.log(closetime);
	
	document.fr.opentime.value = opentime;
	document.fr.closetime.value = closetime;
	

	
	window.onload = function() {
		
		var areaAddBtn = document.fr.areaAddBtn;
		areaAddBtn.addEventListener("click", addDeliveryArea);
		
		var areaTyping = document.fr.areaTyping;
		areaTyping.addEventListener("keydown", function(event) {
			if(event.keyCode == 13) {
				addDeliveryArea();
				event.preventDefault();
			}
		});
	}
	
	function addDeliveryArea() {
		var current_value = document.fr.areaTyping.value;
		var deliveryArea = document.fr.deliveryArea.value;
		
		if(areaFlag == false) {
			document.fr.deliveryArea.value = current_value;
			areaFlag = true;
		} else {
			document.fr.deliveryArea.value = deliveryArea + "/" + current_value;
		}
		
		document.fr.areaTyping.value = "";
	}
	
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				//document.fr.sido.value = data.sido;
                
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
               document.getElementById("sido").value=data.sido;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>