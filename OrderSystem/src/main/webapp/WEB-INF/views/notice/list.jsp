<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<table>
	<thead>
		<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>아이디</th>
		<th>조회수</th>
		<th>작성일자</th>
		</tr>
	</thead>
	<c:choose>
		<c:when test="${list.size() > 0}">
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
				<td>${item.noticeId}</td>
				<td><a href="view?nid=${item.noticeId}">${item.noticeTitle}</a></td>
				<td>${item.id}</td>
				<td>${item.noticeViews}</td>
				<td><fmt:formatDate value="${item.noticeDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
		</c:when>
		<c:otherwise>
			<p>등록 된 공지사항이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	
</table>	
	<c:if test="${pageVo.totalPage>1}">
	<div>
		<c:forEach var="i" begin="${pageVo.pageStart}" end="${pageVo.pageEnd}" step="1">
			<c:url var="pageLink" value="list">
				<c:param name="page" value="${i}"/>
			</c:url>
			<a href="${pageLink}"><c:out value="${i}"/></a>
		</c:forEach>
	</div>
	</c:if>
	
	<a href="add?nid=0">글쓰기</a>
</body>
</html>