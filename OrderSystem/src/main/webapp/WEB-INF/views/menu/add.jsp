<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문작성페이지</title>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/menu-add.css" rel="stylesheet">
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											height : 600, // set editor height
											fontNames : [ '맑은고딕', 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', ],
											fontNamesIgnoreCheck : [ '맑은고딕' ],
											minHeight : null, // set minimum height of editor
											maxHeight : null, // set maximum height of editor
											focus : true, // set focus to editable area after initializing summernote
											callbacks : {
												onImageUpload : function(files,
														editor, welEditable) {
													for (var i = files.length - 1; i >= 0; i--) {
														sendFile(files[i], this);
													}
												}
											}

										});
					
					
						$("#menuSubmit").click(function(){
							var summernoteVal = $("#summernote").val(); 
							var imgChk;
								if($(summernoteVal).find("img").length > 0){
	// 								console.log(imgChk);
									imgChk =  true;
									$("#imgChk").val(imgChk);
									
								}
								$("#menuForm").submit();
						});
					
					});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : '${pageContext.request.contextPath}/menu/profileUpload',
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

</head>
<header>
<%-- <jsp:include page="../gnb/head.jsp" flush="true" /> --%>

</header>
<body>
<div class="container">
	<div><a class="subtitle" href="list">질문하기</a></div>
	<div class="innerbox">
	<form action="add" method="post"
		enctype="multipart/form-data" id="menuForm">
		<!-- <sec:csrfInput /> -->
		<div class="naming-box">
			<img src="${pageContext.request.contextPath}/resources/images/icon/add-search.png">
			<label> 제목 </label> <input type="text" name="menuName" class="naming">
		</div>
		<div>
			<textarea name="menuContent" id="summernote" cols="120" rows="50" value=""></textarea>
		</div>
		<div class="point-box">
			<div class="point-set">포인트 설정</div>
			<div class="point-input"><input id="point" placeholder="채택한 답변자에게 추가 포인트를 드립니다"></div>
		</div>
		<div>
			<input type="hidden" name="imgChk" id="imgChk" value="false">
		</div>
		<div class="buttons">
<!-- 			<input type="submit" value="등록하기"> -->
			<button type="button" id="menuSubmit">등록하기</button>
			<div class="Go-back"><a href="list">작성취소</a></div>
		</div>
		
	</form>
	</div>
</div>
</body>
</html>