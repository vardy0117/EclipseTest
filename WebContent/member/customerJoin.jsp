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
		
	form#join span#emailChkMsg img{margin-left: 10px;
								  }	
  
	#join {
		width: 700px;
		margin: 10px auto;
	}
	#buttons {
		text-align: center;
	}
					
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Delivengers/js/member/join.js"></script>
</head>
<body>
<script>
	window.onload = function(){
	    document.getElementById("sbtn").onclick = checkData;
	}
	
	function checkData(){
		if(document.fr.emailId.value == ""){
			$("#emailChkMsg").text("email �̸��� �Է��� �ּ���");
	    	document.fr.emailId.focus();
	    	return false;
	 	}		

		if(document.fr.emailServer.value == ""){
			$("#emailChkMsg").text("email �ּҸ� ������ �ּ���");
	    	document.fr.emailId.focus();
	    	return false;
	 	}
		
		if($("#emailChkMsg").text() != usableMsg){
			document.fr.emailId.focus();
			return false;
		}
		
		if($("#password2ChkMsg").text()!=pwChkSuccessMsg){
			document.fr.password.focus();
			return false;
		}	
			
		if(document.fr.nickname.value == ""){
			$("#nicknameChkMsg").text("�г����� �Է��� �ּ���");
		   	document.fr.nickname.focus();
		   	return false;
		}
		 	
		if(document.fr.phone.value == ""){
			$("#phoneChkMsg").text("����ó�� �Է��� �ּ���");
		   	document.fr.phone.focus();
		   	return false;
		}
		 	
		 if(document.fr.roadAddress.value == ""){
		 	$("#roadAddressChkMsg").text("�ּҸ� �Է����ּ���");
		   	document.fr.roadAddress.focus();
		   	return false;
		 }
		 	
		 if(document.fr.detailAddress.value == ""){
		 	$("#detailAddressChkMsg").text('���ּҸ� �Է��ϼ��� ���� �� \"����\"�̶�� �Է����ּ���');
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

 	function readyEmailCheck(){
		$("#emailChkMsg").html("<img src='./images/loading.gif' width='20' height='20' stye='display: block; margin: 0px auto;'>")
	} 
		
	var pwChkSuccessMsg="��� ��ȣ Ȯ�� �Ϸ�!";
	
	function passwordCheck(){
		if(document.fr.password.value ==""){
			$("#passwordChkMsg").text("��й�ȣ�� �Է����ּ���!");
			if(document.fr.password2.value ==""){
				$("#password2ChkMsg").text("");
			} else {
				$("#password2ChkMsg").text("");
			}
			
		   	return false;
		   	
		} else if(document.fr.password.value !=""){
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
                var bname = data.bname

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
            }
        }).open();
    } 
    
</script>

	<div id="mainDiv"> 
		<h1 style="text-align: center;">�Ϲ� ȸ�� ����</h1>
		<form action="./CustomerJoinAction.do" id="join" method="post" name="fr">
			<fieldset>
				<label>E-mail</label>
					<input type="text" id="emailId" name="emailId" class="email" size="10" placeholder="E-mail �̸�" style="text-align:right;">
					@
					<input type="text" id="emailServer" name="emailServer" class="textBox" style="width:100px;" onfocusout="emailCheck()"/>
						<select id="emailServerSelBox" name="emailServerSelBox" onchange="emailAddress_Change()" onfocus="readyEmailCheck()" onfocusout="emailCheck()"> 
							<option value="">���� �Է�</option>
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					<span id=emailChkMsg></span>
				<hr>
				<label>��й�ȣ</label>
					<input type="password" id="password" name="password" class="password" value="" size="30" onfocusout="passwordCheck()">
					<span id=passwordChkMsg></span>
				<hr>
				<label>��й�ȣ Ȯ��</label>
					<input type="password" id="password2" name="password2" class="password2" size="30" onfocusout="passwordCheck()">
					<span id=password2ChkMsg></span>
				<hr>
				<label>����</label>
					<input type="text" id="nickname" name="nickname" size="30">
					<span id=nicknameChkMsg></span>
				<hr>	
				<label>����ó</label>	
					<select id="phoneFront" name="phoneFront"> 
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
						<input type="text" id="phone" name="phone" class="phone" placeholder="���ڸ� �Է��ϼ��� ex)45458282" size="30" numberOnly>
						<span id=phoneChkMsg></span>	
				<hr>
				<label>�ּ�</label>	
				<table>
					<tr>		
						<td>
							<input type="text" id="roadAddress" name="roadAddress" class="roadAddress" size="50" placeholder="�ּҰ˻�" onclick="execDaumPostcode()" readOnly> 
							<a id=roadAddressChkMsg></a>
						</td>
					</tr>
					<tr>
						<td>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddress"  name="detailAddress" class="detailAddress" size="50" placeholder="�� �ּ� �Է�">
							<a id=detailAddressChkMsg></a>
						</td>
					</tr>
				</table>

				<input type="hidden" id="bname" name="bname" class="bname" size="30" placeholder="���������� ex) ������">
				<hr>
				<label>��� �� ����</label>
				<!-- 
				<input type="checkbox"  id="#" name="#" class="#" value="��ü ����">
				<hr>
				<input type="checkbox"  id="#" name="#" class="#" value="�̿�������(�ʼ�)" checked> <br>
				����~(�ڼ��� ������ �� �� �ְ�... db�� �־�θ�...?)
				<input type="checkbox"  id="#" name="#" class="#" value="���� ���� ���� �� �̿� ����(�ʼ�)" checked> <br> 
				����~(�ڼ��� ������ �� �� �ְ�)				<input type="checkbox"  id="#" name="#" class="#" value="���ڱ����ŷ� �̿��� ����(�ʼ�)" checked> <br> 
				����~(�ڼ��� ������ �� �� �ְ�)
				<input type="checkbox"  id="#" name="#" class="#" value="�� 14��  �̻� �̿��� ����(�ʼ�)" checked> <br> 
				-->
				���� �˸� ���� (����) <input type="checkbox"  id="agreeAD" name="agreeAD" class="agree" value="T">
				</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" id="sbtn" value="ȸ������" class="submit">
				<input type="reset" id="rbtn" value="�ٽ��Է�" class="cancel">
			</div>
		</form>
	</div>
	<div class="clear"></div>
	
</body>
<script>
	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
</script>

</html>