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
   
   	#tapMenu > li {
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




$(document).ready(function(){


		$.ajax({
				type : "get",
				async : true,
						url : "./admindelverylist.do",

				success : function(data, textStatus) {
					
			
					var tag = "";
					
					 var obj = JSON.parse(data);
					console.log(data);
					console.log(obj + " = obj 결과");
					// alert("가져옴");
					console.log("obj.length 길이 : " + obj.delivengerslist.length);

					  	   for (var i = 0; i <obj.delivengerslist.length; i++) {  
							tag += '<tr id="deliveryInfo">'
							tag += '<th>' + obj.delivengerslist[i]["delivengersNo"] +'</th>'	
						
						 }  
					  
						
						$("#deliveryList").append(tag);
		
			
		
					
				      
				},
				error : function(data, textStatus) {
					alert("Ajax 통신 Error : " + textStatus);
					
				}

			
				

			});//ajax 끝 */
		

	
});
	
</script>

<body>





	<div id="mainDiv">

	<br>
		<table id="deliveryList" border="1">

			<tr>
			
				<th>배달사원 번호</th>
			<!-- 	<th>주문 시간</th>
				<th>배달 확인</th> -->
			</tr>

	

			
		</table>



	</div>

</body>
</html>