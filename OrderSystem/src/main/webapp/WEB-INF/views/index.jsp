<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 입니다.</title>
</head>
<body>
	<h1>메인 페이지 입니다.</h1>
	<div>${sessionScope.user}${sessionScope.admin}</div>
	<ul>
		<li><a href="menu/list">메뉴</a></li>
		<li><a href="review_board/list">후기게시판</a></li>
		<li><a href="notice/list">공지사항</a></li>
		<li><a href="gps/getLocation">위치정보 테스트</a></li>

<!-- 		spring-security로 현재 인증한 사용자인지 판단하여 로그인 로그아웃 버튼 출력	 -->
		<sec:authorize access="isAnonymous()">
		<li><a href="member/add">회원가입</a></li>
		<li><a href="<c:url value="login"/>">로그인</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
		<!-- 인증된 사용자면 principal에 있는 username을 찾아서 화면에 보여준다. -->
		<p>환영합니다 <sec:authentication property="principal.username"/> 님!</p>
		<a href="member/MyPage?id= <sec:authentication property="principal.username"/>">마이페이지</a>
		<li><a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a></li>
			<form id="logoutForm" action="logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</sec:authorize>


<%-- 세션방식 		<c:choose> --%>
<%-- 			<c:when --%>
<%-- 				test="${sessionScope.user eq null and sessionScope.admin eq null}"> --%>
<!-- 				<li><a href="login">로그인</a></li> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<li><a href="logout">로그아웃</a></li> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
	</ul>
</body>
</html>