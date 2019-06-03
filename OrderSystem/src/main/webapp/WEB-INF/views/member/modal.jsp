<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/modal.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/modal.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/icomoon/style.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon (1).ico">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal" id="modal">
		<div class="modal-container">
			<div class="modal-header">
				<h2>멘토링 신청</h2>
			</div>
			<div class="contents-container">
				<form>
					<div class="group">
						<input type="text" required class="weights"> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">체중</label>
					</div>
					<div class="group">
						<input type="text" required class="height"> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">키</label>
					</div>
					<div class="group">
						<input type="text" required class="etc"> <span class="highlight"></span>
						<span class="bar"></span> <label class="only-modal">하고싶은 말
							한줄</label>
					</div>

				</form>
			</div>
			<ul class="list-inline">

				<li><button type="button" class="modal-btn-collection apply">
						<span>신청</span>
					</button></li>
			</ul>
		</div>
	</div>
</body>
</html>