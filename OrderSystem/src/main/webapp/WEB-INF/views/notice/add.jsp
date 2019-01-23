<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="add" method="post">
	<input type="hidden" name="noticeId" value="${item.noticeId == null ?0 : item.noticeId}">
	
	<label>제목</label>
	<input type="text" name="noticeTitle" value="${item.noticeTitle}">
	
	
	<label>내용</label>
	<textarea rows="5" cols="50" name="noticeContents">${item.noticeContents}</textarea>
	
	
	<label>첨부파일</label>
	<input type="file" name="noticePhoto" value="${item.noticePhoto}">
	
	<button type="submit">등록</button>
	</form>	
</body>
</html>