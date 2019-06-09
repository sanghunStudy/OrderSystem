<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>트레이너봇 내정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/myinfo.css">
<script src="${pageContext.request.contextPath}/resources/js/myinfo.js"></script>
</head>
<%@ include file="../gnb/nav.jsp"%>
<%@ include file="../alarm.jsp"%>
<%@ include file="../gnb/sidebar.jsp"%>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
	<div id="full-box">
		<div id="wrapper">
			<div class="first-line">
				<div class="profile-myinfo profile-box">
					<h3>트레이너 봇 프로필</h3>
					<div class="myinfo-contents contents-box">
						<div class="photo-box">
							<img src="#"
								onError="javascript:this.src='/kopo/resources/images/icon/default-profile-icon.jpg'"
								class="myphoto">
						</div>
						<div class="myinfo-box">
							<div>
								<span>아이디</span><span class="id-val"></span>
							</div>
							<div>
								<span>이름</span><span class="name-valu"></span>
							</div>
							<div>
								<span>회원기초정보조사 여부</span><span class="isServey"></span>
							</div>
						</div>

					</div>
					<div class="update-myinfo">
						<button class="chart-menti btn-collection menti-btn">
							<span>수정</span>
						</button>
					</div>
				</div>
				<div class="profile-myTier profile-box">
					<h3>나의 티어</h3>

					<div class="tier-contents contents-box">
						<div class="tier-box">
							<img
								src="${pageContext.request.contextPath}/resources/images/chalinger-tier.png">
						</div>
						<div class="tier-info-box">
							<p>CHALINGER</p>
						</div>
					</div>
				</div>
			</div>
			<div class="second-line">
				<div class="profile-myBoard profile-box">
					<h3>내가 쓴 게시글</h3>
					<div class="board-contents contents-box"></div>
				</div>
				<div class="profile-myComment profile-box">
					<h3>내가 쓴 댓글</h3>
					<div class="comment-contents contents-box"></div>
				</div>
			</div>
			<div class="bottom-line">
				<p>
					트레이너봇을 더 이상 이용하지 않는다면 <a href="#">회원탈퇴 바로가기</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>