<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
		var searchTypeCheck = false;
		var arr_SearchType = document.getElementsByName("searchType");
		for(var i=0; i < arr_SearchType.length; i++) {
			if(arr_SearchType[i].checked == true) {
				searchTypeCheck = true;
				break;
			}
		}
		
		if(searchTypeCheck == false) {
			if(page == undefined) {
				alert("검색할 종류를 선택해주세요");
				return false;
			} else{
				document.getElementById('page').value = page;
				document.getElementById('form1').submit();
			} 
		} 
		else {
			if(page == undefined){
				document.getElementById('page').value = 1;
				document.getElementById('form1').submit();
			}else{
				document.getElementById('page').value = page;
				document.getElementById('form1').submit();	
			}
		}
	}
</script>
</header>
<body>
	<h1>전체메뉴입니다</h1>
	<table>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${Nlist.size() > 0}">
				<c:forEach var="Nitem" items="${Nlist}" begin="0" end="5" step="1">
					<tr>
						<td style="color:#ff0000;">공지</td>
						<td><a href="${pageContext.request.contextPath}/notice/view?nid=${Nitem.noticeId}">${Nitem.noticeTitle}</a></td>
						<td><fmt:formatDate value="${Nitem.noticeDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${list.size() > 0}">
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.menuId}</td>
						<td id="menuName${item.menuId}"><a href="view?menuId=${item.menuId}">${item.menuName}</a><a>[${item.cnt}]</a></td>
						<td id="menuDate${item.menuId}"><fmt:formatDate value="${item.menuDate}" pattern="yyyy-MM-dd"/></td>
						<td><button type="button" onclick="cartAdd(${item.menuId});">담기</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>등록된 메뉴가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
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
		<sec:csrfInput />
		<div>
			<input type="checkbox" name="searchType" value="menu_name"
			<c:if test="${fn:indexOf(searchVO.searchType,'menu_name') != -1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType1">메뉴이름</label>
			<input type="checkbox" name="searchType" value="menu_content"
			<c:if test="${fn:indexOf(searchVO.searchType,'menu_content') != -1}">checked="checked"</c:if>/>
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
	<script>
		function changeSelect() {
			document.getElementById("selectForm").submit();
		}
	</script>
	<form id="selectForm" name="selectForm">
		<select name="displayRowCount" onchange="changeSelect()">
			<option value="10"
				${searchVO.displayRowCount == 10?'selected="selected"':''}>
				10개</option>
			<option value="20"
				${searchVO.displayRowCount == 20?'selected="selected"':''}>
				20개</option>
			<option value="30"
				${searchVO.displayRowCount == 30?'selected="selected"':''}>
				30개</option>
		</select>
	</form>
</body>
</html>