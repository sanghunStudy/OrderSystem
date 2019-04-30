<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>트레이너 프로필 작성</h1>
	<form action="promotion" method="post">
		<fieldset style ="width:50">
			<legend>트레이너 프로필 작성</legend>
			이름 : <input type="text" name="name"> <br>
			성별 : <input type="text" name="sex">	<br>
			경력 : <input type="text" name="career"> <br>
			사진 : <input type="text" name="photo">
		</fieldset>
		<input type="submit" value="신청" />
	</form>
</body>
</html>