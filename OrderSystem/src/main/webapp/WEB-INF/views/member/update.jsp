<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
body{
 background-color: black;
}
.update-wrap{
color:white;
width:1024px;
margin:0 auto;
margin-top:150px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- 여기에 스크립트 추가 -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <script>
        $(document).ready(function() {
        	
        	var obj = document.updateFrm;
            $(".update-submit").click(function() {
            	var currentPw = $(".current-password").val();
            	$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/LoginChk",
					data:{
						"username":obj.username.value,
						"password":currentPw
					},
					success:function(data){
						if(data == 0){
							document.getElementById("pwChk").innerHTML = ("<span style='color:red;'>비밀번호를 다시 확인하세요.</span>");
							$(".current-password").focus();
						}else{
							$(".current-password").attr("readonly",true);
							document.getElementById("pwChk").innerHTML = ("<span style='color:green;'>새로운 비밀번호를 입력하세요</span>");
							$(".new-password").focus();
							var newPw = $(".new-password").val();
							var reNewPw = $(".re-new-password").val();
							console.log(newPw.length);
							if(newPw.length == 0){
								alert("새 비밀번호를 입력해주세요");
									
							}else if(reNewPw.length == 0){
								alert("새 비밀번호를 다시 확인해주세요");
								$(".re-new-password").focus();
							}else if(newPw === reNewPw){
								VerifyRecaptcha();
							}else{
								alert("새 비밀번호를 확인해주세요");
							}
							
						}
					}
				});
            	


            });
        });
    	function VerifyRecaptcha(){
            $.ajax({
                url: '${pageContext.request.contextPath}/member/VerifyRecaptcha',
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function(data) {
                    if(data == 0){
                    	alert("수정이 완료 되었습니다.");
               			$("[name='updateFrm']").submit();
                    }else if(data == 1){
                    	alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                    	return;
                    }else{
                    	alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		return;
                    }
                }
            });
    	}
</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
<div class="update-wrap">
<h1>회원정보수정</h1>
	<form action="update" method="post" name="updateFrm">
		<div>
			<label>User ID</label>
			<span>${item.username}</span>
			<input type="hidden" name="username" value="${item.username}">
		</div>
		<div>
			<label>Password</label>	
			<input type="password" class="current-password" placeholder="현재 비밀번호">
		</div>
		<div id="pwChk">
		</div>
		<div>
			<input type="password" class="new-password" placeholder="새 비밀번호">
			<input type="password" class="re-new-password" name="password" placeholder="새 비밀번호 확인">
		</div>
		<!--여기에 div 추가 -->
		<div class="g-recaptcha" data-sitekey="6Lft0aYUAAAAAPiRCIqh_mTsqaLySix0SFs6Yfq5"></div> 
		<button type="button" class="update-submit">수정완료</button>
	</form> 
</div>
</body>
</html>