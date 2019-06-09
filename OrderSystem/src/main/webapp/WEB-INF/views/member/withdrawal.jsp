<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var obj = document.withdrawalFrm;
	$(".withdrawal-btn").click(function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/LoginChk",
			data:{
				"username":obj.username.value,
				"password":obj.password.value
			},
			success:function(res){
				console.log(res);
				if(res == 1){
					var delConfirm = confirm('정말 탈퇴 하시겠습니까?');
					   if (delConfirm) {
					      alert('탈퇴 되었습니다.');
					      $("[name='withdrawalFrm']").submit();
					   }
					   else {
					      alert('탈퇴가 취소 되었습니다.');
					   }
				}else{
					alert("비밀번호를 확인해주세요");
				}
			}
		});
	});
});
</script>
</head>
<body>
	<div>
		<form action="delete" method="post" name="withdrawalFrm">
			<div>
				<label>아이디</label>
				<span>${username}</span>
				<input type="hidden" name="username" value="${username}">
			</div>
			<div>
				<label>비밀번호확인</label>
				<input type="password"  name="password">
			</div>
			<div>
				<button type="button" class="withdrawal-btn">탈퇴</button>
			</div>
		</form>	
	</div>
</body>
</html>