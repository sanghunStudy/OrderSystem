<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 명단</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function(){
var applyBtn = document.getElementById("applyBtn");
applyBtn.onclick = 
	function selectUserbI(){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/trainer/selectUserbI",
			success:function(data){
				if(data == 0){
					alert("회원 기초 정보를 등록하세요");
				}else{
					alert("등록");
				}
			}
		});
	}
}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${trainerList.size() > 0}">
			<c:forEach var="item" items="${trainerList}">
				${item.username}<button id="applyBtn" value="${item.username}">pt신청</button>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>등록된 트레이너가 없습니다.</p>
		</c:otherwise>
	</c:choose>
</body>
</html>