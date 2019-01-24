<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
	<script>
	$(function(){
		
		$('#summernote').summernote({
			disableDragAndDrop:false,
			height: 600,
			fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
			focus: true,
			
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
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
        	data: form_data,
        	type: "POST",
        	url: '${pageContext.request.contextPath}/notice/profileUpload',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', '${pageContext.request.contextPath}'+img_name);
        	}
      	});
    }

</script>
</head>
<body>
	<h1>summernote</h1>
<!-- 	<form name="writeForm" action="./summernote_insert.jsp" method="post">
		<textarea >Hello Summernote</textarea>
    </form> -->
    
    <form id="form1" name="form1" action="add" method="post" enctype="multipart/form-data">
 	<input type="hidden" name="noticeId" value="${item.noticeId == null ?0 : item.noticeId}">
 	<table>
	<tr>
	<td><label>제목</label></td>
	<td><input type="text" name="noticeTitle" value="${item.noticeTitle}"></td>
	</tr>
	
	<tr>
	<td><label>내용</label></td>
	<td><textarea id="summernote" name="noticeContents">${item.noticeContents}</textarea></td>
	</tr>
	</table>
	<input type="submit" value="등록"/>	
	</form>	
    
</body>
<%-- 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/guupload/css/guupload.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/guupload/guUploadManager.js"></script>
<script type="text/javascript">
var guManager=null;

window.onload = function() {
	var option = {
			listtype: "thumbnail",
			fileid: "guupload",
			uploadURL: "upload",
			form: document.form1
	}
	guManager = new guUploadManager(option);
}	

function formSubmit(){
	guManager.uploadFiles();
}
</script>
</head>
<body>

 	<form id="form1" name="form1" action="add" method="post" enctype="multipart/form-data">
 	<input type="hidden" name="noticeId" value="${item.noticeId == null ?0 : item.noticeId}">
 	<table>
	<tr>
	<td><label>제목</label></td>
	<td><input type="text" name="noticeTitle" value="${item.noticeTitle}"></td>
	</tr>
	
	<tr>
	<td><label>내용</label></td>
	<td><textarea rows="5" cols="50" name="noticeContents">${item.noticeContents}</textarea></td>
	</tr>
	
	<tr>
	<td><label>첨부파일</label></td>
	<td><div id="guupload" class="guupload" style="width: 500px; height: 120px;"></div></td>
	<c:choose>
		<c:when test="${file.size() > 0}">
			<c:forEach items="${file}" var="item">
				<td>${item.fileno}</td>
				<td>${item.realname}</td>
				<td>${item.filename}</td>
				<td>${item.filesize}</td>
			</c:forEach>
		</c:when>
	</c:choose>
	<td></td>
	</tr>
	</table>
	<input type="button" value="등록" onclick='formSubmit()'  />	
	</form>	
	
</body>
 --%>
</html>