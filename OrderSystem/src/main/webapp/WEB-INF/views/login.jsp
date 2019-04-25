<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>로그인화면</title>
<script>
window.onload = function(){
	document.getElementById("name").focus();
	
}
</script>
</head>
<body>
	<form method="post" action="login">
		<div>
			<label>아이디:</label>
			<input id="name" name="username" type="text">			
		</div>
		<div>
			<label>패스워드:</label>
			<input name="password" type="password">			
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
	</form>
</body>
</html>