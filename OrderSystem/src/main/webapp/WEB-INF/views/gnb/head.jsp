<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/gnb/head.css">
</head>
<body>
	<header>
		<div style="width: 1200px; margin: 0 auto;">
			<ul class="login">
				<c:choose>
					<c:when
						test="${sessionScope.user eq null and sessionScope.admin eq null}">
						<li><a href="<c:url value="/login"/>">LOGIN</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="member/MyPage">마이페이지</a></li>
						<li><a href="logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="${pageContext.request.contextPath}/member/add">JOIN</a></li>
				<li><a href="${pageContext.request.contextPath}/notice/list">FAQ</a></li>
			</ul>
			<div id="lnb">
				<h1>
					<a href="${pageContext.request.contextPath}/">TRAINING BOT</a>
				</h1>
				<nav>
					<ul>
						<li><a href="#">TRAINING</a></li>
						<li><a href="#">ROUTINE</a></li>
						<li><a href="#">MENU</a></li>
						<li><a href="#">PERSONAL TRAINER</a></li>
					</ul>

				</nav>

			</div>
		</div>
	</header>
</body>
</html>