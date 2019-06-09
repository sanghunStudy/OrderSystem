<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sidebar</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/gnb/sidebar.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script>
	var url = document.location.href;
	var curPage = url.substr(url.lastIndexOf('/') + 1);
	var curUrl = curPage.replace('#', '');
	$(function() {
		$('.menu-icons').each(function(index, item) {
			if ($(item).find('a').attr('href') == curUrl) {
				$(item).addClass('curPage');
				$(item).find('a').addClass('curPage');
			} else {
				$(item).find('a').addClass('isNot');
			}
		});
		$('.toggle-box').click(function() {
			
			$('.menu-box').toggle('fast');
		})
	})
</script>
</head>
<body>
	<div class="toggle-box">
		<span class="menu-toggle"></span>
		<span class="menu-toggle"></span>
		<span class="menu-toggle"></span>
	</div>
	<div class="menu-box">
		<div class="logo">
			<a href="${pageContext.request.contextPath}">
				<div class="logo-circle">
					<img
						src="${pageContext.request.contextPath}/resources/images/logo.png"
						alt="logo">
				</div>
				<p>TRAINERBOT</p>
			</a>
		</div>
		<ul class="menu-bar">
			<li class="menu-icons"><a href="MyPage"><i
					class="fas fa-user-cog"></i>
					<p>내 정보</p></a></li>
			<li class="menu-icons"><a href="statistics"><i
					class="fas fa-chart-bar"></i>
					<p>운동일지 통계</p></a></li>

			<li class="menu-icons"><a href="MyExerciseJournal"><i
					class="fas fa-book"></i>
					<p>운동일지 작성</p></a></li>
			<li class="menu-icons"><a href="basicInformation"><i
					class="fas fa-user-edit"></i>
					<p>설문조사</p></a></li>
			<li class="menu-icons"><a href="mentiManagement"><i
					class="fas fa-users"></i>
					<p>멘티 관리</p></a></li>
			<li class="menu-icons"><a
				href="${pageContext.request.contextPath}/opo/webRtc"><i
					class="fas fa-comment-dots"></i>
					<p>화상채팅</p></a></li>
			<li class="menu-icons"><i class="fas fa-address-card"
				id="trainer-apply"></i>
				<p>트레이너 신청</p>
				</a></li>
		</ul>
	</div>
</body>
</html>