<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문수정페이지</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/Question/Question-add.css" rel="stylesheet">
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Question/question-add.js"></script>
<script>
$(document).ready(function(){
	$('#summernote').summernote({
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
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	});
	
	$("#questionSubmit").click(function(){
		var summernoteVal = $("#summernote").val(); 
		var imgChk;
			if($(summernoteVal).find("img").length > 0){
// 				console.log(imgChk);
				imgChk =  true;
				$("#imgChk").val(imgChk);
								
			}
		var nameCheck = $("#questionName").val();
		var pointInfo = $('#pointSet').val();
		if(nameCheck == null || nameCheck == ""){
			alert("제목을 입력하세요");
		} else if(summernoteVal == null || summernoteVal == "") {
			alert("내용을 입력하세요");
		} else if(pointInfo == 0) {
			$("#questionForm").submit();
		} else if(pointInfo != null || pointInfo != 0){
			$.ajax({
				url:"${pageContext.request.contextPath}/question/userpoint",
				type:'GET',
				success:function(data){
					if(data > pointInfo){
						$("#questionForm").submit();
					} else if (data == pointInfo) {
						var pointzero = confirm("댓글 채택시 본인의 포인트가 0이 됩니다. 괜찮겠습니까?");
						if(pointzero = true){
							$("#questionForm").submit();
						} else {
							return false;
						}
					} else {
						alert("포인트 설정은 본인의 포인트보다 크게 할 수 없습니다");
					}
				}
			});
		}
		
	});
	
	
});

function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '${pageContext.request.contextPath}/question/profileUpload',
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
<script src="https://unpkg.com/vue"></script>
</head>
<body>
<div class="container">
	<div><a class="subtitle" href="list">질문수정</a></div>
	<div class="innerbox">
	<form action="update" method="post" enctype="multipart/form-data" id="questionForm">
		<div>
			<input name="questionId" type="hidden" value="${item.questionId}" />
			<input type="hidden" value="${item.questionName}" id="loadQuestionName">
		</div>
		<div class="naming-box" id="naming-box">
			<img src="${pageContext.request.contextPath}/resources/images/icon/add-search.png">
			<label> 제목 </label> <input v-model="t" type="text" name="questionName" class="naming" id="questionName">
			<a class="char-limit">({{ tl }}/80자)</a>
		</div>
		<script>
			var loadQuestionName = document.getElementById('loadQuestionName').value;
			var titleCheck = new Vue({
				el:'#naming-box',
				data: {
					t:loadQuestionName,
					tl:0,
					to:''
				},
				watch: {
					t: function(v) {
						this.tl = Number(v.length);
						if(this.tl > 80) {
							alert("더 이상 입력하실 수 없습니다.");
							this.to = v.substr(0, 80);
							/* console.log(this.to); */
							this.t = this.to;
						}
					}
				}
			});
		</script>
		<div>
			<textarea name="questionContent" id="summernote">${item.questionContent}</textarea>
		</div>
		<div class="point_buttons" id="point_buttons">
			<ul class="point_bar">
				<li class="point-set" id="zero" value="0">0 point</li>
				<li class="point-set" id="ten" value="10">10 point</li>
				<li class="point-set" id="twenty" value="20">20 point</li>
				<li class="point-set" id="thirty" value="30">30 point</li>
				<li class="point-set" id="forty" value="40">40 point</li>
				<li class="point-set" id="fifty" value="50">50 point</li>
			</ul>
		</div>
		<div class="point-box">
			<div class="point-setting-complete" id="point-set">${item.pointSet} point</div>
			<div class="point-input"><input id="point" placeholder="채택한 답변자에게 추가 포인트를 드립니다" type="number"></div>
			<input type="hidden" name="pointSet" id="pointSet" value="${item.pointSet}">
		</div>
		<div>
			<input type="hidden" name="imgChk" id="imgChk" value="false">
		</div>
		<div class="buttons">
<!-- 			<input type="submit" value="등록하기"> -->
			<button type="button" id="questionSubmit">수정완료</button>
			<a href="view?questionId=${item.questionId}"><div class="Go-back">수정취소</div></a>
		</div>
	</form>
	</div>
</div>
</body>
</html>