<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script src="https://code.jquery.com/jquery-1.9.0.js"
	integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM="
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
<script type="text/javascript">
	var wsocket;
	
	function connect() {
		wsocket = new SockJS("<c:url value="/message"/>");
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
// 		wsocket.onclose = onClose;
		
	}
	function onOpen(evt) {
		var msg = 'msg:[' + $('#nickname').val() + '입장!]';
		wsocket.send(msg);
	}
	
	function onMessage(e){
		console.log(e.data);
		$("#mCountRes").html(e.data);
	}
	$(document).ready(function() {
		connect();
		$("#submit").click(function(){
			msg = "test";
			wsocket.send(msg);
		});
	});
	
</script>
<style type="text/css">
#chatArea {
	width:300px;
	height:100px;
	overflow-y:auto;
	border:1px solid black;
}
</style>
</head>

<body>
<span id="mCountRes"></span>
<div id="submit">전송</div>
</body>
</html>
