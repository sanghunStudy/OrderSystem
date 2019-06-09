<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너봇_관리자</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(function() {
		$('.admission-box').click(function() {
			location.href="proList";
		});
		$('.exer-management-box').click(function() {
			location.href="MyExerciseJournal";
		})
	})
	</script>
</head>

<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
	<div id="full-body">
		<div id="wrapper">
			<h1 class="menu-title">관리자 페이지</h1>
			<div class="menu-box">
				<div class="admission-box"><img src="${pageContext.request.contextPath}/resources/images/icon/admission.png"><span>트레이너 관리</span></div>
				<div class="exer-management-box"><img src="${pageContext.request.contextPath}/resources/images/icon/exer-management.png"><span>운동관리</span></div>
			</div>

		</div>
	</div>
</body>
</html>