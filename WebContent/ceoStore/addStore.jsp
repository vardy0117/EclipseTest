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
		position: relative;
		padding: 50px;
	}
	
	#formDiv {
		width: 650px;
	    height: 600px;
	    margin: 0 auto;
	    border: 2px solid #c7c7c7;
	    border-radius: 15px;
	    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24); 
	}
	
	#formDiv table {
		width: 560px;
		margin: 0 auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	var areaFlag = false;
	
	window.onload = function() {
		var phone0 = document.fr.phone0;
		phone0.addEventListener("change", phone0Change);
		
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
	
	function phone0Change() {
		document.fr.phone1.value = document.fr.phone0.value;
		document.fr.phone1.readOnly = true;
		
		if(document.fr.phone0.value == "직접입력") {
			document.fr.phone1.value = "";
			document.fr.phone1.readOnly = false;
		}
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
	
	function addMenuFnc() {
		$("#btn_tr").remove();
		document.getElementById("menuCnt").value = parseInt(document.getElementById("menuCnt").value) + 1;
		var cnt = document.getElementById("menuCnt").value; 
		
		var elements = '<tr><td></td><td>　</td></tr><tr><td>메뉴사진</td><td><input type="file" name="menu_image' + cnt + '"></td></tr>' + 
						'<tr><td>카테고리</td><td><select name="menu_category' + cnt + '"><option value="세트 메뉴">세트 메뉴</option><option value="주 메뉴">주 메뉴</option><option value="사이드 메뉴">사이드 메뉴</option><option value="음료/주류">음료/주류</option></select></td></tr>' + 
						'<tr><td>메뉴이름</td><td><input type="text" name="menu_name' + cnt + '"></td></tr>' + 
						'<tr><td>가격</td><td><input type="text" name="menu_price' + cnt + '">원</td></tr>' + 
						'<tr id="btn_tr"><th colspan="2"><button type="button" onclick="addMenuFnc()">메뉴 추가하기</button></th></tr>';
		
		
		$("#menuTable").append(elements);
	}

</script>
</head>
<body>
	<div id="mainDiv">
		
		<div id="formDiv">
			<h1 style="text-align:center;">업체 등록</h1>
			<form action="insertStoreAction.do"  method="post" enctype="multipart/form-data" name="fr">
				<table>
					<tr>
						<td>가게명</td>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<td>대표이미지</td>
						<td>
							<input type="file" name="image"> 
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="hidden" id="sample6_postcode" placeholder="우편번호">
							<input type="text" id="sample6_address" placeholder="주소" name="roadAddress">
							<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" >
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
						</td>
					</tr>
					<tr>
						<td>카테고리 </td>
						<td>
							<select name="category" >
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
							</select>	  
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<select name="phone0">
								<option value="직접입력">직접입력</option>
								<option value="02">02</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
							</select>	  
							<input type="text" name="phone1">
							<input type="text" name="phone2">
						
						</td>
						
					</tr>
					<tr>
						<td>영업시간</td>
						<td>
							<select name="opentime">
								<option value="00시 ">00시</option>
								<option value="01시 ">01시</option>
								<option value="02시 ">02시</option>
								<option value="03시 ">03시</option>
								<option value="04시 ">04시</option>
								<option value="05시 ">05시</option>
								<option value="06시 ">06시</option>
								<option value="07시 ">07시</option>
								<option value="08시 ">08시</option>
								<option value="09시 ">09시</option>
								<option value="10시 ">10시</option>
								<option value="11시 ">11시</option>
								<option value="12시 ">12시</option>
								<option value="13시 ">13시</option>
								<option value="14시 ">14시</option>
								<option value="15시 ">15시</option>
								<option value="16시 ">16시</option>
								<option value="17시 ">17시</option>
								<option value="18시 ">18시</option>
								<option value="19시 ">19시</option>
								<option value="20시 ">20시</option>
								<option value="21시 ">21시</option>
								<option value="22시 ">22시</option>
								<option value="23시 ">23시</option>
							</select>~
							<select name="closetime">
								<option value="00시 ">00시</option>
								<option value="01시 ">01시</option>
								<option value="02시 ">02시</option>
								<option value="03시 ">03시</option>
								<option value="04시 ">04시</option>
								<option value="05시 ">05시</option>
								<option value="06시 ">06시</option>
								<option value="07시 ">07시</option>
								<option value="08시 ">08시</option>
								<option value="09시 ">09시</option>
								<option value="10시 ">10시</option>
								<option value="11시 ">11시</option>
								<option value="12시 ">12시</option>
								<option value="13시 ">13시</option>
								<option value="14시 ">14시</option>
								<option value="15시 ">15시</option>
								<option value="16시 ">16시</option>
								<option value="17시 ">17시</option>
								<option value="18시 ">18시</option>
								<option value="19시 ">19시</option>
								<option value="20시 ">20시</option>
								<option value="21시 ">21시</option>
								<option value="22시 ">22시</option>
								<option value="23시 ">23시</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>배달가능지역</td>
						<td>
							<input type="text" name="areaTyping">
							<button type="button" name="areaAddBtn">추가하기</button>
							<input type="text" name="deliveryArea" readonly>
						</td>
					</tr>
					<tr>
						<td>가게한마디</td>
						<td><textarea name="message"></textarea></td>
					</tr>
					<tr>
						<td>사업자등록번호</td>
						<td>
							<input type="text" name="regNo">
						</td>
					</tr>
				</table>
				<hr>
				<table id="menuTable">
					<tr>
						<th colspan=2">메뉴 추가하기<br>　</th>
						<input type="hidden" value="1" id="menuCnt" name="menuCnt">
					</tr>
					
					
					<tr>
						<td>메뉴사진</td>
						<td><input type="file" name="menu_image1"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select name="menu_category1">
								<option value="세트 메뉴">세트 메뉴</option>
								<option value="주 메뉴">주 메뉴</option>
								<option value="사이드 메뉴">사이드 메뉴</option>
								<option value="음료/주류">음료/주류</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>메뉴이름</td>
						<td>
							<input type="text" name="menu_name1">
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
							<input type="text" name="menu_price1">원
						</td>
					</tr>
					<tr id="btn_tr">
						<th colspan="2">
							<button type="button" onclick="addMenuFnc()">메뉴 추가하기</button>
						</th>
					</tr>
				</table>
					
					<input type="hidden" name="sido"  id="sido">  
				    
					<input type="submit" value="가게등록하기">
			</form>
		</div>
	</div>
</body>

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
