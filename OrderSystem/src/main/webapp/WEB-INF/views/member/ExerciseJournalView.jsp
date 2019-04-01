<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동일지</title>
</head>
<body>

	<c:choose>
		<c:when test="${0 < oneEJ.size()}">

			<c:forEach var="item" items="${oneEJ}" begin="0">
					<p>${item.exerciseName}</p>
					<c:set var="exerciseCode" value="${item.exerciseCode}"/>			
				<c:forEach var="details" items="${item.details}" begin="0">
				
					<p>set :${details.exerciseSet}</p>

					<p>Reps :${details.exerciseReps}</p>

					<p>lb :${details.exerciseLb}</p>

				</c:forEach>
			</c:forEach>


		</c:when>
		<c:otherwise>
			<p>ho</p>
		</c:otherwise>
	</c:choose>
	<a href="${pageContext.request.contextPath}/member/ExerciseJournal">운동일지</a>
	<a href="${pageContext.request.contextPath}/member/ExerciseJournalUpdate?exerciseCode=${exerciseCode}">수정</a>
	<a href="${pageContext.request.contextPath}/member/ExerciseJournalDel?exerciseCode=${exerciseCode}">삭제</a>
</body>
</html>