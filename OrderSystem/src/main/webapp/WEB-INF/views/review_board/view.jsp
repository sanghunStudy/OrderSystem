<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<span>${item.reviewDate}</span>
		</div>
		<div>
		<span>${item.reviewViews}</span>
		</div>
		<div>${item.reviewTitle}</div>
		<div>${item.reviewContents}</div>	
	</div>
<a href="update?reviewId=${item.reviewId}">수정</a> <a href="delete?reviewId=${item.reviewId}">삭제</a>
<a href="..">처음으로</a>
</body>
</html>