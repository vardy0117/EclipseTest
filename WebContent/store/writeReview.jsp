<%@page import="net.customer.db.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<style>
	#mainDiv{
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 15px;
		padding-bottom: 15px;
	}
	#storeName{
		background-color: #E6E6E6;
		font-size: 2em;
		padding: 0.6em;
	}
	
	#contents{
		margin: 0px;
	    width: 568px;
	    height: 209px;
	    resize: none;
	}
	#pointsInfo{
		font-family: none;
	}
	.pointsClick i{
		font-size: 2.5em;
	}
	.points{
		color: lightgray;
		cursor: pointer;
	}
	.points.on{
		color: #ffa400;
	}
	#zeroPoints{
		border: 1px solid;
		font-size: 10px;
	}
	#zeroPoints:HOVER {
		cursor: pointer;
		color: white;
		background-color: black;
	}
	#evaluation{
		color: #BDBDBD;
	}
	input[type="submit"]{
		color: white;
		background-color: #19ce60;
		border: 1px solid #19ce60;
		font-size: 15px;
		font-weight: 800; 
		padding: 0.8em;
	}
	
	/* input="file" 숨기기 */
	input[type="file"]{
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	/* file태그를 대신한 label 태그 */
	#fakeFile{
		color: white;
		background-color: #19ce60;
		border: 1px solid #19ce60;
		font-size: 15px;
		font-weight: 800; 
		padding: 0.8em;
	}
</style>	
	<%-- 전달받은 customerBean --%>
	<c:set value="${requestScope.customerBean }" var="cBean"/>
	<%-- 전달받은 storeBean --%>
	<c:set value="${requestScope.storeBean }" var="sBean"/>
	
	<div id="mainDiv">
		
		<%--
			리뷰 table에 들어가야 할 것
		
		reviewNo 		(AI)
		orderNo			(?)
		customerNo		(전달) hidden
		storeNo			(전달) hidden
		contents		(전달가능)
		points			(전달가능)
		image			(전달가능)
		date			(now())
		comment			(null)
		
		 --%>
		<form action="writeReviewAction.do" enctype="multipart/form-data" method="post">
			<table align="center">
				<input type="hidden" value="${cBean.customerNo }" name="customerNo">
				<input type="hidden" value="${sBean.storeNo}" name="storeNo">
				<input type="hidden" value="${sBean.name }" name="storeName">
				<input type="hidden" value="${cBean.nickname }" name="nickname">
				<input type="hidden" value="${param.orderNo }" name="orderNo">
				<input type="hidden" name="points" class="pointsResult" value="0">
				
				
				<tr>
					<td colspan="2" align="center"><div id="storeName">${sBean.name }</div></td>
				</tr>
				<tr>
					<%-- <td colspan="2">${cBean.nickname }</td> --%>
					<td><div align="center" id="evaluation">이 음식점에 대한 상세한 평가를 해주세요.</div></td>
				</tr>
				<tr>
					<td align="center">
						<div class="pointsClick">
							<i class="points">★</i>
							<i class="points">★</i>
							<i class="points">★</i>
							<i class="points">★</i>
							<i class="points">★</i>
							&nbsp;
							<span id="zeroPoints">0점주기</span>
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="file" id="fakeFile">업로드</label></td>
					<td><input type="file" name="image" id="file"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="contents" name="contents"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록완료"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<script type="text/javascript">
			
		$('.pointsClick i').click(function(){
	  		$(this).parent().children('i').removeClass('on');
	  		$(this).addClass('on').prevAll('i').addClass('on');
	  		
	  		$(".pointsResult").val($(".on").length);
		});
		
		$("#zeroPoints").click(function(){
			$('.pointsClick i').removeClass('on');			
	  		$(".pointsResult").val($(".on").length);
		});
	</script>
	
</body>
</html>