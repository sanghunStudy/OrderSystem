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
</head>
<body>
	<form action="typeOfExerciseAdd" method="post" enctype="multipart/form-data">
		<input type="hidden" name="teNum"
			value="${to.teNum == null?0 : to.teNum}">
		<div>
			<label>운동명</label> <input type="text" name="teName"
				value="${to.teName}">
		</div>
		<div>
			<label>추천 세트수</label> <input type="text" name="teSet"
				value="${to.teSet}">
		</div>
		<div>
			<label>추천 횟수</label> <input type="text" name="teReps"
				value="${to.teReps}">
		</div>
		<div>
			<label>사용하는 기구</label> <input type="text" name="teTool"
				value="${to.teTool}">
		</div>
		<div class="inputArea">
			<label>이미지</label>
				<input type="file" id="teImg" name="file" value="${to.teImg}"/>
			<c:choose>
				<c:when test="${to.teImg != null}">
					<div class="select_img">
						<img src="${pageContext.request.contextPath}/upload${to.teImg}" /> 
					</div>
				</c:when>
				<c:otherwise>
					<div class="select_img">
						<img src="" />
					</div>
				</c:otherwise>
			</c:choose>
			<script>
				$("#teImg").change(function(){
					if(this.files && this.files[0]){
						var reader =new FileReader;
						reader.onload = function(data){
							console.log(data.target.result);
							$(".select_img img").attr("src", data.target.result).width(500);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
			</script>
		</div>
		<input type="submit" value="등록 완료">
	</form>
</body>
</html>