<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/gnb/head.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gnb.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

	<header id="header_nav">
		<div style="width: 1200px; margin: 0 auto;">
			<ul class="login">
				<c:choose>
					<c:when
						test="${sessionScope.user eq null and sessionScope.admin eq null and sessionScope.trainer eq null}">
						<%-- 						<li><a href="<c:url value="/login"/>" id="openMask">LOGIN</a></li> --%>
						<li><a href="#" class="openMask">LOGIN</a></li>
						<li><a href="${pageContext.request.contextPath}/member/add">JOIN</a></li>
					</c:when>
					<c:otherwise>
						<li><a>${sessionScope.user}${sessionScope.trainer}${sessionScope.admin}</a></li>
						<li><a href="member/MyPage">MY PAGE</a></li>
						<li><a href="logout">LOGOUT</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="${pageContext.request.contextPath}/notice/list">FAQ</a></li>
			</ul>
			<div id="lnb">
				<h1>
					<a id="tbqjf" class="animate one"
						href="${pageContext.request.contextPath}/"> <span>T</span><span>r</span><span>a</span><span>i</span><span>n</span><span>e</span><span>r</span><span>B</span><span>o</span><span>t</span>
					</a>
					<%-- <a href="${pageContext.request.contextPath}/">TRAINING BOT</a> --%>
				</h1>
				<nav>
					<ul>
						<li><a href="#">TRAINING</a></li>
						<li><a href="#">ROUTINE</a></li>
						<li><a href="#">MENU</a></li>
						<li><a href="${pageContext.request.contextPath}/trainer/list">PERSONAL TRAINER</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<script>
			$(document).ready(function(){
				var obj = document.loginFrom;
				
				$("#login_btn").click(function(){
					
						if(obj.username.value.length == 0 || obj.password.value.length == 0){
							$(".window").css("height","380px");
							document.getElementById("LoginChk").innerHTML = ("<span style='color:red;'>아이디와 비밀번호를 입력해주세요</span>");
// 							obj.username.focus();
						}else{
							$.ajax({
								type:"POST",
								url:"${pageContext.request.contextPath}/LoginChk",
								data:{
									"username":obj.username.value,
									"password":obj.password.value
								},
								success:function(data){
									if(data == 0){
										$(".window").css("height","380px");
										document.getElementById("LoginChk").innerHTML = ("<span style='color:green;'>아이디 또는 비밀번호를 다시 확인하세요.</span>");
										obj.password.focus();
									}else{
										obj.submit();
									}
								}
							});
						}
				});
			});
		</script>
		<!-- 		로그인 레이어 팝업 -->
		<div id="wrap">
			<div id="container">
				<div id="mask"></div>
				<div class="window">
						<div class="login_box">
<!-- 							<h1 id="login_title">TRAINING BOT</h1> -->
<!-- 							<a href="#" class="close">X</a> -->
							<div class="login_input">
								<form method="post" name="loginFrom" action="${pageContext.request.contextPath}/login">
								<ul>
									<li><i class="far fa-user"></i><input type="text" id="loginUsername" name="username" placeholder="User name" class="inputId"></li>
									<li><hr></li>
									<li class="pw"><i class="material-icons">lock_open</i><input type="password" id="loginPassword" name="password" placeholder="Password" class="inputPw"></li>
									<li><hr></li>
									<li id="LoginChk"></li>
									<li><button type="button" class="login_btn" id="login_btn" value="LogIn">LogIn</button></li>
								</ul>
								</form>
							</div>
						</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>