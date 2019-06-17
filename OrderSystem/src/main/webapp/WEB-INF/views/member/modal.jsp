<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
	data-layout-decorate="~{sample/layout/sampleLayout}">
<head>
<!-- <link -->
<!-- 	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" -->
<!-- 	rel="stylesheet"> -->
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="${pageContext.request.contextPath }/resources/js/modal.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/modal.css">


<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(document).ready(function() {
		//var fileTarget = $('.filebox .upload-hidden');
		
		$(".upload-hidden").on('change', function() {
			if (window.FileReader) {
					// 파일명 추출
					var filename = $(this)[0].files[0].name;
			}else {
				// Old IE 파일명 추출
					var filename = $(this).val().split('/').pop().split('\\').pop();
			};
			sendFile(filename);
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
													$('.labelImg').css('width',
															'50px');
													$('.labelImg').css(
															'height', '50px');
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
			var region = document.form1.region.value;
			var career = document.form1.career.value;
			var thumbnail = document.form1.thumbnail.value;

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
<script type="text/javascript">
	$(document).ready(function() {
		if ($('.upload-thumb').attr('block')) {
			$('.labelImg').css('width', '50px');
			$('.labelImg').css('height', '50px');

		} else {
			$('.labelImg').css('width', '140px');
			$('.labelImg').css('height', '140px');
		}
		console.log($('.upload-thumb').css('display'));
	})
</script>
</head>
<body>
	<div class="modal" id="modal">
		<div class="modal-container">
			<div class="modal-applyheader">
				<div class="filebox bs3-primary preview-image">
				<img src="${pageContext.request.contextPath}/resources/images/icon/photo.png" class="photo-img">
				<a href="javascript:UploadTest()"><img src="${pageContext.request.contextPath}/resources/images/icon/nameicon.png" class="img-icon"></a>
				<input type="text" id="thum">
				<p>나를 표현해 보세요</p>
					<%-- <img src="${pageContext.request.contextPath}/resources/images/icon/photo.png">
					<label for="input_file" class="labelImg"></label>
					 <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
					<input type="file" id="input_file" class="upload-hidden" name="uploadFile">  --%>
				</div>
			</div>
			<div class="contents-container">
				<div class="contents-form">
					<h2>TRAINER BOT PROFILE</h2>
					<form action="promotion" method="post" name="form1"
						enctype="multipart/form-data">
						<script th:inline="javascript">
							function sendFile(file, el) {
								console.log($("#input_file")[0].files[0]);
								var form_data = new FormData();
								form_data.append('file', $("#input_file")[0].files[0]);
									$.ajax({
											data :form_data,
											dataType:"text",
											type : "POST",
											url : '${pageContext.request.contextPath}/Routine//sample/upload/uploadAjax',
											//cache : false,
											contentType : false,
											enctype : 'multipart/form-data',
											processData : false,
											success : function(data) {
												console.log(data);
												if (checkImageType(data)) {
													
													$(".img-icon").attr("src","${pageContext.request.contextPath}/upload"+data);
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
									0.
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
							
							function UploadTest(){
							$("#input_file").click();
							
							}
						</script>
						<input type="file" id="input_file" class="upload-hidden" name="uploadFile">						
						<%--
						<label for="input_file">파일 선택</label>
						<input type="hidden" id="thum" value="default" name="thumbnail">
						<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
						<input type="file" id="input_file" class="upload-hidden" name="uploadFile">
						<input type="hidden" value="" class="gender_value" name="sex">
						 --%>
						<div class="group">
							<p><label class="only-modal" id="apply-modal">아이디</label></p>
							<div class="input-item-box">
								<img src="${pageContext.request.contextPath}/resources/images/icon/idicon.png">
								<input type="text" value="${user}" name="username" readonly><span class="highlight"></span>
								<span class="bar"></span>
							</div>
						</div>
						<div class="group">
							<p><label class="only-modal" id="apply-modal">이름</label></p>
							<div class="input-item-box">
								<img src="${pageContext.request.contextPath}/resources/images/icon/nameicon.png">
								<input type="text" name="name"> <span class="highlight"></span> 
								<span class="bar"></span>
							</div>
						</div>
						<div class="group">
							<p><label class="only-modal" id="apply-modal">지역</label></p>
							<div class="input-item-box">
								<img src="${pageContext.request.contextPath}/resources/images/icon/regionicon.png">
								<input type="text" name="region"> <span class="highlight"></span> 
								<span class="bar"></span>
							</div>
						</div>
						<div class="group">
							 <p><label class="only-modal" id="apply-modal">경력</label></p>
							 <div class="input-item-box">
								 <img src="${pageContext.request.contextPath}/resources/images/icon/careericon.png">
								 <input type="text" name="career"> 
								 <span class="highlight"></span> 
								 <span class="bar"></span>
							 </div>
						</div>
						<div class="group">
							<p><label class="only-modal" id="apply-modal">성별</label></p>
							<input type="hidden" class="gender_value" name="sex" value="남자">
							<div class="sex-box">
								<div class="background">
									<span class="male gender">남자</span>
									<div class="toggle-body">
										<div class="toggle-btn" value="male"></div>
									</div>
									<span class="female gender">여자</span>
								</div>
							</div>
						</div>
						<ul class="list-inline">
						<li><button type="submit" id="btnSubmit" class="modal-btn-collection apply">
								<span>신청</span>
							</button></li>
						<!--	<li><button type="button" id="btnSubmit"
								onclick="getThumbnail()" class="modal-btn-collection apply">
								<span>신청</span>
							</button></li> -->
						</ul>
					</form>
					 <script>
						function getThumbnail() {
							var prethumbnail = $(".bc").find('img').attr('src');
							console.log(prethumbnail);
							var reg = prethumbnail.substr(0, 48);
							var realName = prethumbnail.substr(48);
							var thumbnail = reg + 's_' + realName;
								alert(thumbnail);
									alert(reg);
									alert(realName);
							$('#thum').val(thumbnail);

						}
					</script> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>