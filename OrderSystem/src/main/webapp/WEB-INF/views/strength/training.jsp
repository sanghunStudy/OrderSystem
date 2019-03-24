<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery_splendid_textchange.js"></script>
<script type="text/javascript">

	$("#kg").on("textchange", function() {
		var kg = document.getElementById("kg").value;
		var reps = document.getElementById("reps").value;
		var 1rm = kg*(1+(reps/30));
		document.getElementById("1rm").value = 1rm;
	});
</script>
</head>
<body>
	<div>
		<label>사용중량</label>
		<input type="number" id="kg">
	</div>
	<div>
		<label>반복횟수</label>
		<input type="number" id="reps">
	</div>
	<div>
		<label>추산1RM</label>
		<input type="number" id="1rm" readonly>
	</div>
</body>
</html>