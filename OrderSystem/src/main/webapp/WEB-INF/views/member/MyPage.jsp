<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://unpkg.com/vue@2.5.16/dist/vue.js"></script>
</head>
<body>
	<div id="simple">
		<h2 v-text="message"></h2>
	</div>

	<script>
		var model = {
			message : '마이페이지 입니다.'
		}

		var simple = new Vue({
			el : '#simple',
			data : model
		})
	</script>
	<ul>

		<li><a href="update">회원정보수정</a></li>
		<li><a href="list">내가 쓴 게시글</a></li>
		<li><a href="ExerciseJournal">나의 운동일지</a></li>
	</ul>

</body>
</html>