<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동종류 목록</title>
<meta name="viewport" content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/train-info.css">
</head>
<body>
<div id="wrapper">
	<div id="container1">
	<h1>운동종류 관리</h1>
	<div id="train-box">
	<c:choose>
		<c:when test="${eTlist.size() > 0}">
			<ul class="train-list">
			<c:forEach var="eTlist" items="${eTlist}">
				<li class="train-name">
				<img src="${pageContext.request.contextPath}/upload/${to.teImg}" class="train-img">
				<p>${eTlist.teName}</p>
				<p>${eTlist.teSet} set | ${eTlist.teReps} reps</p>
				<p>${eTlist.teTool}</p>
				<a href="typeOfExerciseAdd?teNum=${eTlist.teNum}"><button id="update">수정</button></a>
				<a href="typeOfExerciseDel?teNum=${eTlist.teNum}"><button id="delete">삭제</button></a>
				</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p>등록된 운동이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<div id="button-box">
	<a href="typeOfExerciseAdd?teNum=0"><button class="train-add">운동 등록하기</button></a>
	<a href="${pageContext.request.contextPath}/member/MyPage"><button class="main">마이페이지</button></a>
	</div>
	</div>
	</div>
</div>
</body>
</html>