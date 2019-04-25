<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 입니다.</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>

</head>
<!-- 네비바 -->
<jsp:include page="gnb/head.jsp" flush="true" />
<body>
	<div id="container">
		<div class="section0"></div>
		<div class="section1">
			<div id="carousel_section">
				<ul>
					<li><img
						src="${pageContext.request.contextPath}/resources/images/main/dumbel.png">
						<div class="section1_item">
							<span>팔운동 </span><span id="section1_title">" 덤벨 "</span>
							<p>
								덤벨기구는 마치 바벨을 축소시켜 놓은듯한 생김새를 가지고 있다.<br> 크기가 작고 아주 가벼운 중량부터
								사용 가능하여 초보자가 최소한<br> 비용으로 홈에서 운동을 하고자 할때 유용하게 쓸수 있다. 하지만<br>
								덤벨 운동은 초보자가 컨트롤하기 까다로워 올바른 자세를 잘<br> 익혀야 한다.
							</p>
						</div></li>

					<li><img
						src="${pageContext.request.contextPath}/resources/images/main/ca2.png">
						<div class="section1_item">
							<span>팔운동 </span><span id="section1_title">＂덤벨 컬＂</span>
							<p>
								바벨 컬에 비해 상완이두근의 선명도를 높일 수 있는 운동이다.<br> 선 자세와 앉은 자세(벤치,
								짐볼)에서 운동이 가능하며, 그립을 <br> 잡는 방향에 따라 발현되는 근육이 달라지며, 양팔을 동시에 <br>
								운동하거나 한 팔씩 번갈아가며 운동을 할 수도 있다.
							</p>
						</div></li>
					<!-- 					<li><img src="../img/img03.png"></li> -->
					<!-- 					<li><img src="../img/img04.png"></li> -->

				</ul>
			</div>
		</div>
		<div class="section2"></div>
		<div class="section3">
			<div class="section3_item">
				<p class="section3_title">
					your own <span>Trainer</span>
				</p>
				<p class="section3_sub_title">Build Your Body Yourself with your
					own Trainer</p>
				<div>
					<p>GET Started</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>