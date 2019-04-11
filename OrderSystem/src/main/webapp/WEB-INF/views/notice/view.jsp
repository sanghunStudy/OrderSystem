<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

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
	<P>
		<fmt:formatDate value="${item.noticeDate}" pattern="yyyy-MM-dd" />
	</P>

	<label>내용</label>
	<div>${item.noticeContents}</div>
	<c:choose>
	<c:when test="${file.size() > 0 }">
	<ul>
	<c:forEach var="img" items="${file}">
		
			<li><label>파일명 : <a href="${pageContext.request.contextPath}/upload${img.filename}">${img.realname}</a></label><label>파일 크기 ${img.filesize}</label></li>
		
	</c:forEach>
	</ul>
	</c:when>
	</c:choose>
	<jsp:include page="comment.jsp" flush="true" />
	
<!--  스프링 시큐리티로 작성자와 현재 로그인중인 회원의 정보를 비교해서 일치하면 수정,삭제 가능하게 해야하는데 아직 모르겠음 수정필요함!!! -->
<%-- 	<sec:authorize access="isAuthenticated()"> --%>
<%-- 		<a href="add?nid=${item.noticeId}">수정</a> --%>
<%-- 		<a href="delete?nid=${item.noticeId}">삭제</a> --%>
<%-- 	</sec:authorize> --%>
<%-- 	기존에 쓰던 세션방식 --%>

<c:if test="${item.id == securityId}">
 	<a href="add?nid=${item.noticeId}">수정</a>
 		<a href="delete?nid=${item.noticeId}">삭제</a>
	</c:if> 
	<a href="list">목록</a>
</body>
</html>