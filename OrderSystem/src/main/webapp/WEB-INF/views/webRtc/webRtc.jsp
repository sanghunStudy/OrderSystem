<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnlinePT</title>
<script src="https://code.jquery.com/jquery-1.9.0.js"
	integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM="
	crossorigin="anonymous"></script>
<script src="http://localhost:9393/socket.io/socket.io.js"></script>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>

<!-- <script	src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.4/socket.io.js"></script> -->
</head>
<body>

<input type="hidden" id="userName" value="<sec:authentication property="principal.username" />"/>
	<script>
		$(document).ready(function() {
			var userName = $("#userName").val();
// 			var socket = io("http://localhost:9393");
// 			socket.emit("username",userName);
			//node.js에서 설정해놓은 경로로 이동함. port9393
// 			var url = "http://172.16.143.39:9393?itemName="+userName;
// 			var url = "http://172.16.143.39:9393";

			//heroku 호스팅 주소
			var url = "https://online-personal-training.herokuapp.com/";
			//해당 경로 실행
			$(location).attr("href", url);
		});
	</script>

	<!-- <script>
		$(document).ready(function() {
			console.log('실행');
			$("#sendBtn").click(function() {

				sendMessage();

				$('#message').val('')

			});

			$("#message").keydown(function(key) {

				if (key.keyCode == 13) {// 엔터

					sendMessage();

					$('#message').val('')

				}

			});

		});
		var uriGet = window.location.origin;
		var uriGet2 = uriGet.substring(6);
		// 웹소켓을 지정한 url로 연결한다.

		console.log("<c:url value="/webRtc"/>");

		console.log("ws://" + uriGet2 + "/kopo/opo/webRtc");
		let sock = new SockJS("<c:url value="/webRtc"/>");

		// 		let sock = new WebSocket("ws://" + uriGet2 + "/kopo/opo/webRtc");
		sock.onmessage = onMessage;

		sock.onclose = onClose;

		// 메시지 전송

		function sendMessage() {

			sock.send($("#message").val());

		}

		// 서버로부터 메시지를 받았을 때

		function onMessage(msg) {

			var data = msg.data;

			$("#data").append(data + "<br/>");

		}

		// 서버와 연결을 끊었을 때

		function onClose(evt) {

			$("#data").append("연결 끊김");

		}
	</script>
 -->

</body>
</html>