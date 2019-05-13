<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동일지리스트</title>
</head>
<body>
	<c:choose>
		<c:when test="${EJ.size() > 0}">
			<c:forEach var="erun" items="${EJ}" >
				<ul>
					<li>${erun.exerciseCode}</li>
					<li>${erun.start}</li>
					<li>${erun.title}</li>
					<li>${erun.exerciseName}</li>
					<li>${erun.details(exerciseLb)}</li>
				</ul>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<a>아무것도 안나옴.</a>
		</c:otherwise>
	</c:choose>
</body>
</html>