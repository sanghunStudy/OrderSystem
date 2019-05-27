<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	data-layout-decorate="~{sample/layout/sampleLayout}">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">

<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						var fileTarget = $('.filebox .upload-hidden');

						fileTarget.on('change', function() {
							if (window.FileReader) {
								// 파일명 추출
								var filename = $(this)[0].files[0].name;
							}

							else {
								// Old IE 파일명 추출
								var filename = $(this).val().split('/').pop()
										.split('\\').pop();
							}
							;

							$(this).siblings('.upload-name').val(filename);
						});

						//preview image 
						var imgTarget = $('.preview-image .upload-hidden');

						imgTarget
								.on(
										'change',
										function() {
											var parent = $(this).parent();
											parent.children('.upload-display')
													.remove();

											if (window.FileReader) {
												//image 파일만
												if (!$(this)[0].files[0].type
														.match(/image\//))
													return;

												var reader = new FileReader();
												reader.onload = function(e) {
													var src = e.target.result;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
												}
												reader
														.readAsDataURL($(this)[0].files[0]);
											}

											else {
												$(this)[0].select();
												$(this)[0].blur();
												var imgSrc = document.selection
														.createRange().text;
												parent
														.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

												var img = $(this).siblings(
														'.upload-display')
														.find('img');
												img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
														+ imgSrc + "\")";
											}
										});
					});

	function chkword(obj, maxByte) {

		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 39) {
				totalByte += 2;
			} else {
				totalByte++;
			}

			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}

		// 넘어가는 글자는 자른다.
		if (totalByte > maxByte) {
			alert(maxByte + "자를 초과 입력 할 수 없습니다.");
			str2 = strValue.substr(0, len);
			obj.value = str2;
			chkword(obj, 4000);
		}
	}
</script>
<script>
	$(document).ready(function() {
		$("#btnSubmit").click(function() {
			var name = document.form1.name.value;
			var sex = document.form1.sex.value;
			var career = document.form1.career.value;

			if (name == "") {
				alert("제목을 입력하세요.");
				document.form1.name.focus();
				return;
			}
			;

			document.form1.submit();
		});

	});
</script>
<script>
	var dropFile = function(event) {
		event.preventDefault();
	}
</script>
</head>
<body>
	<div class="allContents">
		<div class="addform">

			<h3 class="title">트레이너프로필작성</h3>
			<!-- action : 에디터에 입력한 html 코드를 전달받을 Controller페이지 URL -->
			<form action="promotion" method="post" name="form1"
				enctype="multipart/form-data">
				<input type="hidden" id="thum" value="default" name="thumbnail">

				<div class="freeTitle">
					<label>이름 &nbsp;&nbsp;</label> <input type="text" name="name"
						placeholder="이름을 입력해주세요." style="width: 620px"
						onkeyup="chkword(this,40)"> <label>성별 &nbsp;&nbsp;</label>
					<input type="text" name="sex" placeholder="성별을 입력해주세요."
						style="width: 620px" onkeyup="chkword(this,40)"> <label>경력
						&nbsp;&nbsp;</label> <input type="text" name="career"
						placeholder="경력을 입력해주세요." style="height: 420px; width: 620px;"
						onkeyup="chkword(this,40)">

				</div>

				<script th:inline="javascript">
					function sendFile(file, el) {
						var form_data = new FormData();
						form_data.append('file', file);
						$
								.ajax({
									data : form_data,
									type : "POST",
									url : '/promotion',
									cache : false,
									contentType : false,
									enctype : 'multipart/form-data',
									processData : false,
									success : function(data) {
										if (checkImageType(data)) {
											str = "<div class='bc'>"
													+ "<a href='/sample/upload/displayFile?fileName="
													+ getImageLink(data)
													+ "'>"
													+ "<img src='/sample/upload/displayFile?fileName="
													+ data
													+ "'/>"
													+ "</a>"
													+ "<small data-src='" + data + "'></small></div>";
										} else {
											str = "<div>"
													+ "<a href='/sample/upload/displayFile?fileName="
													+ data
													+ "'>"
													+ getOriginalName(data)
													+ "</a>"
													+ "<small data-src='" + data + "'></small></div>";
										}//else

										//       		$(el).summernote('editor.insertImage', data);         
										$(".note-editable").append(str);
										//             $('#summernote').summernote("insertNode", img_name[0]);

									}
								});
					}

					/* 컨트롤러로 부터 전송받은 파일이 이미지 파일인지 확인하는 함수 */
					function checkImageType(fileName) {
						var pattern = /jpg$|gif$|png$|jpeg$/i;
						return fileName.match(pattern);
					}//checkImageType

					//파일 이름 처리 : UUID 가짜 이름 제거
					function getOriginalName(fileName) {
						if (checkImageType(fileName)) {
							return;
						}

						var idx = fileName.indexOf("_") + 1;
						return fileName.substr(idx);

					}//getOriginalName

					//이미지 원본 링크 제공
					function getImageLink(fileName) {

						if (!checkImageType(fileName)) {
							return;
						}//if

						var front = fileName.substr(0, 14);
						var end = fileName.substr(14);

						return front + end;

					}//getImageLink
				</script>
				<div class="filebox bs3-primary preview-image"
					onchange="dropfile();">
					<label for="input_file">파일 선택</label> <input class="upload-name"
						value="" disabled="disabled" style="width: 200px;"> <input
						multiple="multiple" type="file" id="input_file"
						class="upload-hidden" name="attach">

				</div>


			</form>

			<div class="alarm-box">
				<p class="alarm">
					첨부파일은 최대 40mb까지 등록이 가능하며 <br>파일 형식은 jpg,gif,psd,png,tif,zop,ms
					office,아래한글(hwp),pdf,excel,zip,7z만 가능합니다.
			</div>
		</div>


		<div class="Btn">
			<button type="button" id="btnSubmit" class="regiserBtn"
				onclick="getThumbnail()">등록</button>

			<script>
				function getThumbnail() {
					var prethumbnail = $(".bc").find('img').attr('src');

					var reg = prethumbnail.substr(0, 48);
					var realName = prethumbnail.substr(48);
					var thumbnail = reg + 's_' + realName;
					/* 		alert(thumbnail);
							alert(reg);
							alert(realName); */
					$('#thum').val(thumbnail);

				}
			</script>
		</div>

	</div>
	<!--  
	<h1>트레이너 프로필 작성</h1>
	<form action="promotion" method="post" enctype="multipart/form-data">
		<fieldset style="width: 50">
			<legend>트레이너 프로필 작성</legend>
			이름 : <input type="text" name="name"> <br> 
			성별 : <input type="text" name="sex"> <br> 
			경력 : <input type="text" name="career"> <br> 
			사진 : <input type="file" name="profile"> 
		</fieldset>
		<input type="submit" value="신청" />
	</form>
-->
</body>
</html>