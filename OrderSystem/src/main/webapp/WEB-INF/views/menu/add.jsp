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
	function checkImageType(fileName) {
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
	}
	
	$(".fileDrop").on("dragenter", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("dragover", dragOver)
	$(".fileDrop").on("drop", uploadFiles)
	
	function dragOver(e) {
		e.stopPropagation();
	    e.preventDefault();
	    if (e.type == "dragover") {
	        $(e.target).css({
	            "background-color": "black",
	            "outline-offset": "-20px"
	        });
	    } else {
	        $(e.target).css({
	            "background-color": "gray",
	            "outline-offset": "-10px"
	        });
	    }
	}
	
	function uploadFiles(e) {
		e.stopPropagation();
	    e.preventDefault();
	    dragOver(e);
	 
	    e.dataTransfer = e.originalEvent.dataTransfer;
	    var files = e.target.files || e.dataTransfer.files;
	 
	    if (files.length > 1) {
	        alert('하나만 올리세요');
	        return;
	    }
	    
	    if (files[0].type.match(/image.*/)) {
	        $(e.target).css({
	            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
	            "outline": "none",
	            "background-size": "100% 100%"
	        });
	    }else{
	      alert('이미지가 아닙니다.');
	      return;
	    }
	}

/*	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		console.log(file);
		
		var formData = new FormData();
		
		formData.append("file",file); 
		//여기 url부분 수정해서 컨트롤러랑 ajax 통신되게 해놨음
		$.ajax({
			type: 'POST',
			url: "${pageContext.request.contextPath}/menu/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(data) {
				
				console.log(data);
				var str = "";
				//여기서 checkImageType() 함수가 트루 펄스 구분하는거 같은데 여기서 오류남
				//if 문에 저 함수대신 data만 넣고 테스트 해보면 화면상 이미지 태그가 생기긴 하지만 컨트롤러에서 실제 경로에 파일 생성을 못해서 
				//화면상으로는 404 이미지 나옴 이미지 경로 찾을수 없을때 뜨는 표시가 생김
				if(checkImageType(data)) {
					str = "<div><img src='displayFile?filName="+data+"'></div>";
				} else {
					str = "<div>"+data+"</div>";
				}
				
				str += "<button>삭제<button>";
				$(".uploadList").append(str);
			}
		});
		
	});*/
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_")+1;
		return fileName.substr(idx);
	}
});
</script>
<style type="text/css">
	.fileDrop {
		width:300px;
		height:300px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<form action="add" method="post" enctype="multipart/form-data">
		<div>
			<label>메뉴이름: </label>
			<input type="text" name="menuName">
		</div>
		<div>
			<label>메뉴사진: </label>
<!--  		<div class="fileDrop">여기다 이미지를 끌어다 놓으세요</div>
			<div class="uploadList"></div> -->
			<input type="text" name="menuPhoto">
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