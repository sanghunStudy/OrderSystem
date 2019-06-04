<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<img src="${pageContext.request.contextPath}/resources/images/icon/photo.png">
				<div class="modal-proImg">
					<img src="#">
				</div>
				<p>나를 표현해 보세요</p>
			</div>
			<div class="contents-container">
				<div class="contents-form">
				<h2>TRAINER BOT PROFILE</h2>
				<form>
					<div class="group">
						<img src="${pageContext.request.contextPath}/resources/images/icon/idicon.png">
						 <label class="only-modal">아이디</label>
						<input type="text" required class="weights"> <span class="highlight"></span>
						<span class="bar"></span>
					</div>
					<div class="group">
						<img src="${pageContext.request.contextPath}/resources/images/icon/nameicon.png">
						<label class="only-modal">이름</label>
						<input type="text" required class="height"> <span class="highlight"></span>
						<span class="bar"></span> 
					</div>
					<div class="group">
						<img src="${pageContext.request.contextPath}/resources/images/icon/regionicon.png">
						 <label class="only-modal">지역</label>
						<input type="text" required class="height"> <span class="highlight"></span>
						<span class="bar"></span>
					</div>
					<div class="group">
						<img src="${pageContext.request.contextPath}/resources/images/icon/careericon.png">
						<label class="only-modal">경력</label>
						<input type="text" required class="etc"> <span class="highlight"></span>
						<span class="bar"></span> 
					</div>
					<div class="group">
						<input type="radio" required class="etc"><label class="only-modal">남자</label>
						<input type="radio" required class="etc"><label class="only-modal">여자</label>
					</div>

				</form>
				<ul class="list-inline">

				<li><button type="button" class="modal-btn-collection apply">
						<span>신청</span>
					</button></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>