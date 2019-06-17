<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/alarm.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-1.9.0.js" -->
<!-- 	integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM=" -->
<!-- 	crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
<script type="text/javascript">
	var wsocket;
	var msg = "테스트";
	function connect() {
		wsocket = new SockJS("<c:url value="/message"/>");
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
// 		wsocket.onclose = onClose;
		
	}
	function onOpen(evt) {
		msg="테스트값";
		wsocket.send(msg);
	}
	
	function onMessage(e){
		console.log(e.data);
// 		$("#mCountRes").html(e.data);
		$(".box p").html(e.data);
	}
	$(document).ready(function() {
		connect();
// 		var subject = $('input[type=checkbox]');
// 		$(subject).each(function(index, item){
// 			$(item).click(function(){
// 				console.log("alarm.jsp 체크박스 클릭 실행");
// 				msg = myManager;
// 				wsocket.send(msg);
// 			});
// 		})
// 		$("#submit").click(function(){
// 			msg = myManager;
// 			wsocket.send(msg);
// 		});
	});
	
</script>
<style>

</style>

</head>
<body>
	<div class="alarm-box-header">
<div class="box sb4"><i class="far fa-bell alarm-icon"></i><p>추가된 알림이 없습니다.</p></div>
		</div>
</body>
</html>