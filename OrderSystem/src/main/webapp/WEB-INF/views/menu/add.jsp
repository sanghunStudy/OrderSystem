<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴추가페이지</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(function() {
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		console.log(file);
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		$.ajax({
			type: "post",
			url: "/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(data) {
				var str = "";
				if(checkImageType(data)) {
					str = "<div><img src='displayFile?filName="+data+"'></div>";
				} else {
					str = "<div>"+data+"</div>";
				}
				
				str += "<button>삭제<button>";
				$(".uploadList").append(str);
			}
		});
		
	});
});
</script>
<style type="text/css">
	.fileDrop {
		width:100%;
		height:300px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<form action="uploadAjax" method="post" enctype="multipart/form-data">
		<div>
			<label>메뉴이름: </label>
			<input type="text" name="menuName">
		</div>
		<div>
			<label>메뉴사진: </label>
			<div class="fileDrop">여기다 이미지를 끌어다 놓으세요</div>
			<div class="uploadList"></div>
		</div>
		<div>
			<label>가격: </label>
			<input type="Integer" name="menuPrice">
		</div>
		<div>
			<input type="submit" value="등록">
		</div>
	</form>
</body>
</html>