<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지난 운동 일지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/LastExerciseJournal.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/SeeMoreJournals.js"></script>
</head>
<body>
	<div id="more_exercise_list" class="more_exercise">
		<div class="content_square">
			<div class="more_exercise-list-head">
				<h3>지난 운동 일지</h3>
			</div>
			<c:choose>
				<c:when test="${list.size() > 0}">
					<div>
					<ul class="last-exercise-slider">
						<c:forEach var="LastMonthExercise" items="${list}">
							<li><div class="last-exercise-date">${LastMonthExercise.title}</div></li>
						</c:forEach>
					</ul>	
					</div>
				</c:when>
				<c:otherwise>
					<div class="nothing">지난 운동 일지가 없습니다.${list.size()}</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>