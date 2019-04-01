<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화상채팅 테스트</title>
<script src="https://code.jquery.com/jquery-1.9.0.js"
	integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM="
	crossorigin="anonymous"></script>

        <script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>

<!-- <script	src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.4/socket.io.js"></script> -->
</head>
<body>
	<video autoplay></video>

	<input type="text" id="message" />

	<input type="button" id="sendBtn" value="전송" />



	<div id="data"></div>


<!-- 	<script>
		$('document')
				.ready(
						function() {
							
							var uriGet = window.location.origin;
							var uriGet2 = uriGet.substring(6);
							var wsUri = "ws://" + uriGet2 + "/kopo/opo/webRtc";

							websocket = new WebSocket(wsUri);
							//딱봐도 알거라고 믿겟음 함수명이 모든걸 말아주고있져?
							websocket.onopen = function(evt) {
								onOpen(evt)
							};
							//것도 메시지보내는
							websocket.onmessage = function(evt) {
								onMessage(evt)
							};
							//에러
							websocket.onerror = function(evt) {
								onError(evt)
							};

							function onOpen(evt) {
							}

							function onMessage(evt) {
								var recv = JSON.parse(evt.data);
								if (recv.type == 'time')
									$('#time').text(recv.time);
								else if (recv.type == 'chat') {
									var str = '<li>';
									str += '<table cellpadding="0" cellspacing="0">';
									str += '<tr>';
									str += '<td class="profile_td">';
									str += '<img src="resources/img/bitcoin-logo.png" />';
									str += '</td>';
									str += '<td class="chat_td">';
									str += '<div class="email">'
									str += recv.name;
									str += '</div>';
									str += '<div class="chat_preview">';
									str += recv.chat;
									str += '</div></td>';
									str += '<td class="time_td">';
									str += '<div class="time">';
									str += recv.date;
									str += '</div><div class="check"><p></p></div></td></tr></table></li>';
									$('.list ul').prepend(str);
								}

							}

							function onError(evt) {
							}

							function doSend(message) {
								websocket.send(message);
							}
							// 주기적으로 시간표시
							function getCurrentTime() {

								var Now = new Date();
								var NowTime = Now.getFullYear();

								NowTime += '-' + Now.getMonth() + 1;
								NowTime += '-' + Now.getDate();
								NowTime += ' ' + Now.getHours();
								NowTime += ':' + Now.getMinutes();
								NowTime += ':' + Now.getSeconds();

								return NowTime;
							}
							// 보내는곳에서 키포커스를 벗어날경우 
							$('#inputChat').keypress(function(data) {
								if (data.which == 13) {
									senddate = {
										type : "chat",
										name : $('#inputChatname').val(),
										chat : $('#inputChat').val(),
										date : getCurrentTime()
									};
									doSend(JSON.stringify(senddate));
									$('#inputChat').val('');
								}
							})
						})
	</script> -->

	<script>
		$(document).ready(function() {

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

		console.log("<c:url value="/echo"/>");

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


	<script>
		var stream;

		function hasUserMedia() {
			//check if the browser supports the WebRTC 
			return !!(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia);
		}

		if (hasUserMedia()) {
			navigator.getUserMedia = navigator.getUserMedia
					|| navigator.webkitGetUserMedia
					|| navigator.mozGetUserMedia;

			//enabling video and audio channels 
			navigator.getUserMedia({
				video : true,
				audio : true
			}, function(s) {
				stream = s;
				var video = document.querySelector('video');

				//inserting our stream to the video tag     
// 				video.src = window.URL.createObjectURL(stream);
				video.srcObject=stream;
				video.play();
				
			}, function(err) {
			});
			
		} else {
			alert("WebRTC is not supported");
		}
	</script>


</body>
</html>