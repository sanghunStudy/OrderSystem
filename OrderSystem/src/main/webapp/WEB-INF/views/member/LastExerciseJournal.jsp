<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지난 운동 일지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/LastExerciseJournal.css">
<script src="${pageContext.request.contextPath}/resources/js/SeeMoreJournals.js"></script>
</head>
<body>
	<div id="more_exercise_list" class="more_exercise">
		<div class="content_square">
			<div class="more_exercise-list-head">
				<h3>지난 운동 일지</h3>
			</div>
			<c:choose>
				<c:when test="">
					<%-- <c:forEach var="mel" items="${list}">
					<div>
						<ul>
							<li>${mel.exerciseDate}</li>
							<li>${mel.title}</li>
							
						</ul>
					</div>
				</c:forEach> --%>
				</c:when>
				<c:otherwise>
					<div class="nothing">지난 운동 일지가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>