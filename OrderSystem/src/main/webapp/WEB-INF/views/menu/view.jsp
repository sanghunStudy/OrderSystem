<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item.menuId}.${item.menuName}</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>


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
			<a>컨텐츠 : <span>${item.menuContent}</span></a>
		</div>
		<div>
			<a>작성일 : <span><fmt:formatDate value="${item.menuDate}" pattern="yyyy-MM-dd"/></span></a>
		</div>
		<div>
			<a>조회수 : <span>${item.menuViews}</span></a>
		</div>
	</div>
	
	<jsp:include page="comment.jsp" flush="true" />
	
	<span>
		<a href="update?menuId=${item.menuId}">변경</a>
		<a href="delete?menuId=${item.menuId}">삭제</a>
	</span>
	<a href="list">목록으로</a>
</body>
</html>