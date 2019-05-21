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
function selectUserbI(managerId){
	var test =	this.value;
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/trainer/selectUserbI",
			success:function(data){
				if(data == 0){
					alert("회원 기초 정보를 등록하세요");
				}else if(data == 2){
					alert("신청 내역이 존재합니다.");
				}else{
					console.log("tq");
					document.getElementById("managerID").value = managerId;
					document.getElementById("trainer").submit();
					
				}
			}
		});
	}
</script>
</head>
<body>
	<h1>트레이너 목록</h1>
	<c:choose>
		<c:when test="${trainerList.size() > 0}">
			<c:forEach var="item" items="${trainerList}">
				${item.username}
				<c:if test="${user != null}">
					<button onclick="selectUserbI('${item.username}')" value="${item.username}">pt신청</button>
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<p>등록된 트레이너가 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<form action="apply" method="post" id="trainer" hidden="true">
	<input id="managerID" type="hidden" name="manager" value="">
	</form>
</body>
</html>