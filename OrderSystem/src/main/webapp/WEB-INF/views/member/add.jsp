<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<title>회원가입</title>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
        <div id="sinup_container" >
                <h1>
                    THE RIGHT
                    <br>
                    EXERCISE FOR ME
                </h1>
                <div class="singup_content_box">
                    <div class="choosebox">
                        <h2>CHOOSE JOIN</h2>
                        <!--<img src="graybox.PNG" class="graybox">-->
                        <span class="graybox"></span>
                        <ul>
                            <li>Member</li>
                            <li>Trainer</li>
                        </ul>
                    </div>
                    <div class="joinbox">
                        <h2>JOIN</h2>
                        <form action="add" method="post">
                            <ul class="join_uls">
                                <li>
                                    <ul>
                                        <li><label>User ID</label></li>
                                        <li><input type="text" name="username"></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Password</label></li>
                                        <li><input type="password"  name="password"></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Confirm Password</label></li>
                                        <li><input type="password"  name="repassword"></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Nick Name</label></li>
                                        <li><input type="text"></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Email</label></li>
                                        <li><input type="text"></li>
                                    </ul>
                                </li>
                                <li>              
                                    <input type="button" id="SignUp" value="JOIN">        
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
    </body>

<!-- 	<center> -->
<!-- 		<h1>회원가입 페이지</h1> -->
<!-- 		<form action="add" method="post"> -->
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<td>아이디</td> -->
<!-- 					<td><input type="text" name="username"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>비밀번호</td> -->
<!-- 					<td><input type="password" name="password"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td colspan="2" align="center"><input type="submit" -->
<!-- 						value="가입하기"></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->

<!-- 		</form> -->
<!-- 	</center> -->
</body>
</html>