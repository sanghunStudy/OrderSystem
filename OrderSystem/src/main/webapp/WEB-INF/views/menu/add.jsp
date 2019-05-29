<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문작성페이지</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/menu-add.css" rel="stylesheet">
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote(
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
	// 				console.log(imgChk);
					imgChk =  true;
					$("#imgChk").val(imgChk);
									
				}
			var nameCheck = $("#menuName").val();
							
			if(nameCheck == null || nameCheck == ""){
				alert("제목을 입력하세요");
			} else if(summernoteVal == null || summernoteVal == "") {
				alert("내용을 입력하세요");
			} else {
				var pointInfo = $('#point-set').val();
				if(pointInfo != null || pointInfo != "" || pointInfo != 0){
					$.ajax({
						url:"${pageContext.request.contextPath}/menu/userpoint",
						type:'GET',
						success:function(data){
							alert(data);
							if(data >= pointInfo){
								$("#menuForm").submit();
							}/*  else if (data == pointInfo) {
								
							}  */else {
								alert("포인트 설정은 본인의 포인트보다 크게 할 수 없습니다");
							}
						}
					});
				} else { 
					$("#menuForm").submit();
				}
			}
		});
		
		var pointBottons = document.getElementById('point_buttons');
		$('#point-set').click(function(){
			
			pointBottons.style.display="block";
			$('.point_buttons').animate({
				width:900,
				height:50
			});
			
		});
		
		$('.point-set').click(function(){
			var point = $(this).val();
			var pointVal = $(this).text();
			if(point == 0){
				$('#point_buttons').animate({
					width:10,
					height:10
				});
				pointBottons.style.display="none";
			} else {
				alert("설정한 포인트는 댓글 채택시 본인의 포인트에서 차감지급됩니다");
				$('#point-set').val(point);
				$('#point-set').text(pointVal);
				$('#point_buttons').animate({
					width:10,
					height:10
				});
				pointBottons.style.display="none";
			}
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
<script src="https://unpkg.com/vue"></script>	

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
		<div class="naming-box" id="naming-box">
			<img src="${pageContext.request.contextPath}/resources/images/icon/add-search.png">
			<label> 제목 </label> <input v-model="t" type="text" name="menuName" class="naming" id="menuName">
			<a class="char-limit">({{ tl }}/80자)</a>
		</div>
		<script>
			var titleCheck = new Vue({
				el:'#naming-box',
				data: {
					t:'',
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
			<textarea name="menuContent" id="summernote" cols="120" rows="50" value=""></textarea>
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
			<div class="point-setting-complete" name="pointSet" id="point-set">포인트 설정</div>
			<div class="point-input"><input id="point" placeholder="채택한 답변자에게 추가 포인트를 드립니다" type="number"></div>
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