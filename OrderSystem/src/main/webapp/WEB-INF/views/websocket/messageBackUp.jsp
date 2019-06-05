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
// 		wsocket = new WebSocket("ws://localhost:9090/kopo/webSocket/message");
		wsocket = new SockJS("<c:url value="/message"/>");
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		
		$('#message').attr('disabled',false);
	}
	
	function disconnect() {
		var msg = 'msg:[' + $('#nickname').val() + '퇴장!]';
		wsocket.send(msg);
	}
	
	function onOpen(evt) {
		var msg = 'msg:[' + $('#nickname').val() + '입장!]';
		wsocket.send(msg);
	}
	
	function onMessage(evt) {
		var data = evt.data;
		if(data.substring(0,4) == 'msg:') {
			appendMessage(data.substring(4));
				/* 닉네임 추출 == 자기 닉네임과 같은지 체크 */
			if(data.substring(5,data.lastIndexOf('퇴장!')) 
					== $('#nickname').val() && data.lastIndexOf('퇴장!') != -1) {
				wsocket.close();
			}
		}
	}
	
	function onClose(evt) {
		//퇴장 한 이후 부과적인 작업이 있을 경우 명시
		$('#nickname').val("");
		$('#message').attr('disabled',true);
	}
	
	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg);
		$('#message').val('');
	}
	
	function appendMessage(msg) {
		$('#chatMessageArea').append(msg + '<br>');
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
		$('#chatArea').scrollTop(maxScroll);
	}
	
	$(document).ready(function() {
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function(){
			send();
		});
		$('#enterBtn').click(function(){
			if($('#nickname').val() == ''){
				alert('이름을 입력하세요!');
				$('#nickname').focus();
				return;
			}
			connect();
		});
		$('#exitBtn').click(function(){
			if($('#nickname').val() == ''){
				alert('이름을 입력하세요!');
				$('#nickname').focus();
				return;
			}
			disconnect();
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
	<form action="add" method="post">
	<input type="text" name="recipient"/>
	<textarea rows="5" cols="10" name="message"></textarea>
	<input type="submit" value="전송"/>
	</form>
</body>
</html>
