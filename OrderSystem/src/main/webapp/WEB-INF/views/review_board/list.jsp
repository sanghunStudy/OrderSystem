<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<h1>후기게시판</h1>
	<table border="1">
		<tr>
			<th>후기번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>별점</th>
		</tr>
		<c:choose>
			<c:when test="${list.size() > 0}">
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.reviewId}</td>
						<td><a href="view?reviewId=${item.reviewId}">${item.reviewTitle}</a></td>
						<td>${item.id}</td>
						<td><fmt:formatDate value="${item.reviewDate}"
									pattern="yyyy-MM-dd" /></td>
						<td>${item.reviewViews}</td>
						<td></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">등록 된 게시물이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div>
		<c:if test="${SearchVO.totalPage>1}">
			<c:if test="${SearchVO.page>1}">
				<a href="javascript:fn_formSubmit(1);">처음</a>
				<a href="javascript:fn_formSubmit(${SearchVO.page-1});">이전</a>
			</c:if>

			<c:forEach var="i" begin="${SearchVO.pageStart}"
				end="${SearchVO.pageEnd}" step="1">
				<c:choose>
					<c:when test="${i eq SearchVO.page}">
						<c:out value="${i}" />
					</c:when>
					<c:otherwise>
						<a href="javascript:fn_formSubmit(${i});"><c:out value="${i}" /></a>
					</c:otherwise>
				</c:choose>
				<c:if test="${not status.last}">|</c:if>
			</c:forEach>

			<c:if test="${SearchVO.totalPage > SearchVO.page}">
				<a href="javascript:fn_formSubmit(${SearchVO.page+1});">다음</a>
				<a href="javascript:fn_formSubmit(${SearchVO.totalPage});">마지막</a>
			</c:if>


		</c:if>
	</div>

	<form id="form1" name="form1" method="post">
		<%-- 		<jsp:include page="../gnb/paging.jsp" flush="true" /> --%>
		<input type="hidden" name="page" id="page" value="" />
		<div>
			<input type="checkbox" name="searchType" value="notice_title"
				<c:if test="${fn:indexOf(SearchVO.searchType, 'review_title')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType1">제목</label> <input
				type="checkbox" name="searchType" value="notice_contents"
				<c:if test="${fn:indexOf(SearchVO.searchType, 'review_contents')!=-1}">checked="checked"</c:if> />
			<label class="chkselect" for="searchType2">내용</label> <input
				type="text" name="searchKeyword"
				value='<c:out value="${SearchVO.searchKeyword}"/>'
				onkeydown="if(event.keyCode == 13) {fn_formSubmit();}"> <input
				name="btn_search" value="검색" class="btn_sch" type="button"
				onclick="fn_formSubmit();" />

		</div>
	</form>
	<a href="add">후기등록</a>
	<a href="..">처음으로</a>
</body>
</html>