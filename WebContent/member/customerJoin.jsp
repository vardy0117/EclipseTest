<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<style>
	#mainDiv {
		width: 1000px;
		min-height: 600px;
		border: 2px solid green;
		margin: 0 auto;
		margin-top: 50px;
		position: relative;
	}
	
	form#join label{width: 100px;
					float: left;
					margin: 5px 0}

	form#join input{margin: 5px 0; 
					border: 1px solid #999;
					background-color:#FCFDEA }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<script>
	window.onload = function(){
	    document.getElementById("sbtn").onclick = chkData;
	 }
	
	function chkData(){
		if(document.fr.emailId.value == ""){
			$("#emailChkMsg").text("email 이름을 입력하세요");
	    	document.fr.email.focus();
	    	return false;
	 	}		
		
		if(document.fr.password.value == ""){
			$("#passwordChkMsg").text("비밀번호를 입력하세요");
	    	document.fr.password.focus();
	    	return false;
	 	}
	 
	 	if(document.fr.password.value != document.fr.password2.value){
	 		$("#password2ChkMsg").text("비밀번호가 다릅니다.");
		   	document.fr.password2.focus();
		   	return false;
		}
	 	
	 	if(document.fr.nickname.value == ""){
	 		$("#nicknameChkMsg").text("별명을 입력하세요");
	    	document.fr.nickname.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.phone.value == ""){
	 		$("#phoneChkMsg").text("연락처를 입력하세요");
	    	document.fr.phone.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.roadAddress.value == ""){
	 		$("#roadAddressChkMsg").text("주소를 입력하세요");
	    	document.fr.roadAddress.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.detailAddress.value == ""){
	 		$("#detailAddressChkMsg").text("상세주소를 입력하세요");
	    	document.fr.detailAddress.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.bname.value == ""){
	 		$("#bnameChkMsg").text("배달희망지역을 입력하세요");
	    	document.fr.bname.focus();
	    	return false;
	 	}	 	
	}
	  
	function checkID(){
		if($("#emailId").val()!="" && $("#emailServer").val()!=""){
			var email = $("#emailId").val()+"@"+$("#emailServer").val();
			$.ajax({
				type : "post",
				async : false,
				url : "./JoinCheck.do?check=emailCk",
				data : {email:email},
				dataType : "text",
				success : function(result,textStatus){
					if(result == "useable"){
						$("#sbtn").prop("disabled", false);
						$("#sbtn").css("background-color", "#4CAF50");
						$("#ebtn").css("background-color", "#B0F6AC");
						$("#emailChkMsg").text("사용 가능한 계정입니다!");
						return;
						return;
					} else {
						$("#sbtn").prop("disabled", true);
						$("#sbtn").css("background-color", "#aaaaaa");
						$("#ebtn").css("background-color", "#FFCECE");
						$("#emailChkMsg").text("이미 가입된 계정입니다!");
						return;
					}
				}, 
				error:function(data,textStatus){
					console.log(data);
					alert("에러가 발생했슈");
				}
			}); // $ajax()
		} // if
	} // function
	
	function checkPhone(){
		if($("#phone").val().length>=7){
			var phone = $("#phoneFront").val()+$("#phone").val();
				$.ajax({
				type : "post",
				async : false,
				url : "./JoinCheck.do?check=phoneCk",
				data : {phone:phone},
				dataType : "text",
				success : function(result,textStatus){
					if(result == "useable"){
						$("#sbtn").prop("disabled", false);
						$("#sbtn").css("background-color", "#4CAF50");
						$("#pbtn").css("background-color", "#B0F6AC");
						$("#phoneChkMsg").text("사용 가능한 연락처입니다!");
						return;
					} else {
						$("#sbtn").prop("disabled", true);
						$("#sbtn").css("background-color", "#aaaaaa");
						$("#pbtn").css("background-color", "#FFCECE");
						$("#phoneChkMsg").text("이미 존재하는 연락처입니다!");
						return;
					}
				}, 
				error:function(data,textStatus){
					console.log(data);
					alert("에러가 발생했슈");
				}
			}); // $ajax()
		} else if ($("#phone").val().length<7) {
			$("#sbtn").prop("disabled", true);
			$("#sbtn").css("background-color", "#aaaaaa");
			$("#pbtn").css("background-color", "#FFCECE");
			$("#phoneChkMsg").text("7자리이상 입력하세요")
		} // if-else
	} // function
	  
	$(function (){
		$("#rbtn").click(function(){
			$("#email").removeAttr("disabled");
			$("#email").removeAttr("readOnly");
			$("#phone").removeAttr("disabled");
			$("#phone").removeAttr("readOnly");
			$("#ebtn").val("계정 중복 확인");
			$("#pbtn").val("연락처 중복 확인");
		})
	});	

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

	<article id="mainDiv"> 
		<h1>일반 회원 가입</h1>
		<form action="./CustomerJoinAction.do" id="join" method="post" name="fr">
			<fieldset>
				<label>E-mail</label>
					<input type="text" id="emailId" name="emailId" class="email" size="10" placeholder="E-mail 이름" oninput="checkID()" style="text-align:right;">
					<a id=emailAt>@</a>
					<input type="text" id="emailServer" name="emailServer" class="email" size="15" placeholder="E-mail 주소" oninput="checkID()">
					<a id=emailChkMsg></a>
				<hr>
				<label>비밀번호</label>
					<input type="password" id="password" name="password" class="password" value="" size="30">
					<a id=passwordChkMsg></a>
				<hr>
				<label>비밀번호 확인</label>
					<input type="password" id="password2" name="password2" class="password2" size="30" >
					<a id=password2ChkMsg></a>
				<hr>
				<label>별명</label>
					<input type="text" id="nickname" name="nickname" size="30">
					<a id=nicknameChkMsg></a>
				<hr>	
				<label>연락처</label>	
					<select id="phoneFront" name="phoneFront"> 
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
						<input type="text" id="phone" name="phone" class="phone" placeholder="숫자만 입력하세요 ex)45458282" oninput="checkPhone()" size="30" numberOnly>
						<span id=phoneChkMsg></span>	
				<hr>
				<label>주소</label>	
				<table>
					<tr>		
						<td>
							<input type="text" id="roadAddress" name="roadAddress" class="roadAddress" size="50" placeholder="주소검색" onclick="execDaumPostcode()" readOnly> 
							<a id=roadAddressChkMsg></a>
						</td>
					</tr>
					<tr>
						<td>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress"  name="detailAddress" class="detailAddress" size="50" placeholder="상세 주소 입력">
							<a id=detailAddressChkMsg></a>
						</td>
					</tr>
				</table>
				<hr>
				<label>배달 희망 지역</label> 
				<input type="text" id="bname" name="bname" class="bname" size="30" placeholder="배달희망지역 ex) 장전동">
				<a id=bnameChkMsg></a> <br>
				<hr>
				<label>약관 및 동의</label>
				<!-- 
				<input type="checkbox"  id="#" name="#" class="#" value="전체 동의">
				<hr>
				<input type="checkbox"  id="#" name="#" class="#" value="이용약관동의(필수)" checked> <br>
				내용~(자세히 누르면 볼 수 있게... db에 넣어두면...?)
				<input type="checkbox"  id="#" name="#" class="#" value="개인 정보 수집 및 이용 동의(필수)" checked> <br> 
				내용~(자세히 누르면 볼 수 있게)				<input type="checkbox"  id="#" name="#" class="#" value="전자금융거래 이용약관 동의(필수)" checked> <br> 
				내용~(자세히 누르면 볼 수 있게)
				<input type="checkbox"  id="#" name="#" class="#" value="만 14세  이상 이용자 동의(필수)" checked> <br> 
				-->
				혜택 알림 동의 (선택) <input type="checkbox"  id="agreeAD" name="agreeAD" class="agree" value="T">
				</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" id="sbtn" value="회원가입" class="submit" disabled="disabled">
				<input type="reset" id="rbtn" value="다시입력" class="cancel">
			</div>
		</form>
	</article>
	<div class="clear"></div>
	
</body>
<script>
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
</script>

</html>