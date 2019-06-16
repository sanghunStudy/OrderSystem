<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
</script>
<title>질문게시판</title>
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>
<header>
	<%-- <jsp:include page="../gnb/header.jsp" flush="true" /> --%>
	<jsp:include page="../gnb/head.jsp" flush="true" />
	<link href="<c:url value="/resources/css/Question/list-style.css" />"
		rel="stylesheet">
	<script>
		function fn_formSubmit(page) {
			var searchTypeCheck = false;
			var arr_SearchType = document.getElementsByName("searchType");
			for (var i = 0; i < arr_SearchType.length; i++) {
				if (arr_SearchType[i].checked == true) {
					searchTypeCheck = true;
					break;
				}
			}
			var searchContent = $('.search_keyword').val();

			if (searchTypeCheck == false) {
				if (page == undefined) {
					alert("검색할 종류를 선택하세요");
					return false;
				} else {
					document.getElementById('page').value = page;
					document.getElementById('form1').submit();
				}
			} else {
				if (page == undefined) {
					if (searchContent == null || searchContent == "") {
						alert("검색할 내용을 입력하세요");
						return false;
					} else {
						document.getElementById('page').value = 1;
						document.getElementById('form1').submit();
					}
				} else {
					document.getElementById('page').value = page;
					document.getElementById('form1').submit();
				}
			}

		}
	</script>
	<script>
		$(function() {
			/* 	$("#searchType1").click(function(){
					if($("#searchType1").prop("checked")){
						$("input[type=checkbox]").prop("checked",true);
					}else{
						$("input[type=checkbox]").prop("checked",false);
					}
				});	
				$("#searchType2").click(function(){
					if($("#searchType2").prop("checked")){
						$("input[type=checkbox]").prop("checked",true);
					}else{
						$("input[type=checkbox]").prop("checked",false);
					}
				});	 */
		});
		function chkDel() {
			$("#chkDel").submit();

		}
	</script>
	<script>
		$(document).ready(function() {
			$('#hashTag').on("keyup",function(e){
				if(e.key === "Enter" || e.key === " " || (new RegExp(/[^a-zA-Z가-힣]/)).test(e.key)) {
					hashTagSubmit();
				}
			});
			var hashType = $('[name=hashTagCheck]').val();
// 			console.log(hashType);
// 			console.log(hashType == "hash_tag");
			if(hashType == "hash_tag"){
				var hashTag_searchKeyword = $('.search_keyword').val();
				$('.search_keyword').val("");
				$('.hashTag_searchKeyword').append('<li class="addTag">#'+ hashTag_searchKeyword +'</li>');
			}
			$('#searchType3').click(function() {
				if($('#hashTag').css("display") == "none"){
					$('#hashTag').css("display","block");
					$('.search_area').css("display","none");
				} else {
					$('#hashTag').css("display","none");
					$('.search_area').css("display","block");
				}
			})
		});
		function hashTagSubmit() {
			
// 			var searchTypeCheck = false;
// 			var searchType ="";
// 			var arr_SearchType = document.getElementsByName("searchTypeCheck");
// 			console.log(arr_SearchType);
// 			for (var i = 0; i < arr_SearchType.length; i++) {
// 				if (arr_SearchType[i].checked == true) {
// 					searchTypeCheck = true;
// 					searchType = arr_SearchType[i].value;
// 					break;
// 				}
// 			}
// 			console.log(searchType);
// 			console.log(page);
// 			$('#searchType').val(searchType);
// 			if(searchTypeCheck == false){
// 				alert("검색할 종류를 선택하세요");
// 				return false;
// 			}
			if (page == undefined) {
				if ($('#hashTag').val() == null || $('#hashTag').val() == "") {
					alert("검색할 내용을 입력하세요");
					return false;
				} else {
					document.getElementById('page').value = 1;
					document.getElementById('hashTagForm').submit();
				}
			} else {
				document.getElementById('page').value = page;
				document.getElementById('hashTagForm').submit();
			}
		}
		
	</script>
</header>
<body>
	<div class="container">
		<div>
			<a class="subtitle" href="${pageContext.request.contextPath}/question/list">질문게시판</a>
		</div>
		<script>
			function changeSelect() {
				document.getElementById("selectForm").submit();
			}
		</script>
		<div class="middle_zone">
			<ul class="hashTag_searchKeyword"></ul>
			<form id="selectForm" name="selectForm">
				<select name="displayRowCount" onchange="changeSelect()"
					class="amount_select">
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
			<form id="form1" name="form1" method="post">

				<input type="hidden" name="page" id="page" value="" />
				<div class="search_area">
					<div class="search_type">
						<input type="checkbox" name="searchType" value="question_name"
							id="searchType1" class="cb1" checked="checked"
							<c:if test="${fn:indexOf(searchVO.searchType,'question_name') != -1}">checked="checked"</c:if> />
						<label class="chkselect" for="searchType1" id="concheck">제목</label> <input
							type="checkbox" name="searchType" value="question_content"
							id="searchType2" class="cb2" checked="checked"
							<c:if test="${fn:indexOf(searchVO.searchType,'question_content') != -1}">checked="checked"</c:if> />
						<label class="chkselect" for="searchType2" id="concheck2">컨텐츠</label>
					</div>
					<input type="text" name="searchKeyword" class="search_keyword" placeholder="검색어를 입력하세요"
						maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>'
						onkeydown="if(event.keyCode == 13) {fn_formSubmit();}"> <input
						type="button" name="btn_search" value="" class="search_btn"
						onclick="fn_formSubmit();">
				</div>
			</form>
			<input type="hidden" id="hashTagCheck" name="hashTagCheck" value="${searchVO.searchType}">
			<form id="hashTagForm" name="hashTagForm" method="post">
				<div>
					<input type="hidden" name="searchType" value="hash_tag">
<!-- 					<input type="hidden" name="searchType" id="searchType" value=""> -->
					<input type="text" name="searchKeyword" id="hashTag" maxlength="50" placeholder="#해시태그로 검색">
				</div>
			</form>
			<ul class="searchType-cboxtags">
    			<li><input type="checkbox" name="searchTypeCheck" id="searchType3"><label for="searchType3">hash-tag</label></li>
    		</ul>
			<hr class="boundaryline">
		</div>
		<table class="posts">
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${list.size() > 0}">
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.questionId}</td>
							<td id="questionName">
								<div class="cell1">
									
									<div class="overName">
										<a href="view?questionId=${item.questionId}">
											&emsp;${item.questionName}</a>
									</div>
									<div class="count">[${item.cnt}]</div>
								</div>
								 <c:if test="${item.imgChk}">
									<i class="fas fa-image"></i>
								</c:if>
							</td>
							<td>${item.id}</td>
							<td id="questionDate${item.questionId}"><fmt:formatDate
									value="${item.questionDate}" pattern="yyyy-MM-dd" /></td>
							<td>${item.questionViews}</td>
							<%-- 						<td><button type="button" onclick="cartAdd(${item.menuId});">담기</button></td> --%>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">등록된 질문이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="paging_btns">
			<div class="btn_ui">
				<c:if test="${searchVO.totalPage>1}">
					<c:if test="${searchVO.page>1}">
						<div class="page_num">
							<a href="javascript:fn_formSubmit(1);"><<</a>
						</div>
						<div class="page_num">
							<a href="javascript:fn_formSubmit(${searchVO.page-1});"><</a>
						</div>
					</c:if>
					<!-- 			<div class="paging"> -->
					<c:forEach var="i" begin="${searchVO.pageStart}"
						end="${searchVO.pageEnd}" step="1">
						<c:url var="pageLink" value="list">
							<c:param name="page" value="${i}" />
						</c:url>
						<c:choose>
							<c:when test="${i eq searchVO.page}">
								<div class="page_num">
									<div class="nowpage">
										<c:out value="${i}" />
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<a href="javascript:fn_formSubmit(${i});"><div
										class="page_num">
										<c:out value="${i}" />
									</div></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 			</div> -->
					<c:if test="${searchVO.totalPage>searchVO.page}">
						<div class="page_num">
							<a href="javascript:fn_formSubmit(${searchVO.page+1});">></a>
						</div>
						<div class="page_num">
							<a href="javascript:fn_formSubmit(${searchVO.totalPage});">>></a>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
		<c:if test="${login!=null}">
			<div class="write">
				<a href="add">글쓰기</a>
			</div>
		</c:if>
	</div>
</body>
</html>