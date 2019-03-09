<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
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
			<span>${item.reviewPhoto}</span>
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

	<jsp:include page="comment.jsp" flush="true" />

	<a href="add?nid=${item.noticeId}">수정</a>
	<a href="delete?nid=${item.noticeId}">삭제</a>

</body>
</html>