<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체메뉴</title>
</head>
<header>
<jsp:include page="../gnb/header.jsp" flush="true" />
</header>
<body>
	<h1>전체메뉴입니다</h1>
	<ul>
		<c:choose>
			<c:when test="${list.size() > 0}">
				<c:forEach var="item" items="${list}">
					<li>
						<span id="menuName${item.menuId}">${item.menuName}</span>
						<span>${item.menuPhoto}</span>
						<span id="menuPrice${item.menuId}">${item.menuPrice}</span>
						<span><a href="update?menuId=${item.menuId}">변경</a></span>
						<span><a href="delete?menuId=${item.menuId}">삭제</a></span>
						<button type="button" onclick="cartAdd(${item.menuId});">담기</button>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li>등록된 메뉴가 없습니다.</li>
			</c:otherwise>
		</c:choose>
	</ul>
	<div>
		<c:if test="${pageVO.totalPage>1}">
			<div class="paging">
				<c:forEach var="i" begin="${pageVO.pageStart}" end="${pageVO.pageEnd}" step="1">
					<c:url var="pageLink" value="list">
					<c:param name="page" value="${i}"/>
					</c:url>
						<a href="${pageLink}"><c:out value="${i}"></c:out></a>
				</c:forEach>
			</div>
		</c:if>
	</div>
	<a href="add">메뉴추가</a>
	<a href="../">메인으로</a>
</body>
</html>