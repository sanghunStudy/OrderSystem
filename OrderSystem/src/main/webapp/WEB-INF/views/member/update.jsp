<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberUpdate.css">
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
							document.getElementById("pwChk").innerHTML = ("<span class='update-repw-span' style='color:red;'>비밀번호를 다시 확인하세요.</span>");
							$(".current-password").focus();
						}else{
							$(".current-password").attr("readonly",true);
							document.getElementById("pwChk").innerHTML = ("<span class='update-repw-span' style='color:green;'>비밀번호가 일치합니다.</span>");
							$(".new-password").focus();
							var newPw = $(".new-password").val();
							var reNewPw = $(".re-new-password").val();
							console.log(newPw.length);
							if(newPw.length == 0){
								document.getElementById("newPwChk").innerHTML = ("<span class='update-repw-span' style='color:red;'>새로운 비밀번호를 입력하세요.</span>");
									
							}else if(reNewPw.length == 0){
								$(".re-new-password").focus();
								document.getElementById("reNewPwChk").innerHTML = ("<span class='update-repw-span' style='color:red;'>새로운 비밀번호를 확인하세요.</span>");
							}else if(newPw === reNewPw){
								alert("비밀번호가 변경 되었습니다.");
								$("[name='updateFrm']").submit();
// 								VerifyRecaptcha();
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
	<div class="contents">
	<form action="update" method="post" name="updateFrm" class="update-frm">
		<div class="update-left-box">
			<div class="tier-box">
				<img src="${pageContext.request.contextPath}/resources/images/grade/chalinger-tier-bg-none.png">
			</div>
			<div class="tier-info-box">
				<p>CHALINGER</p>
			</div>
		</div>
		<div class="update-right-box">
			<div class="update-content-box">
				<p><label>User ID</label></p>
				<span>${item.username}</span>
				<input type="hidden" name="username" value="${item.username}">
			</div>
			<div  class="update-content-box">
				<p><label>Password</label></p>	
				<input type="password" class="current-password" placeholder="  Password">
				<div id="pwChk">
				</div>
			</div>
			<div  class="update-content-box">
				<p><label>NewPassword</label></p>
				<input type="password" class="new-password" placeholder="  NewPassword">
				<div id="newPwChk">
				</div>
			</div>
			<div  class="update-content-box">
				<p><label>ConfirmPassword</label></p>
				<input type="password" class="re-new-password" name="password" placeholder="  ConfirmPassword">
				<div id="reNewPwChk">
				</div>
			</div>
			<!--여기에 div 추가 -->
	<!-- 		<div class="g-recaptcha" data-sitekey="6Lft0aYUAAAAAPiRCIqh_mTsqaLySix0SFs6Yfq5"></div>  -->
			<div class="update-content-box">
				<button type="button" class="update-submit chart-menti btn-collection menti-btn">수정완료</button>
			</div>
		</div>
	</form> 
	</div>
</div>
</body>
</html>