<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

</head>
<body>
	<label>글 번호</label>
	<p>${item.noticeId}</p>
	
	<label>제목</label>
	<p>${item.noticeTitle}</p>
	
	
	<label>작성자</label>
	<p>${item.id}</p>
	
	<label>조회수</label>
	<p>${item.noticeViews}</p>
	
	<label>작성일자</label>
	<P><fmt:formatDate value="${item.noticeDate}" pattern="yyyy-MM-dd"/></P>
	
	<label>내용</label>
	<div>${item.noticeContents}</div>
	
	<jsp:include page="comment.jsp" flush="true" />
		
<a href="add?nid=${item.noticeId}">수정</a> <a href="delete?nid=${item.noticeId}">삭제</a>

<a href="list">목록</a>
</body>
</html>