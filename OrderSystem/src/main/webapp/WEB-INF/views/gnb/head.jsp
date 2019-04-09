<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/gnb/head.css">
</head>
<body>
	<header>
		<div id="lnb">
			<h1>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/images/gnb/logo.png"></a>
			</h1>
			<nav>
				<ul>
					<li><a href="#">식단</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/calorie/calculator">기초대사량 측정</a></li>
							<li><a href="#">하위메뉴</a></li>
						</ul>
					</li>
					<li><a href="#">운동가이드</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/strength/training">1RM계산기</a></li>
							<li><a href="#">하위메뉴</a></li>
						</ul>
					</li>
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/menu/list">메뉴</a></li>
							<li><a href="${pageContext.request.contextPath}/review_board/list">후기게시판</a></li>
						</ul>
					</li>
					<li><a href="#">고객센터</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
							<li><a href="#">하위메뉴</a></li>
							<li><a href="${pageContext.request.contextPath}/opo/webRtc">OnlinePT 테스트</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<h2 class="hide">회원</h2>
			<ul class="login">
				<sec:authorize access="isAnonymous()">
					<li><a href="${pageContext.request.contextPath}/member/add"> 회원가입 </a></li>
					<li><a href="<c:url value="${pageContext.request.contextPath}/login"/>"> 로그인 </a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<!-- 인증된 사용자면 principal에 있는 username을 찾아서 화면에 보여준다. -->
						<sec:authentication property="principal.username" />		
					<li>
					<a href="${pageContext.request.contextPath}/member/MyPage?id= <sec:authentication property="principal.username"/>">마이페이지</a></li>
					<li><a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a></li>
					<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
					</form>
				</sec:authorize>
			</ul>
		</div>
	</header>
</body>
</html>