<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
</script>
<title>전체메뉴</title>
</head>
<header>
<jsp:include page="../gnb/header.jsp" flush="true" />
<script>
	function fn_formSubmit(page) {
		
		if(page == undefined){
			document.getElementById('page').value = 1;
			document.getElementById('form1').submit();
		}else{
			document.getElementById('page').value = page;
			document.getElementById('form1').submit();	
		}
		
	}
</script>
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
		<c:if test="${searchVO.totalPage>1}">
			<c:if test="${searchVO.page>1}">
				<a href="javascript:fn_formSubmit(1);">처음</a>
				<a href="javascript:fn_formSubmit(${searchVO.page-1});">이전</a>
			</c:if>
<!-- 			<div class="paging"> -->
				<c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1">
					<c:url var="pageLink" value="list">
					<c:param name="page" value="${i}"/>
					</c:url>
						<c:choose>
						<c:when test="${i eq searchVO.page}">
							<c:out value="${i}"/>
						</c:when>
						<c:otherwise>
							<a href="javascript:fn_formSubmit(${i});"><c:out value="${i}" /></a>
						</c:otherwise>
						</c:choose>
				</c:forEach>
<!-- 			</div> -->
			<c:if test="${searchVO.totalPage>searchVO.page}">
				<a href="javascript:fn_formSubmit(${searchVO.page+1});">다음</a>
				<a href="javascript:fn_formSubmit(${serachVO.totalPage});">끝</a>
			</c:if>
		</c:if>
	</div>
	<form id="form1" name="form1" method="post">
		
		<input type="hidden" name="page" id="page" value="" />
		<div>
			<input type="checkbox" name="searchType" value="menu_name"
			<c:if test="${fn:indexOf(searchVO.searchType,'menu_name') != -1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType1">메뉴이름</label>
			<input type="checkbox" name="searchType" value="menu_photo"
			<c:if test="${fn:indexOf(searchVO.searchType,'menu_photo') != -1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType2">메뉴사진</label>
			<input type="text" name="searchKeyword" 
			style="width:150px;" maxlength="50" 
			value='<c:out value="${searchVO.searchKeyword}"/>'
			onkeydown="if(event.keyCode == 13) {fn_formSubmit();}">
			<input type="button" name="btn_search" value="검색" class="btn_sch" onclick="fn_formSubmit();">
		</div>
	</form>
	<a href="add">메뉴추가</a>
	<a href="../">메인으로</a>
</body>
</html>