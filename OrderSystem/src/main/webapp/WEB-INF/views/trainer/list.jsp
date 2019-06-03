<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 명단</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/modal.js"></script>
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
	function selectUserbI(managerId) {
		var test = this.value;
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/trainer/selectUserbI",
			success : function(data) {
				if (data == 0) {
					alert("회원 기초 정보를 등록하세요");
				} else if (data == 2) {
					alert("신청 내역이 존재합니다.");
				} else {
					console.log("tq");
					document.getElementById("managerID").value = managerId;
					document.getElementById("trainer").submit();

				}
			}
		});
	}
</script>
</head>
<body>
	<h1>트레이너 목록</h1>
	<c:choose>
		<c:when test="${trainerList.size() > 0}">
			<c:forEach var="item" items="${trainerList}">
				${item.username}
				<c:if test="${user != null}">
					<button onclick="selectUserbI('${item.username}')"
						value="${item.username}" class="">pt신청</button>
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>등록된 트레이너가 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<form action="apply" method="post" id="trainer" hidden="true">
		<input id="managerID" type="hidden" name="manager" value="">
	</form>
	<div class="modal-btn-box">
		<button class="modal-btn" id="modal-btn">모달테스트</button>
	</div>
	<!-- Modal  -->
	<div class="modal" id="modal">
		<div class="modal-container">
			<div class="modal-header"></div>
			<div class="contents-container">
				<form>
					<div class="group">
						<input type="text" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">체중</label>
					</div>
					<div class="group">
						<input type="text" required> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">키</label>
					</div>

				</form>
			</div>
			<ul class="list-inline">
				<li><button type="button"
						class="modal-btn-collection prev-step prev-food">
						  <span>이전</span>
					</button></li>
				<li><button type="button" class="modal-btn-collection add-food">
						<span>추가 버튼</span>
					</button></li>
				<li><button type="button"
						class="modal-btn-collection next-step next-food">
						<span>다음</span>
					</button></li>
			</ul>
		</div>
	</div>
	<!-- end Modal -->
</body>
</html>