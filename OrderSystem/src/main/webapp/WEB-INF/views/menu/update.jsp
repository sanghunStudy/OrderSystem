<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴수정페이지입니다.</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
$(document).ready(function() {
    $('#summernote').summernote({
            height: 600,                 // set editor height
            fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
							'Comic Sans MS', 'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,    // set focus to editable area after initializing summernote
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
      url: '${pageContext.request.contextPath}/menu/profileUpload',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(img_name) {
        $(el).summernote('editor.insertImage', '${pageContext.request.contextPath}' + img_name);
      }
    });
  }

</script>
</head>
<body>
	<form action="update" method="post">
		<div>
			<input name="menuId" type="hidden" value="${item.menuId}"/>
		</div>
		<div>
			<label>메뉴이름: </label>
			<input name="menuName" type="text" value="${item.menuName}">
		</div>
		<div>
			<label>컨텐츠: </label>
			<textarea name="menuContent" id="summernote">${item.menuContent}</textarea>
		</div>
		<div>
			<label>메뉴가격: </label>
			<input name="menuPrice" type="Integer" value="${item.menuPrice}">
		</div>
		<div>
			<input type="submit" value="수정">
		</div>
	</form>
	<a href="list">목록으로</a>
</body>
</html>