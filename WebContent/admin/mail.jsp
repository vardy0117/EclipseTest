<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>어드민 메일 보내기</title>
</head>

<script>
$(document).ready(function(){

	var list="";
list += 
 <c:forEach items="${UserMailList}" var="maillist" varStatus="status">
 $("#maillist").val("${maillist.email}, ");
</c:forEach>


	console.log(list);
	$("#maillist").append(list);
});

</script>

<style>
	.btn {
		width: 25px;
		background: linear-gradient( to bottom, hsl(0deg 0% 0%), hsl(0deg 0% 57%));
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
#mainDiv{
		width: 1000px;
		min-height: 600px;
		margin: 0 auto;
		margin-top: 80px;
		position: relative;
		padding-top: 15px;
		padding-bottom: 15px;
	}
</style>
<script>


</script>
<body>


    <div id="mainDiv">
    
        <form action="sendmailaction.do" method="post">
            <table>
                <tr><th colspan="2">광고 메일 보내기</th></tr>
                <tr><td>from</td><td><input type="text" name="from" value="6ydz642@naver.com"/></td></tr>
                <tr><td >to</td><td><input type="text" id="maillist" name="to" value=""/></td></tr>
                <tr><td>subject</td><td><input type="text" name="subject" /></td></tr>
                <tr><td>content</td><td><textarea name="content" style="width:600px; height:183px;"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input class="btn" type="submit" value="발송하기"/></td></tr>
            </table>
        </form>
    </div>
</body>
</html>


