<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 입니다.</title>
</head>
<body>
<h1>메인 페이지 입니다.</h1>
<div>${sessionScope.user} ${sessionScope.admin}</div>
<ul>
<li><a href="menu/list">메뉴</a></li>
<li><a href="review_board/list">후기게시판</a></li>
<li><a href="notice/list">공지사항</a></li>
<li><a href="gps/getLocation">위치정보 테스트</a></li>
<li><a href="member/add">회원가입</a></li>

<c:choose>
			<c:when test="${sessionScope.user eq null and sessionScope.admin eq null}">
				<li><a href="login">로그인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="logout">로그아웃</a></li>
			</c:otherwise>
</c:choose>
</ul>
</body>
</html>