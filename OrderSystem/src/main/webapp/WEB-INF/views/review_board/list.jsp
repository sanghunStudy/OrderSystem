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
	<table border="1">
		<tr>
			<th>후기번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>별점</th>
		</tr>		
		<c:choose>
			<c:when test="${list.size() > 0}">
				<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.reviewId}</td>
					<td><a href="view?reviewId=${item.reviewId}">${item.reviewTitle}</a></td>
					<td>${item.id}</td>
					<td>${item.reviewDate}</td>
					<td></td>
					<td></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">등록 된 게시물이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<a href="add">후기등록</a>
	<a href="..">처음으로</a>
</body>
</html>