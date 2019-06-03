<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 명단</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/trainer-modal.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/trainer_list.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/modal.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/icomoon/style.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script>

</script>
</head>
<body>

	<h1>트레이너 목록</h1>
	<c:choose>
		<c:when test="${trainerList.size() > 0}">
			<c:forEach var="item" items="${trainerList}">
				<div class="item-box">
					<div class="username">${item.username}</div>
					<c:if test="${user != null}">
						<div class="modal-btn-box">
							<button class="modal-btn" id="modal-btn">pt신청</button>
						</div>

					</c:if>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>등록된 트레이너가 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<form action="apply" method="post" id="trainer" hidden="true">
		<input id="managerID" type="hidden" name="manager" value="">
	</form>
	<!-- Modal  -->
	<div class="modal-btn-box">
		<button class="modal-btn" id="modal-btn">모달테스트</button>
	</div>

	<div class="modal" id="modal">
		<div class="modal-container">
			<div class="modal-header">
				<h2>멘토링 신청</h2>
			</div>
			<div class="contents-container">
				<form>
					<div class="group">
						<input type="text" required class="weights"> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">체중</label>
					</div>
					<div class="group">
						<input type="text" required class="height"> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">키</label>
					</div>
					<div class="group">
						<input type="text" required class="etc"> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">하고싶은 말
							한줄</label>
					</div>

				</form>
			</div>
			<ul class="list-inline">

				<li><button type="button" class="modal-btn-collection apply">
						<span>신청</span>
					</button></li>
			</ul>
		</div>
	</div>
	<!-- end Modal -->
</body>
</html>