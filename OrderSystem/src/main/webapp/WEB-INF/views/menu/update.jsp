<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴수정페이지입니다.</title>
</head>
<body>
	<form action="update" method="post">
		<div>
			<input name="menuId" type="hidden" value="${item.menuId}"/>
		</div>
		<div>
			<label>메뉴이름: </label>
			<input name="menuName" type="text" value="${item.menuName}">
		</div>
		<div>
			<label>메뉴사진: </label>
			<input name="menuPhoto" type="text" value="${item.menuPhoto}">
		</div>
		<div>
			<label>메뉴가격: </label>
			<input name="menuPrice" type="Integer" value="${item.menuPrice}">
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>
	<a href="list">목록으로</a>
</body>
</html>