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
	<h1>후기 등록</h1>
	<form method="post" action="add">
		<div>
			<label>제목</label>
			<input type="text" name="review_title" placeholder="제목을 입력해주세요">
		</div>
		<div>
			<label>내용</label>
			<input type="text" name="review_contents" placeholder="제목을 입력해주세요" rows="10" cols="80">
		</div>
		<div>
			<label>글쓴이</label>
			<input type="text" name="id" placeholder="제목을 입력해주세요">
		</div>
		<div>
			<label>조회수</label>
			<input type="text" name="review_views" placeholder="제목을 입력해주세요">
		</div>
		<input type="submit" value="등록"> 
	</form>
</body>
</html>