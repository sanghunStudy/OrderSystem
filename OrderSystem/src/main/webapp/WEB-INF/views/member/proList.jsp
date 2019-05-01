<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<script>
function grantDo(code) {
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/member/grant',
		data : {
			"username" : code
		},
		success : function(data) {
			if (data == 'success') {
				alert("11");
			}
		}
	});
};
</script>
<body>
<h1>트레이너 신청 목록</h1>
	<table>
		<tr>
			<th>username</th>
			<th>name</th>
			<th>sex</th>
			<th>photo</th>
			<th>career</th>
			<th></th>
		</tr>
		<c:choose>
			<c:when test="${proList.size() > 0}">
				<c:forEach var="item" items="${proList}">
					<tr>
						<td>${item.username}</td>
						<td>${item.name}</td>
						<td>${item.sex}</td>
						<td>${item.photo}</td>
						<td>${item.career}</td>
						<td><input name=username type="button" value="수락" onclick="grantDo('${item.username}');" /></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr colspan="5">
					<td>등록된 트레이너가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>