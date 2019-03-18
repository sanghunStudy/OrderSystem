<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>로오 그인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script type="text/javascript"> 
		function doLogin() {
			if(frm.j_username.value == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			if(frm.j_password.value == "") {
				alert("패스워드를 입력해주세요.");
				return;
			}
			
			frm.submit();
		}
		
	</script>	
</head>
<body>
<!--------------------------------- 탑 메뉴  ------------------------------------>
<br>
<br>
<div class="top_menu">
	<div class="top_banner_left">&nbsp;&nbsp;<Font style="font-size:30px;">로오그인</Font>
	&nbsp;&nbsp;&nbsp;&nbsp;
</div>

<!--------------------------------- 로그인 ------------------------------------>

<br>
<br>
<br>
<br>
<br>

	<section class="loginform cf">
		<form name="frm" action="j_spring_security_check" method="post">
			<ul>
				<li>
					<label for="userID">ID</label>
					<input id = "userID" type="userID" name="username" placeholder="ID" required>
				</li>
				<li>
					<label for="password">Password</label>
					<input id = "password" type="password" name="password" placeholder="PASSWORD" required></li>
				<li>
					<input type="submit" value="로그인" onclick="doLogin()"/>
				</li>
			</ul>
			
			 <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
 
		</form>
		
	</section>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

</body>
</html>
