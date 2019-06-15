<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 기초정보 조사 의견조사</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function(){
	
	$.ajax({
		type : "GET",
		url : "/kopo/trainer/selectUserbI",
		success : function(data) {
			if (data == 0) {
				var bIChk = confirm("회원 기초정보 조사를 하시겠습니까?");
				if(bIChk == true){
					location.href="${pageContext.request.contextPath}/member/basicInformation";
				}else if(bIChk == false){
					location.href="${pageContext.request.contextPath}/";
				}
			}else if(data == 2) {
					location.href="${pageContext.request.contextPath}/";
			}
		}
	});

	
}
</script>
</head>
<body>

</body>
</html>