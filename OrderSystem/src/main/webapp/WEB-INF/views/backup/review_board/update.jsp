<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script>
	$(function() {

		$('#summernote').summernote(
				{
					disableDragAndDrop : false,
					height : 600,
					fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
							'Comic Sans MS', 'Courier New', ],
					fontNamesIgnoreCheck : [ '맑은고딕' ],
					focus : true,

					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								sendFile(files[i], this);
							}
						}
					}

				});

	});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);

		$.ajax({
			data : form_data,
			type : "POST",
			url : '${pageContext.request.contextPath}/review_board/profileUpload',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				$(el).summernote('editor.insertImage',
						'${pageContext.request.contextPath}' + img_name);
			}
		});
	}
</script>

<!-- 첨부파일 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/guupload/css/guupload.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/guupload/guUploadManager.js"></script>
<script type="text/javascript">
	var guManager = null;

	window.onload = function() {
		var option = {
			listtype : "thumbnail",
			fileid : "guupload",
			uploadURL : "upload",
			form : document.form1
		}
		guManager = new guUploadManager(option);
	}

	function formSubmit() {
		guManager.uploadFiles();
	}
</script>
</head>
<body>
	<h1>후기 수정</h1>
	<form id="form1" name="form1" action="update?${_csrf.parameterName}=${_csrf.token}" method="post"
		enctype="multipart/form-data">
		<sec:csrfInput />
		<input type="hidden" name="reviewId"
			value="${item.reviewId == null ?0 : item.reviewId}">
		<table>
			<tr>
				<td><label>제목</label></td>
				<td><input type="text" name="reviewTitle"
					value="${item.reviewTitle}"></td>
			</tr>
			
			<tr>
				<td><label>내용</label></td>
				<td><textarea id="summernote" name="reviewContents">${item.reviewContents}</textarea></td>
			</tr>

			<tr>
				<td><label>첨부파일</label></td>
				<td><div id="guupload" class="guupload"
						style="width: 500px; height: 120px;"></div></td>
			</tr>
		</table>
		<input type="submit" value="등록" onclick='formSubmit()' />
	</form>
</body>
</html>