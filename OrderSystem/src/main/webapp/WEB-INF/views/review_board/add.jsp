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
			<input type="text" name="reviewTitle" placeholder="제목을 입력해주세요">
		</div>
		<div>
			<label>내용</label>
			<input type="text" name="reviewContents" placeholder="제목을 입력해주세요">
		</div>
		<input type="submit" value="등록"> 
	</form>
</body>
</html>