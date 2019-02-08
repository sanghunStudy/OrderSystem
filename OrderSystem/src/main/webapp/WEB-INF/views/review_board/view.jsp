<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>후기게시판</h1>
	<div>
		<div>
			<span>${item.reviewId}</span>
		</div>
		<div>
			<span><fmt:formatDate value="${item.reviewDate}"
					pattern="yyyy-mm-dd" /></span>
		</div>
		<div>
			<span>${item.reviewViews}</span>
		</div>
		<div>${item.reviewTitle}</div>
		<div>${item.reviewContents}</div>
	</div>
	<a href="update?reviewId=${item.reviewId}">수정</a>
	<a href="delete?reviewId=${item.reviewId}">삭제</a>
	<a href="..">처음으로</a>
	
	<div style="border: 1px solid; width: 600px; padding: 5px">
		<form name="form1" action="Reply" method="post">
			<input type="hidden" name="reviewId"
				value="<c:out value="${item.reviewId}"/>"> 작성자: <input
				type="text" name="rcommentWriter" size="20" maxlength="20"> <br />
			<textarea name="rcommentContents" rows="3" cols="60" maxlength="500"
				placeholder="댓글을 달아주세요."></textarea>
			<a href="#" onclick="fn_formSubmit()">저장</a>
		</form>
	</div>

</body>
</html>