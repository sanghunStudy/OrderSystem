<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	/*<![CDATA[*/
	$(function() {

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop")
				.on(
						"drop",
						function(event) {
							event.preventDefault();

							var files = event.originalEvent.dataTransfer.files;

							var file = files[0];

							//console.log(file);

							var formData = new FormData(); // HTML5
							formData.append("file", file);

							$.ajax({
										url : '${pageContext.request.contextPath}/Routine//sample/upload/uploadAjax',
										data : formData,
										dataType : 'text',
										processData : false,
										contentType : false,
										type : 'POST',
										success : function(data) {
											
											//서버로 파일을 전송한 다음에 그 파일을 다시 받아온다.?

											//이미지 인경우 썸네일을 보여준다.
											if (checkImageType(data)) {
												str = "<div>"										
														+ "<img src='${pageContext.request.contextPath}/Routine/sample/upload/displayFile?fileName="
														+ data
														+ "'/>"
														+ "<small data-src='" + data + "'>X</small></div>";
												$(".uploadedList").append(str);	
											} else {
												alert("이미지 파일이 아닙니다.");
// 												str = "<div>"
// 														+ "<img src='${pageContext.request.contextPath}/Routine/sample/upload/displayFile?fileName="
// 														+ "'/>"
// 														+ "<p>" 
// 														+ getOriginalName(data)
// 														+ "</p>"
// 														+ "<small data-src='" + data + "'>X</small></div>";
											}//else

											
										},
									});// ajax

						});

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

			var front = fileName.substr(0, 12);
			var end = fileName.substr(14);

			return front + end;

		}//getImageLink

		//업로드 파일 삭제 처리
		$(".uploadedList").on("click", "small", function(event) {

			var that = $(this);

// 			alert($(this).attr("data-src"));
			
			$.ajax({
				url : "${pageContext.request.contextPath}/Routine/sample/upload/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						//alert("deleted");
						that.parent("div").remove();
					}//
				},
			});

		});//uploadedList

	});
</script>


<style>
.fileDrop {
	width: 400px;
	height: 100px;
	border: 1px dotted blue;
}

/* small { */
/* 	margin-left: 3px; */
/* 	font-weight: bold; */
/* 	color: gray; */
/* } */
</style>

</head>
<body>
	<div id="content">

		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid">



				<div class="box box-primary">
					<div class="box-header with-border">
						<h5 class="box-title">첨부파일</h5>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					<form id="form1" action="/sample/upload/uploadForm" method="post" enctype="multipart/form-data">
<%-- 					<form id="form" action="/sample/upload/uploadForm?${_csrf.parameterName}=${_csrf.token}" method="post" --%>
<!-- 						enctype="multipart/form-data"> -->
						<div class="box-body">
							<div class="form-group">
								<div class="fileDrop"></div>
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<!-- <button type="submit" class="btn btn-warning">제출</button> -->
							<div class="uploadedList">
							<c:forEach var="img" items="${file}">
									<div>
										<img src="${pageContext.request.contextPath}/upload${img.filename}">
										<small data-src="${img.filename}">X</small>
										<input type="text" name="imgAdr" value="${img.filename}">
									</div>
							</c:forEach>
							</div>
						</div>
					</form>
				</div>
			

			</section>
		
		</div>
		
	</div>
</body>
</html>