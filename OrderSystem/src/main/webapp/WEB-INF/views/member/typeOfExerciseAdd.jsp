<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 종류 입력</title>
</head>
<body>
<form action="typeOfExerciseAdd" method="post">
		<input type="hidden" name="teNum" value="${to.teNum == null?0 : to.teNum}">
		<div>
			<label>운동명</label>
			<input type="text" name="teName" value="${to.teName}">
		</div>
		<div>
			<label>추천 세트수</label>
			<input type="text" name="teSet" value="${to.teSet}">
		</div>
		<div>
			<label>추천 횟수</label>
			<input type="text" name="teReps" value="${to.teReps}">
		</div>
		<div>
			<label>사용하는 기구</label>
			<input type="text" name="teTool" value="${to.teTool}">
		</div>
		<input type="submit" value="등록 완료">
	</form>
</body>
</html>