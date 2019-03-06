<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item.menuId}</title>
</head>
<body>
	<div>
		<div>
			<a>번호 : <span>${item.menuId}</span></a>
		</div>
		<div>
			<a>메뉴이름 : <span>${item.menuName}</span></a>
		</div>
		<div>
			<a>메뉴사진 : <span>${item.menuPhoto}</span></a>
		</div>
		<div>
			<a>가격 : <span>${item.menuPrice}</span></a>
		</div>
	</div>
	<span>
		<a href="update?menuId=${item.menuId}">변경</a>
		<a href="delete?menuId=${item.menuId}">삭제</a>
	</span>
	<a href="list">목록으로</a>
</body>
</html>