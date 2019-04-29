<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>회원가입</title>
<script>
var obj;

	$(document).ready(function(){
		
		Chk();
	});
	
	
	//유효성검사
	function Chk(){
		obj = document.fr;
		
		obj.username.focus();
		$("#username").blur(function(){
			if(obj.username.value.length == 0){
				document.getElementById("idchk").innerHTML = ("<span style='color:red;'>아이디를 입력해주세요</span>");
				obj.username.focus();
			}else{
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/idChk",
					data:{
						"username":obj.username.value
					},
					success:function(data){
						if(data == 0){
							document.getElementById("idchk").innerHTML = ("<span style='color:green;'>사용 가능한 아이디 입니다.</span>");
							obj.password.focus();
						}else{
							obj.username.focus();
							document.getElementById("idchk").innerHTML = ("<span style='color:red;'>이미 사용중인 아이디 입니다.</span>");
						}
					}
				});
			}	
		});
		

		$("#password").blur(function(){
			if(obj.password.value.length == 0){
				document.getElementById("pwchk").innerHTML = ("<span style='color:red;'>비밀번호를 입력해주세요</span>");
// 				obj.password.focus();			
			}else{
				document.getElementById("pwchk").innerHTML = ("");
				obj.repassword.focus();
			}
		});
		
		$("#repassword").blur(function(){
			if(obj.repassword.value.length == 0){
				document.getElementById("rePwchk").innerHTML = ("<span style='color:red;'>비밀번호를 다시 입력해주세요</span>");
// 				obj.repassword.focus();			
			}else if(obj.password.value == obj.repassword.value){
				console.log(obj.repassword.value);
				document.getElementById("rePwchk").innerHTML = ("<span style='color:green;'>비밀번호가 일치합니다.</span>");
				$("#SignUp").click(function(){
					if(obj.password.value.length > 0 && repassword.value.length > 0){
						if(obj.password.value == obj.repassword.value){
							obj.submit();
						}
					}
				});
			}else{
				obj.repassword.focus();
				obj.repassword.value = "";
				document.getElementById("rePwchk").innerHTML = ("<span style='color:red;'>비밀번호를 확인 해주세요</span>");
			}
			
		});
	}
</script>
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
                        <form action="add" method="post" name="fr">
                            <ul class="join_uls">
                                <li>
                                    <ul>
                                        <li><label>User ID</label></li>
                                        <li><input type="text" id="username" name="username"></li>
                                        <li><span id="idchk"></span></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Password</label></li>
                                        <li><input type="password" id="password" name="password"></li>
                                        <li><span id="pwchk"></span></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><label>Confirm Password</label></li>
                                        <li><input type="password" id="repassword" name="repassword"></li>
                                        <li><span id="rePwchk"></span></li>
                                    </ul>
                                </li>
<!--                                 <li> -->
<!--                                     <ul> -->
<!--                                         <li><label>Nick Name</label></li> -->
<!--                                         <li><input type="text"></li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <ul> -->
<!--                                         <li><label>Email</label></li> -->
<!--                                         <li><input type="text"></li> -->
<!--                                     </ul> -->
<!--                                 </li> -->
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