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
			$("#emailChkMsg").text("email �̸��� �Է��ϼ���");
	    	document.fr.email.focus();
	    	return false;
	 	}		
		
		if(document.fr.password.value == ""){
			$("#passwordChkMsg").text("��й�ȣ�� �Է��ϼ���");
	    	document.fr.password.focus();
	    	return false;
	 	}
	 
	 	if(document.fr.password.value != document.fr.password2.value){
	 		$("#password2ChkMsg").text("��й�ȣ�� �ٸ��ϴ�.");
		   	document.fr.password2.focus();
		   	return false;
		}
	 	
	 	if(document.fr.nickname.value == ""){
	 		$("#nicknameChkMsg").text("������ �Է��ϼ���");
	    	document.fr.nickname.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.phone.value == ""){
	 		$("#phoneChkMsg").text("����ó�� �Է��ϼ���");
	    	document.fr.phone.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.roadAddress.value == ""){
	 		$("#roadAddressChkMsg").text("�ּҸ� �Է��ϼ���");
	    	document.fr.roadAddress.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.detailAddress.value == ""){
	 		$("#detailAddressChkMsg").text("���ּҸ� �Է��ϼ���");
	    	document.fr.detailAddress.focus();
	    	return false;
	 	}
	 	
	 	if(document.fr.bname.value == ""){
	 		$("#bnameChkMsg").text("������������ �Է��ϼ���");
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
						$("#emailChkMsg").text("��� ������ �����Դϴ�!");
						return;
						return;
					} else {
						$("#sbtn").prop("disabled", true);
						$("#sbtn").css("background-color", "#aaaaaa");
						$("#ebtn").css("background-color", "#FFCECE");
						$("#emailChkMsg").text("�̹� ���Ե� �����Դϴ�!");
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
						$("#phoneChkMsg").text("��� ������ ����ó�Դϴ�!");
						return;
					} else {
						$("#sbtn").prop("disabled", true);
						$("#sbtn").css("background-color", "#aaaaaa");
						$("#pbtn").css("background-color", "#FFCECE");
						$("#phoneChkMsg").text("�̹� �����ϴ� ����ó�Դϴ�!");
						return;
					}
				}, 
				error:function(data,textStatus){
					console.log(data);
					alert("������ �߻��߽�");
				}
			}); // $ajax()
		} else if ($("#phone").val().length<7) {
			$("#sbtn").prop("disabled", true);
			$("#sbtn").css("background-color", "#aaaaaa");
			$("#pbtn").css("background-color", "#FFCECE");
			$("#phoneChkMsg").text("7�ڸ��̻� �Է��ϼ���")
		} // if-else
	} // function
	  
	$(function (){
		$("#rbtn").click(function(){
			$("#email").removeAttr("disabled");
			$("#email").removeAttr("readOnly");
			$("#phone").removeAttr("disabled");
			$("#phone").removeAttr("readOnly");
			$("#ebtn").val("���� �ߺ� Ȯ��");
			$("#pbtn").val("����ó �ߺ� Ȯ��");
		})
	});	

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

	<article id="mainDiv"> 
		<h1>�Ϲ� ȸ�� ����</h1>
		<form action="./CustomerJoinAction.do" id="join" method="post" name="fr">
			<fieldset>
				<label>E-mail</label>
					<input type="text" id="emailId" name="emailId" class="email" size="10" placeholder="E-mail �̸�" oninput="checkID()" style="text-align:right;">
					<a id=emailAt>@</a>
					<input type="text" id="emailServer" name="emailServer" class="email" size="15" placeholder="E-mail �ּ�" oninput="checkID()">
					<a id=emailChkMsg></a>
				<hr>
				<label>��й�ȣ</label>
					<input type="password" id="password" name="password" class="password" value="" size="30">
					<a id=passwordChkMsg></a>
				<hr>
				<label>��й�ȣ Ȯ��</label>
					<input type="password" id="password2" name="password2" class="password2" size="30" >
					<a id=password2ChkMsg></a>
				<hr>
				<label>����</label>
					<input type="text" id="nickname" name="nickname" size="30">
					<a id=nicknameChkMsg></a>
				<hr>	
				<label>����ó</label>	
					<select id="phoneFront" name="phoneFront"> 
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select>
						<input type="text" id="phone" name="phone" class="phone" placeholder="���ڸ� �Է��ϼ��� ex)45458282" oninput="checkPhone()" size="30" numberOnly>
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
				<hr>
				<label>��� ��� ����</label> 
				<input type="text" id="bname" name="bname" class="bname" size="30" placeholder="���������� ex) ������">
				<a id=bnameChkMsg></a> <br>
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
				<input type="submit" id="sbtn" value="ȸ������" class="submit" disabled="disabled">
				<input type="reset" id="rbtn" value="�ٽ��Է�" class="cancel">
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