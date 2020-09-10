<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어드민 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
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


 table {
    margin: 10px auto;
    border: 2px solid #c7c7c7;
    border-radius: 15px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    padding: 20px;
    
   }
   
   	#tapMenu ul > li {
		float: left;
		width: 30%;
		height: 50px;
    	line-height: 50px;
		border: 1px solid #d9d9d9;
		text-align: center;
		cursor: pointer;
		list-style:none;
	}
	 
	 * {margin:0; padding:0;}
#tapMenu li a {
display: block;
text-decoration:none;
text-align:center; 
}
tap {
float:left; list-style:none; margin:1px;
width:50px;

}




li:hover {	
background: linear-gradient( to right, hsl(98 100% 62%), hsl(204 100% 59%) );
text-decoration:none;
}



table {
    margin: 66px auto;

}

    
</style>



<script type="text/javascript">


	$(function() {
		// tab operation
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('li').css('background-color', 'white');
			$(this).css('background-color', 'white');
			$.ajax({
				type : 'GET',                 //get방식으로 통신
				url : activeTab + ".jsp",    //탭의 data-tab속성의 값으로 된 html파일로 통신
				dataType : "html",            //html형식으로 값 읽기
				error : function() {          //통신 실패시
					alert('통신실패!');
				},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();          
	});
	
	$(document).ready(function(){

		   var link = document.location.href;  //현재 접속 url  

		   var tab = link.split('/').pop();   //배열의 맨 마지막 요소를 삭제하고 삭제된 해당 값을 반환함

		   $('a[href$='+tab+']').trigger("click"); //해당 앵커 트리거를이용 클릭 이벤트

		});
	
</script>

<body>


	<div id="mainDiv">
	
	
	

	<br>
			
	<div id="tapMenu">
	<font size="5">조회용도</font>
		<ul class="tab">
			<li data-tab="admin/admin_deliverylist" class='tabmenu' id="default"><a href="#">배달원조회</a></li>
			<li data-tab="admin/admin_storelist" class='tabmenu'><a href="#">스토어 & Ceo 조회</a></li>
			<li data-tab="admin/admin_customerlist" class='tabmenu'><a href="#">회원조회</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>



	

	<br>
		


	</div>

</body>
</html>