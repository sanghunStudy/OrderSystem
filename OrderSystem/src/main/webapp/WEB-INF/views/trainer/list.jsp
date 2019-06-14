<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 명단</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/trainer_list.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/modal_trainer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/trainer_list.css">
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" -->
<!-- 	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" -->
<!-- 	crossorigin="anonymous"> -->
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	var context = "${pageContext.request.contextPath}";
</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>

	<div id="wrapper">
		<div class="title">
			<h1>트레이너 목록</h1>
		</div>
		<div class="trainer-list">
			<c:choose>
				<c:when test="${trainerList.size() > 0}">
					<c:forEach var="item" items="${trainerList}">
						<div class="item-box">
							<input type="hidden" value="${item.sex}" class="trainer-sex">
							<input type="hidden" value="${item.name}" class="trainer-name">
							<input type="hidden" value="${item.username}" class="trainer-id">
							<input type="hidden" value="${item.career}" class="trainer-career">
							<div class="trainer-info">
								<div class="photo">
								<img src="${pageContext.request.contextPath}/resources/images/grade-border/${item.tier}-tier-border.png" class="trainer-tier-border" alt="${item.tier}"/>
									<img
										src="${pageContext.request.contextPath}/upload/${item.upFilename}"
										onError="javascript:this.src='/kopo/resources/images/icon/default-profile-icon.jpg'"
										class="text">
								</div>
								<div class="trainer-text">
									<div class="username">${item.name}<small
											class="identifier">(${item.username})</small>
									</div>
									<div class="career">
										<img
											src="${pageContext.request.contextPath}/resources/images/icon/career.png"
											width="35px" height="35px">
										<div class="career-item">${item.career}</div>
									</div>
								</div>
								<div class="trainer-menti-count">
									<p>보유 멘티수</p>
									<c:choose>
										<c:when test='${item.tier == "bronze"}'>
											<span>${item.menti}/5</span>
										</c:when>
										<c:when test='${item.tier == "silver"}'>
											<span>${item.menti}/10</span>
										</c:when>
										<c:when test='${item.tier == "gold"}'>
											<span>${item.menti}/15</span>
										</c:when>
										<c:when test='${item.tier == "platinum"}'>
											<span>${item.menti}/20</span>
										</c:when>
										<c:when test='${item.tier == "diamond"}'>
											<span>${item.menti}/25</span>
										</c:when>
										<c:otherwise>
											<span>${item.menti}/∞</span>
										</c:otherwise>
										
									</c:choose>
								</div>
							</div>
							<c:if test="${user != null}">
								<div class="modal-btn-box">
								<input type="hidden" value="${item.username}" class="trainer-id">
									<button class="modal-btn" id="modal-btn">pt신청</button>
									<button class="details" id="detail-btn">상세보기</button>
								</div>

							</c:if>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>등록된 트레이너가 없습니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Modal  -->



	<div class="modal" id="modal">
		<div class="modal-container">
			<div class="modal-header">
				<h2>멘토링 신청</h2>
			</div>
			<div class="contents-container">
				<div class="contents-box">
					<form action="apply" method="post" id="trainer"
						enctype="multipart/form-data">
						<input id="managerID" type="hidden" name="manager" value="">

						<div class="group">
							<input type="text" required class="weights" name="weights"
								autocomplete="off"> <span class="highlight"></span> <span
								class="bar"></span> <label class="only-modal">체중(in kg)</label>
						</div>
						<div class="group">
							<input type="text" required class="height" name="height"
								autocomplete="off"> <span class="highlight"></span> <span
								class="bar"></span> <label class="only-modal">키(in cm)</label>
						</div>
						<div class="sel sel--black-panther">
							<select name="goal" id="select-profession">
								<option value="" disabled>목표</option>
								<option value="근육량 증가">근육량 증가</option>
								<option value="다이어트">다이어트</option>
								<option value="근력량">근력량 증가</option>
								<option value="건강">건강 관리</option>
								<option value="기타">기타</option>
							
							</select>
						</div>
						<div class="group">
							<input type="text" required class="etc" name="etc"
								autocomplete="off"> <span class="highlight"></span> <span
								class="bar"></span> <label class="only-modal">하고싶은 말 한줄(20자 이내)</label>
						</div>

					</form>
				</div>
			</div>
			<ul class="list-inline">

				<li><button type="button" class="modal-btn-collection apply">
						<span>신청</span>
					</button></li>
			</ul>
		</div>
	</div>
	<!-- end Modal -->
	<div class="modal dmodal" id="detail-modal">
		<div class="modal-container">
			<div class="modal-header">
				<div class="profile-header">
					<div class="detail-photo"></div>
					<p class="trainer-name"></p>
					<span>스포츠 트레이너</span>
				</div>
			</div>
			<div class="contents-container">
				<div class="contents-box">
					<h2>TRAINERBOT PROFILE</h2>
					<div class="id-box">
						<p>아이디</p>
						<div class="detail-contents-box commons-padding">
							<div>
								<img src="/kopo/resources/images/icon/id-icon.png"><span></span>
							</div>
							<div class="id-content commons-padding"></div>
						</div>
					</div>
					<div class="career-box">
						<p>경력</p>
						<div class="detail-contents-box commons-padding">
							<div>
								<img
									src="/kopo/resources/images/icon/career-icon-background.png"><span></span>
							</div>
							<div class="career-contents commons-padding"></div>
						</div>
					</div>
					<div class="sex-box">
						<p>성별</p>
						<div class="background">
							<span class="male gender">남</span>
							<div class="toggle-body">

								<div class="toggle-btn"></div>

							</div>
							<span class="female gender">여</span>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
</body>
</html>