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
<script src="/Delivengers/js/member/join.js"></script>
</head>
<body>
<script>
	window.onload = function(){
	    document.getElementById("sbtn").onclick = checkData;
	}
	
	function checkData(){
		if(document.fr.emailId.value == ""){
			$("#emailChkMsg").text("email �대��� ���ν�� 二쇱�몄��");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailId.focus();
	    	return false;
	 	}		

		if(document.fr.emailServer.value == ""){
			$("#emailChkMsg").text("email 二쇱��瑜� ������ 二쇱�몄��");
			$("#emailChkMsg").css("color","red");
	    	document.fr.emailServer.focus();
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
			$("#nicknameChkMsg").text("���ㅼ���� ���ν�� 二쇱�몄��");
			$("#nicknameChkMsg").css("color","red");
		   	document.fr.nickname.focus();
		   	return false;
		}
		 	
		if(document.fr.phone.value == ""){
			$("#phoneChkMsg").text("�곕�쎌�瑜� ���ν�� 二쇱�몄��");
			$("#phoneChkMsg").css("color","red");
		   	document.fr.phone.focus();
		   	return false;
		}
		 	
		 if(document.fr.roadAddress.value == ""){
		 	$("#roadAddressChkMsg").text("二쇱��瑜� ���ν�댁＜�몄��");
		 	$("#roadAddressChkMsg").css("color","red");
		   	document.fr.roadAddress.focus();
		   	return false;
		 }
		 	
		 if(document.fr.detailAddress.value == ""){
		 	$("#detailAddressChkMsg").text('���몄＜��瑜� ���ν���몄�� ���� �� \"����\"�대�쇨� ���ν�댁＜�몄��');
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

	var usableMsg="�ъ�� 媛��ν�� 怨���������!";
	var notuseableMsg="�대�� 媛����� 怨���������!";
	
	function emailCheck(){
		readyEmailCheck();
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
					alert("���ш� 諛�������");
				}
			}); // $ajax()
		} // if
	} // function

 	function readyEmailCheck(){
		$("#emailChkMsg").html("<img src='./images/loading.gif' width='20' height='20' stye='display: block; margin: 0px auto;'>")
	} 
		
	var pwChkSuccessMsg="鍮�諛� 踰��� ���� ��猷�!";
	
	function passwordCheck(){
		if(document.fr.password.value ==""){
			$("#passwordChkMsg").text("鍮�諛�踰��몃�� ���ν�댁＜�몄��!");
			$("#passwordChkMsg").css("color", "red");
			if(document.fr.password2.value ==""){
				$("#password2ChkMsg").text("");
			} else {
				$("#password2ChkMsg").text("");
			}
			
		   	return false;
		   	
		} else if(document.fr.password.value !=""){
			$("#passwordChkMsg").text("");
			if(document.fr.password2.value ==""){
				$("#password2ChkMsg").text("鍮�諛�踰��몃�� �� 踰� �� ���ν�댁＜�몄��!");
				$("#password2ChkMsg").css("color", "red");
			} else if(document.fr.password.value != document.fr.password2.value){
		 		$("#password2ChkMsg").text("鍮�諛�踰��멸� �ㅻ�����.");
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
                // �������� 寃���寃곌낵 ��紐⑹�� �대┃������ �ㅽ���� 肄���瑜� ���깊���� 遺�遺�.

                // ��濡�紐� 二쇱���� �몄� 洹�移��� �곕�� 二쇱��瑜� ��������.
                // �대�ㅼ�ㅻ�� 蹂���媛� 媛��� ���� 寃쎌�곗�� 怨듬갚('')媛��� 媛�吏�誘�濡�, �대�� 李멸����� 遺�湲� ����.
                var roadAddr = data.roadAddress; // ��濡�紐� 二쇱�� 蹂���
                var extraRoadAddr = ''; // 李멸� ��紐� 蹂���
                var bname = data.bname;              
         
                //var cutaddress2 =  address.substring(0,3);
                //alert("��瑜� 二쇱��2  : " +cutaddress2);

               // 踰�����紐��� ���� 寃쎌�� 異�媛�����. (踰���由щ�� ����)
                // 踰������� 寃쎌�� 留�吏�留� 臾몄��媛� "��/濡�/媛�"濡� ������.
                if(data.bname !== '' && /[��|濡�|媛�]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.sigungu !== '' && /[��|濡�|媛�]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
 
                // 嫄대Ъ紐��� ��怨�, 怨듬��二쇳���� 寃쎌�� 異�媛�����.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ������ 李멸���紐⑹�� ���� 寃쎌��, 愿��멸�吏� 異�媛��� 理�醫� 臾몄���댁�� 留�����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �고�몃��몄�� 二쇱�� ��蹂대�� �대�� ������ �ｋ����.
                document.getElementById('roadAddress').value = roadAddr;
                document.getElementById('bname').value = bname;
                document.fr.sido.value = data.sido;
            
            }
        }).open();
    } 
    
</script>

	<div id="mainDiv"> 
		<div id="formDiv">
			<h1 style="text-align: center;">�쇰� ���� 媛���</h1>
			<form action="./CustomerJoinAction.do" id="join" method="post" name="fr">
				<table>
					<tr>
						<td class="td_left">�대���</td>
						<td class="td_right">
							<input class="textBox" type="text" name="emailId" size="10" placeholder="�대��� 二쇱��"> @
							<input class="textBox" type="text" name="emailServer" onfocusout="emailCheck()"/>
							<select id="emailServerSelBox" name="emailServerSelBox" onchange="emailAddress_Change()" onfocusout="emailCheck()"> 
								<option value="">吏��� ����</option>
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
						<td class="td_left">鍮�諛�踰���</td>
						<td class="td_right">
							<input class="textBox" type="password" id="password" name="password" onfocusout="passwordCheck()">
							<span id=passwordChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">鍮�諛�踰��� ����</td>
						<td class="td_right">
							<input class="textBox" type="password" id="password2" name="password2" class="password2" onfocusout="passwordCheck()">
							<span id=password2ChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">���ㅼ��</td>
						<td class="td_right">
							<input class="textBox" type="text" id="nickname" name="nickname" onfocusout="if(this.value!=''){document.getElementById('nicknameChkMsg').innerText='';}">
							<span id=nicknameChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">�곕�쎌�</td>
						<td class="td_right">
							<select id="phoneFront" name="phoneFront"> 
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							<input class="textBox" type="text" id="phone" name="phone" placeholder="�レ��留� ���ν���몄��." numberOnly>
							<span id=phoneChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left">二쇱��</td>
						<td class="td_right">
							<input class="textBox" type="text" id="roadAddress" name="roadAddress" size="50" placeholder="�대┃���� 二쇱��寃���" onclick="execDaumPostcode()" readOnly> 
							<span id=roadAddressChkMsg></span>
						</td>
					</tr>
					<tr>
						<td class="td_left"></td>
						<td class="td_right">
							<span id="guide" style="color:#999;display:none"></span>
							<input class="textBox" type="text" id="detailAddress"  name="detailAddress" size="50" placeholder="���� 二쇱�� ����">
							<br><span id=detailAddressChkMsg></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="checkbox"  id="agreeAD" name="agreeAD" class="agree" value="T"> �대��쇰� 愿�怨� ���� �щ�
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<br>
							<input class="btn" type="submit" id="sbtn" value="����媛���" class="submit">
							<input class="btn" type="reset" id="rbtn" value="�ㅼ������" class="cancel">
						</td>
					</tr>
					
				</table>
				<input type="hidden" id="bname" name="bname" class="bname" size="30" placeholder="諛곕�ы�щ�吏��� ex) �μ����">
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