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
			$("#emailChkMsg").text("email �̸��� �Է��� �ּ���");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailId.focus();
	    	return false;
	 	}		

		if(document.fr.emailServer.value == ""){
			$("#emailChkMsg").text("email �ּҸ� ������ �ּ���");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailServer.focus();
	    	return false;
	 	}
		
		var reg_email = /^([0-9a-zA-Z_\.-]+)$/;
	    if(!reg_email.test(document.fr.emailId.value)) {
	    	$("#emailChkMsg").text("�ùٸ� email ������ �ƴմϴ�.1");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailId.focus();
			return false;         
		}
	    reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    if(!reg_email.test(document.fr.emailServer.value)) {
	    	$("#emailChkMsg").text("�ùٸ� email ������ �ƴմϴ�.2");
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
			console.log("��й�ȣ��ȿ��");
			$("#passwordChkMsg").text("6~12�ڸ� �̳��� ��ȣ�� �Է����ּ���.");
			$("#passwordChkMsg").css("color", "red");
			document.fr.password.focus();
			return false;
		}
		
		if($("#password2ChkMsg").text()!=pwChkSuccessMsg){
			document.fr.password.focus();
			return false;
		}	
			
		if(document.fr.nickname.value == ""){
			$("#nicknameChkMsg").text("�г����� �Է��� �ּ���");
			$("#nicknameChkMsg").css("color","red");
		   	document.fr.nickname.focus();
		   	return false;
		}
		 	
		if(document.fr.phone.value == ""){
			$("#phoneChkMsg").text("����ó�� �Է��� �ּ���");
			$("#phoneChkMsg").css("color","red");
		   	document.fr.phone.focus();
		   	return false;
		}
		 	
		 if(document.fr.roadAddress.value == ""){
		 	$("#roadAddressChkMsg").text("�ּҸ� �Է����ּ���");
		 	$("#roadAddressChkMsg").css("color","red");
		   	document.fr.roadAddress.focus();
		   	return false;
		 }
		 	
		 if(document.fr.detailAddress.value == ""){
		 	$("#detailAddressChkMsg").text('���ּҸ� �Է��ϼ��� ���� �� \"����\"�̶�� �Է����ּ���');
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

	var usableMsg="��� ������ �����Դϴ�!";
	var notuseableMsg="�̹� ���Ե� �����Դϴ�!";
	
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
					alert("������ �߻��߽�");
				}
			}); // $ajax()
		} // if
	} // function

 	/* function readyEmailCheck(){
		$("#emailChkMsg").html("<img src='./images/loading.gif' width='20' height='20' stye='display: block; margin: 0px auto;'>")
	}  */
		
	var pwChkSuccessMsg="��� ��ȣ Ȯ�� �Ϸ�!";
	
	function passwordCheck(){
		if(document.fr.password.value ==""){
			$("#passwordChkMsg").text("��й�ȣ�� �Է����ּ���!");
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
				console.log("��й�ȣ��ȿ��");
				$("#passwordChkMsg").text("���� �� ���ڸ� �����ϴ� 8�ڸ� �̻� �Է�!");
				$("#passwordChkMsg").css("color", "red");
				return false;
			}
			$("#passwordChkMsg").text("");
			if(document.fr.password2.value ==""){
				$("#password2ChkMsg").text("��й�ȣ�� �� �� �� �Է����ּ���!");
				$("#password2ChkMsg").css("color", "red");
			} else if(document.fr.password.value != document.fr.password2.value){
		 		$("#password2ChkMsg").text("��й�ȣ�� �ٸ��ϴ�.");
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
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����
                var bname = data.bname;
                
                
                //var cutaddress2 =  address.substring(0,3);
                //alert("�ڸ� �ּ�2  : " +cutaddress2);
                
                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('roadAddress').value = roadAddr;
                document.getElementById('bname').value = bname;
                document.fr.sido.value = data.sido;
            
            }
        }).open();
    } 
    
</script>

	<div id="mainDiv"> 
		<div id="formDiv">
			<h1 style="text-align: center;">�Ϲ� ȸ�� ����</h1>
			<form action="./CustomerJoinAction.do" id="join" method="post" name="fr">
				<table>
					<tr>
						<td class="td_left">�̸���</td>
						<td class="td_right">
							<input class="textBox" type="text" id="emailId" name="emailId" size="10" placeholder="�̸��� �ּ�"> @
							<input class="textBox" type="text" id="emailServer"  name="emailServer" onfocusout="emailCheck()"/>
							<select id="emailServerSelBox" name="emailServerSelBox" onchange="emailAddress_Change()" onfocusout="emailCheck()"> 
								<option value="">���� �Է�</option>
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="td_left"></td>
						<td class="td_right"><span id=emailChkMsg>��</span></td>
					</tr>
					<tr>
						<td class="td_left">��й�ȣ</td>
						<td class="td_right">
							<input class="textBox" type="password" id="password" name="password" onfocusout="passwordCheck()">
							<span id=passwordChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">��й�ȣ Ȯ��</td>
						<td class="td_right">
							<input class="textBox" type="password" id="password2" name="password2" class="password2" onfocusout="passwordCheck()">
							<span id=password2ChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">�г���</td>
						<td class="td_right">
							<input class="textBox" type="text" id="nickname" name="nickname" onfocusout="if(this.value!=''){document.getElementById('nicknameChkMsg').innerText='';}">
							<span id=nicknameChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">����ó</td>
						<td class="td_right">
							<select id="phoneFront" name="phoneFront"> 
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<input class="textBox" type="text" id="phone" name="phone" placeholder="���ڸ� �Է��ϼ���." numberOnly>
							<span id=phoneChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">�ּ�</td>
						<td class="td_right">
							<input class="textBox" type="text" id="roadAddress" name="roadAddress" size="50" placeholder="Ŭ���Ͽ� �ּҰ˻�" onclick="execDaumPostcode()" readOnly> 
							<span id=roadAddressChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left"></td>
						<td class="td_right">
							<span id="guide" style="color:#999;display:none"></span>
							<input class="textBox" type="text" id="detailAddress"  name="detailAddress" size="50" placeholder="�� �ּ� �Է�">
							<br><span id=detailAddressChkMsg></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="checkbox"  id="agreeAD" name="agreeAD" class="agree" value="T"> �̸��Ϸ� ���� ���� ����
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<br>
							<input class="btn" type="submit" id="sbtn" value="ȸ������" class="submit">
							<input class="btn" type="reset" id="rbtn" value="�ٽ��Է�" class="cancel">
						</td>
					</tr>
					
				</table>
				<input type="hidden" id="bname" name="bname" class="bname" size="30" placeholder="���������� ex) ������">
				<input type="hidden" name="sido"> <!-- ��, �� -->
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