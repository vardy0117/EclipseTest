<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>해당 가게의 리뷰 중에서 모든 닉네임   ${requestScope.nickNameList}</h1>
 	<c:forEach items="${requestScope.nickNameList}" var="nick">
 		${nick}님의 글
 	</c:forEach>
 	
	<h1>review.jsp 태우</h1>
	
	<c:forEach items="${requestScope.reviewList}" var="rBean">
		<div>
			<table border="1px solid" align="center">
				<tr>
					<td>
						${rBean.customerNo }번 고객님 ${rBean.date}
						<c:if test="${rBean.points eq 0 }">
							☆☆☆☆☆
						</c:if>
						<c:if test="${rBean.points eq 1 }">
							★☆☆☆☆
						</c:if>
						<c:if test="${rBean.points eq 2 }">
							★★☆☆☆
						</c:if>
						<c:if test="${rBean.points eq 3 }">
							★★★☆☆
						</c:if>
						<c:if test="${rBean.points eq 4 }">
							★★★★☆
						</c:if>
						<c:if test="${rBean.points eq 5 }">
							★★★★★
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<img src="./images/${rBean.image }"> 
					</td>
				</tr>
				<tr>
					<td>
						${rBean.contents }
					</td>
				</tr>			
			</table>
		</div>




	</c:forEach>



</body>
</html>