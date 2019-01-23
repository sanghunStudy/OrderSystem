<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	<textarea rows="5" cols="50" readonly="readonly">${item.noticeContents}</textarea>
	
	<label>첨부파일</label>
	<p>${noticePhoto}</p>
	
<a href="add?nid=${item.noticeId}">수정</a> <a href="delete?nid=${item.noticeId}">삭제</a>

<a href="list">목록</a>
</body>
</html>