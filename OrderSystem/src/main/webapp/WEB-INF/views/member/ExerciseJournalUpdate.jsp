<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동일지 수정</title>
</head>
<body>
<form action="ExerciseJournalUpdate" method="post">
<sec:csrfInput />
<c:choose>
		<c:when test="${0 < oneEJ.size()}">

			<c:forEach var="item" items="${oneEJ}" begin="0" varStatus="i">
					<p>${item.exerciseName}</p>

				<c:forEach var="details" items="${item.details}" begin="0">
					<input type="hidden" name="itemList[${i.index}].ExerciseContentsCode" value="${details.exerciseContentsCode}">
					
					<p>set :${details.exerciseSet}</p>

					<p>Reps :<input type="text" name="itemList[${i.index}].ExerciseReps" value="${details.exerciseReps}"></p>

					<p>lb :<input type="text" name="itemList[${i.index}].ExerciseLb" value="${details.exerciseLb}"></p>

				</c:forEach>
			</c:forEach>


		</c:when>
		<c:otherwise>
			<p>ho</p>
		</c:otherwise>
	</c:choose>
	<button>수정완료</button>
</form>
</body>
</html>