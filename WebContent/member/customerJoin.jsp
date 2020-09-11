<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link href="./css/subpage.css" rel="stylesheet" type="text/css"> -->
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
		width: 800px;
		height: 550px;
		margin: 0 auto;
		border: 2px solid #c7c7c7;
		border-radius: 15px;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	
	form > table {
		font-size: 1rem;
		margin: 0 auto;
	}
	
	.td_left {
		text-align: right;
	}
	
	.textBox {
		width: 150px;
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
	select:focus { outline: none; }
	#roadAddress, #detailAddress {
		width: 256px;
	}
	.td_right {
		padding-left: 15px;
	}
	.btn {
		width: 25px;
		background: #19ce60;
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
	select {
		border-radius: 12px;
	    width: 100px;
	    height: 37px;
	    border: 2px solid gray;
	    font-family: Binggrae-Bold;
	}
	#phoneFront {
		test-align-last: center;
		width: 55px;
	}
	#agreeAD {
		cursor: pointer;
	}
					
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script src="/Delivengers/js/member/join.js"></script> -->
</head>
<body>
<script>
	window.onload = function(){
	    document.getElementById("sbtn").onclick = checkData;
	}
	
	function checkData(){
		if(document.fr.emailId.value == ""){
			$("#emailChkMsg").text("email 이름을 입력해 주세요");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailId.focus();
	    	return false;
	 	}		

		if(document.fr.emailServer.value == ""){
			$("#emailChkMsg").text("email 주소를 선택해 주세요");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailServer.focus();
	    	return false;
	 	}
		
		var reg_email = /^([0-9a-zA-Z_\.-]+)$/;
	    if(!reg_email.test(document.fr.emailId.value)) {
	    	$("#emailChkMsg").text("올바른 email 형식이 아닙니다.1");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailId.focus();
			return false;         
		}
	    reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    if(!reg_email.test(document.fr.emailServer.value)) {
	    	$("#emailChkMsg").text("올바른 email 형식이 아닙니다.2");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailServer.focus();
			return false;         
		}
		
		if($("#emailChkMsg").text() != usableMsg){
			document.fr.emailId.focus();
			return false;
		}
		var reg_pw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		if(!reg_pw.test(document.fr.password.value)) {
			console.log("비밀번호유효성");
			$("#passwordChkMsg").text("6~12자리 이내의 암호를 입력해주세요.");
			$("#passwordChkMsg").css("color", "red");
			document.fr.password.focus();
			return false;
		}
		
		if($("#password2ChkMsg").text()!=pwChkSuccessMsg){
			document.fr.password.focus();
			return false;
		}	
			
		if(document.fr.nickname.value == ""){
			$("#nicknameChkMsg").text("닉네임을 입력해 주세요");
			$("#nicknameChkMsg").css("color","red");
		   	document.fr.nickname.focus();
		   	return false;
		}
		 	
		if(document.fr.phone.value == ""){
			$("#phoneChkMsg").text("연락처를 입력해 주세요");
			$("#phoneChkMsg").css("color","red");
		   	document.fr.phone.focus();
		   	return false;
		}
		 	
		 if(document.fr.roadAddress.value == ""){
		 	$("#roadAddressChkMsg").text("주소를 입력해주세요");
		 	$("#roadAddressChkMsg").css("color","red");
		   	document.fr.roadAddress.focus();
		   	return false;
		 }
		 	
		 if(document.fr.detailAddress.value == ""){
		 	$("#detailAddressChkMsg").text('상세주소를 입력하세요 없을 시 \"없음\"이라고 입력해주세요');
		 	$("#detailAddressChkMsg").css("color","red");
		   	document.fr.detailAddress.focus();
		   	return false;
		 }

 	}
	
	function emailAddress_Change() {
		var emailAddress = document.fr.emailServerSelBox.value;
		document.fr.emailServer.value = emailAddress;
		if (emailAddress != "" || emailAddress == "select") {
			document.fr.emailServer.setAttribute("readonly", "readonly");
		} else {
			document.fr.emailServer.removeAttribute("readonly");
		}
	}

	var usableMsg="사용 가능한 계정입니다!";
	var notuseableMsg="이미 가입된 계정입니다!";
	
	function emailCheck(){
		//readyEmailCheck();
		if($("#emailId").val()!="" && $("#emailServer").val()!=""){
		
			var email = $("#emailId").val()+"@"+$("#emailServer").val();
		
			$.ajax({
				type : "post",
				async : false,
				url : "./CustomerJoinCheck.do",
				data : {email:email},
				dataType : "text",
				success : function(result,textStatus){
					if(result == "useable"){
						$("#emailChkMsg").text(usableMsg);
						$("#emailChkMsg").css("color", "green");
						return;
					} else {
						$("#emailChkMsg").text(notuseableMsg);
						$("#emailChkMsg").css("color", "red");
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

 	/* function readyEmailCheck(){
		$("#emailChkMsg").html("<img src='./images/loading.gif' width='20' height='20' stye='display: block; margin: 0px auto;'>")
	}  */
		
	var pwChkSuccessMsg="비밀 번호 확인 완료!";
	
	function passwordCheck(){
		if(document.fr.password.value ==""){
			$("#passwordChkMsg").text("비밀번호를 입력해주세요!");
			$("#passwordChkMsg").css("color", "red");
			if(document.fr.password2.value ==""){
				$("#password2ChkMsg").text("");
			} else {
				$("#password2ChkMsg").text("");
			}
			
		   	return false;
		   	
		} else if(document.fr.password.value !=""){
			var reg_pw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			if(!reg_pw.test(document.fr.password.value)) {
				console.log("비밀번호유효성");
				$("#passwordChkMsg").text("문자 및 숫자를 포함하는 8자리 이상 입력!");
				$("#passwordChkMsg").css("color", "red");
				return false;
			}
			$("#passwordChkMsg").text("");
			if(document.fr.password2.value ==""){
				$("#password2ChkMsg").text("비밀번호를 한 번 더 입력해주세요!");
				$("#password2ChkMsg").css("color", "red");
			} else if(document.fr.password.value != document.fr.password2.value){
		 		$("#password2ChkMsg").text("비밀번호가 다릅니다.");
		 		$("#password2ChkMsg").css("color", "red");
			} else if (document.fr.password.value == document.fr.password2.value) {
				$("#password2ChkMsg").text(pwChkSuccessMsg);
				$("#password2ChkMsg").css("color", "green");
			}
		
			return false;
		}
	} 
	
	
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                var bname = data.bname;
                
                
                //var cutaddress2 =  address.substring(0,3);
                //alert("자른 주소2  : " +cutaddress2);
                
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
                document.fr.sido.value = data.sido;
            
            }
        }).open();
    } 
    
</script>

	<div id="mainDiv"> 
		<div id="formDiv">
			<h1 style="text-align: center;">일반 회원 가입</h1>
			<form action="./CustomerJoinAction.do" id="join" method="post" name="fr">
				<table>
					<tr>
						<td class="td_left">이메일</td>
						<td class="td_right">
							<input class="textBox" type="text" id="emailId" name="emailId" size="10" placeholder="이메일 주소"> @
							<input class="textBox" type="text" id="emailServer"  name="emailServer" onfocusout="emailCheck()"/>
							<select id="emailServerSelBox" name="emailServerSelBox" onchange="emailAddress_Change()" onfocusout="emailCheck()"> 
								<option value="">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td_left"></td>
						<td class="td_right"><span id=emailChkMsg>　</span></td>
					</tr>
					<tr>
						<td class="td_left">비밀번호</td>
						<td class="td_right">
							<input class="textBox" type="password" id="password" name="password" onfocusout="passwordCheck()">
							<span id=passwordChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">비밀번호 확인</td>
						<td class="td_right">
							<input class="textBox" type="password" id="password2" name="password2" class="password2" onfocusout="passwordCheck()">
							<span id=password2ChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">닉네임</td>
						<td class="td_right">
							<input class="textBox" type="text" id="nickname" name="nickname" onfocusout="if(this.value!=''){document.getElementById('nicknameChkMsg').innerText='';}">
							<span id=nicknameChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">연락처</td>
						<td class="td_right">
							<select id="phoneFront" name="phoneFront"> 
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<input class="textBox" type="text" id="phone" name="phone" placeholder="숫자만 입력하세요." numberOnly>
							<span id=phoneChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">주소</td>
						<td class="td_right">
							<input class="textBox" type="text" id="roadAddress" name="roadAddress" size="50" placeholder="클릭하여 주소검색" onclick="execDaumPostcode()" readOnly> 
							<span id=roadAddressChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left"></td>
						<td class="td_right">
							<span id="guide" style="color:#999;display:none"></span>
							<input class="textBox" type="text" id="detailAddress"  name="detailAddress" size="50" placeholder="상세 주소 입력">
							<br><span id=detailAddressChkMsg></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="checkbox"  id="agreeAD" name="agreeAD" class="agree" value="T"> 이메일로 광고 수신 여부
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<br>
							<input class="btn" type="submit" id="sbtn" value="회원가입" class="submit">
							<input class="btn" type="reset" id="rbtn" value="다시입력" class="cancel">
						</td>
					</tr>
					
				</table>
				<input type="hidden" id="bname" name="bname" class="bname" size="30" placeholder="배달희망지역 ex) 장전동">
				<input type="hidden" name="sido"> <!-- 시, 도 -->
			</form>
		</div>
	</div>
	<div class="clear"></div>
	
</body>
<script>
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
</script>

</html>