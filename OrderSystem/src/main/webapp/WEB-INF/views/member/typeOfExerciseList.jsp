<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동종류 목록</title>
</head>
<body>
	<c:choose>
		<c:when test="${eTlist.size() > 0}">
			<ul>
			<c:forEach var="eTlist" items="${eTlist}">
				<li>운동명 : ${eTlist.teName} 추천 세트수 : ${eTlist.teSet} set 추천 횟수 ${eTlist.teReps} reps 추천 기구 ${eTlist.teTool} <a href="typeOfExerciseAdd?teNum=${eTlist.teNum}">수정</a> <a href="typeOfExerciseDel?teNum=${eTlist.teNum}">삭제</a></li>
			</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p>등록된 운동이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<a href="typeOfExerciseAdd?teNum=0">운동 등록하기</a>
</body>
</html>