<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	data-layout-decorate="~{sample/layout/sampleLayout}"
	>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script th:inline="javascript">
/*<![CDATA[*/
$(function () {


});

/*]]>*/
</script>
<style>
</style>
</head>
<body>
	<h1>트레이너 프로필 작성</h1>
	<form action="promotion" method="post" enctype="multipart/form-data">
		<fieldset style ="width:50">
			<legend>트레이너 프로필 작성</legend>
			이름 : <input type="text" name="name"> <br>
			성별 : <input type="text" name="sex">	<br>
			경력 : <input type="text" name="career"> <br>
			사진 : <input type="file" name="profile">
		</fieldset>
		<input type="submit" value="신청" />
	</form>
</body>
</html>