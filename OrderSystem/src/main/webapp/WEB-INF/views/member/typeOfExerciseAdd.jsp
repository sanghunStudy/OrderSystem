<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 종류 입력</title>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/train-add.css"> 
</head>
<body>
<div id="wrapper">
	<div id="container1">
	<h1>운동 등록하기</h1>
	<div id="train-enter">
	<form action="typeOfExerciseAdd" method="post" enctype="multipart/form-data">
	
	<div class="inputArea">
				
				<input type="file" id="teImg" name="file" value="${to.teImg}"/>
				<label for="teImg" class="input-image">
				
			<c:choose>
				<c:when test="${to.teImg != null}">
					<div class="select_img">
						<img src="${pageContext.request.contextPath}/upload${to.teImg}" class="input-image-box"/> 
					</div>
				</c:when>
				<c:otherwise>
					<div class="select_img">
						<img src="${pageContext.request.contextPath}/resources/images/icon/exer-management.png" class="input-image-box">
					</div>
				</c:otherwise>
			</c:choose>
			</label>
			<script>
				$("#teImg").change(function(){
					if(this.files && this.files[0]){
						var reader =new FileReader;
						reader.onload = function(data){
							console.log(data.target.result);
							$(".input-image-box").attr("src", data.target.result).width(200);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
			</script>
		</div>
	
	<div id="content-box">
		<input type="hidden" name="teNum"
			value="${to.teNum == null?0 : to.teNum}">
		<div id="title-box">
			<p>운동명</p>
			<input type="text" name="teName" value="${to.teName}">
		</div>
		
		<div id="set-box">
			<p>추천 세트수</p>
			<input type="text" name="teSet" value="${to.teSet}">
		</div>
		
		<div id="reps-box">
			<p>추천 횟수</p>
			<input type="text" name="teReps" value="${to.teReps}">
		</div>
		
		<div id="machine-box">
			<p>사용하는 기구</p>
			<input type="text" name="teTool" value="${to.teTool}">
		</div>
		
		</div>
		
		
		
		<input class="add" type="submit" value="등록 완료">
		<a href="${pageContext.request.contextPath}/member/MyPage"><button type="button" class="main">마이페이지로</button></a>
	</form>
	</div>
	</div>
	</div>
</body>
</html>