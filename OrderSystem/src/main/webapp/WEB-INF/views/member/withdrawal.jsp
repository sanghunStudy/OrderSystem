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
<style>
@import
   url('https://fonts.googleapis.com/css?family=Anton|Lobster|Noto+Sans+KR:400,500,700|Noto+Sans:400,700|Poppins:300,400,600,700,900|Ubuntu&display=swap&subset=korean')
   ;
  
body{
	background:black;
}
.withdrawal-wrap{
	width:1024px;
	margin:0 auto;
	margin-top:150px;
	color:#fff;
}
.withdrawal-contents{
    font-family: 'Noto Sans kr';
    padding-top: 150px;
	height:500px;
	width:500px;
	margin:0 auto;
}

.withdrawal-contents div{
	margin-bottom: 20px;
}

.withdrawal-contents label{
    font-size: 21px;
	font-weight:560;
}

.withdrawal-contents-box{
	border-bottom: 0.8px solid gray;
    border-radius: 4px;
    padding:10px 0px 20px 20px;
}

.withdrawal-contents-box input{
	font-size:12px;
	border-radius: 5px;
}

.withdrawal-contents-box p{
    margin-bottom: 15px;
}
.btn-collection {
	--color: #ff7f82; 
	--hover: #ffdc7f; 
	--chartColor: #1e90ff;
}


.menti-btn {
   	border-radius: 5px;
    background: none;
    border: 1px solid;
    font: inherit;
    line-height: 1;
    margin: auto;
    font-size: 18px;
    font-weight: 660;
    padding: 0.8em 3em;
    justify-content: center;
    align-content: center;
    align-items: center;
    text-align: center;
    display: flex;
    transition: 0.25s;
}
.chart-menti {
	color: var(--chartColor);
}
.chart-menti:hover, .chart-menti:focus {
	color:#fff;
	border-color: var(--chartColor);
	box-shadow: inset -5em 0 0 0 var(--chartColor), inset 5em 0 0 0
		var(--chartColor);
}

.withdrawal-btn-box{
	margin-top: 100px;
}

.withdrawal-p-box{
	margin-top: 50px;
    line-height: 30px;
}

.withdrawal-title-box{
    margin-left: 50px;
}
</style>
</head>
<%@ include file="../gnb/sidebar.jsp"%>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
	<div class="withdrawal-wrap">
		<div class="withdrawal-title-box">
		<h1>회원 탈퇴</h1>
			<div class="withdrawal-p-box">
				<p>회원 탈퇴를 진행하실 경우 더 이상 트레이너 봇에서 제공하는 서비스를 받을 수 없습니다.</p>
				<p>탈퇴한 후 기존 회원정보는 삭제 되며 저장 및 복구 되지 않습니다.</p>
			</div>
		</div>
		<form action="delete" method="post" name="withdrawalFrm">
			<div class="withdrawal-contents">
				<div class="withdrawal-contents-box">
					<p><label>아이디</label></p>
					<span>${username}</span>
					<input type="hidden" name="username" value="${username}">
				</div>
				<div class="withdrawal-contents-box">
					<p><label>비밀번호확인</label></p>
					<input type="password"  name="password">
				</div>
				<div class="withdrawal-btn-box">
					<button type="button" class="withdrawal-btn chart-menti btn-collection menti-btn">탈퇴</button>
				</div>
			</div>
		</form>	
	</div>
</body>
</html>