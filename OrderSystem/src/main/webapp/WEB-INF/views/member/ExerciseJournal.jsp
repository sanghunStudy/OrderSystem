<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동일지</title>
<link
	href='${pageContext.request.contextPath}/resources/js/packages/core/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/js/packages/daygrid/main.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/js/packages/timegrid/main.css'
	rel='stylesheet' />
<script
	src='${pageContext.request.contextPath}/resources/js/packages/core/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/packages/interaction/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/packages/daygrid/main.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/packages/timegrid/main.js'></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : '2019-03-12',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				var title = prompt('제목을 입력하세요 !');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
					//prompt에 제목을 짓고 확인을 누르면 운동일지에 관한 내용을 작성하는 모달창 생성.
					modalPop();
				}
				calendar.unselect()
			},
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [
			//         {
			//           title: 'All Day Event',
			//           start: '2019-03-01'
			//         },
			//         {
			//           title: 'Long Event',
			//           start: '2019-03-07',
			//           end: '2019-03-10'
			//         },
			//         {
			//           groupId: 999,
			//           title: 'Repeating Event',
			//           start: '2019-03-09T16:00:00'
			//         },
			//         {
			//           groupId: 999,
			//           title: 'Repeating Event',
			//           start: '2019-03-16T16:00:00'
			//         },
			//         {
			//           title: 'Conference',
			//           start: '2019-03-11',
			//           end: '2019-03-13'
			//         },
			//         {
			//           title: 'Meeting',
			//           start: '2019-03-12T10:30:00',
			//           end: '2019-03-12T12:30:00'
			//         },
			//         {
			//           title: 'Lunch',
			//           start: '2019-03-12T12:00:00'
			//         },
			//         {
			//           title: 'Meeting',
			//           start: '2019-03-12T14:30:00'
			//         },
			//         {
			//           title: 'Happy Hour',
			//           start: '2019-03-12T17:30:00'
			//         },
			//         {
			//           title: 'Dinner',
			//           start: '2019-03-12T20:00:00'
			//         },
			//         {
			//           title: 'Birthday Party',
			//           start: '2019-03-13T07:00:00'
			//         },
			//         {
			//           title: 'Click for Google',
			//           url: 'http://google.com/',
			//           start: '2019-03-28'
			//         }
			]
		});

		calendar.render();
	});

	var sungwoon = document.getElementsByClassName('fc-content');

	function modalPop() {

		//Get the modal
		var modal = document.getElementById('myModal');

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		modal.style.display = "block";

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

	}

	//팝업

	window.onload = function() {

		//제목을 클릭하면 해당 태그의 클래스를 가져옴 
		//이거 클래스를 통해서 지워야됨.
		document.body.addEventListener("click", function(e) {

			if (e.target.classList.contains("fc-title")) {
				e.target.className = "fc-title selected";
				console.log(e.target.className);

				tagetDelete(e.target.className);
			}
		}, false);

		$("#container").hide();
		//종목 추가 클릭시 운동 종목 보이게 하는 함수
		var sho = true;
		$("#ElAdd").click(function() {

			if (sho == true) {
				$("#container").show();
				sho = false;
			} else {
				$("#container").hide();
				sho = true;
			}
		});

		//운동 종목 검색
		$("#keyword")
				.keyup(
						function() {
							var k = $(this).val();
							$("#user-table > tbody > tr").hide();
							var temp = $("#user-table > tbody > tr > td:nth-child(5n+2):contains('"
									+ k + "')");

							$(temp).parent().show();

						})
		var cloneCount = 1;

		//테이블의 아이디
		var table = document.getElementById("table");
		//운동명 클릭시 clone을 생성하고 내용을 바꿔준다.
		//class="itemsName"를 클릭한 경우 table의 head 부분을 복사하고 선택한 값을 제목으로 테이블 구성
		$(".itemsName").on(
				"click",
				function() {
					//검색한 운동 종목
					var title = $(this).text();
					//검색한 운동 종목이 dom에 있나 확인 길이가 9이면 없음
					var titleTure = $(':contains(' + title + ')').length;
					//길이가 9이면 없는거니까 생성
					if (titleTure == 9) {
						var cloneEl = $("#table").clone().find("h3")
								.text(title).end().find("tbody").attr("id",
										"items" + cloneCount).end().attr("id",
										"table" + cloneCount).insertAfter(
										"[id^=table]:last");

						cloneEl.appendTo('#frm');
						cloneCount++;
					//9가 아니면 있는거니까 경고창 출력
					}else{
						alert("이미 선택한 종목입니다.");
					}
				});

		//모달창에 input 추가 함수
		$(document)
				.on(
						"click",
						"#ElBtn",
						function ElBtn() {
							// 			console.log($(this).closest("thead").next().children(".hi").length+"<<<<<<자기의 tbody id값");

							//클릭한 버튼의 조상에 바로 아래 형제 = tbody 의 id를 가져와서 변수에 담아준다.
							var closestId = $(this).closest("thead").next()
									.attr("id");
							//해당 아이디로 element를 찾는다.
							var El = document.getElementById(closestId);

							//클릭한 버튼의 조상에 바로 아래 형제의 자식= tr중 hi라는 클래스의 길이를 가져오고 +2 시켜준다.
							var i = $(this).closest("thead").next().children(
									".hi").length + 2;
							//

							var items = "<tr class='"+ i +" hi'>"
									+ "<td><p>"
									+ i
									+ "</p></td>"
									+ "<td><input type='number' min='1'  value='10'/></td>"
									+ "<td><input type='number' min='1'/></td>"
									+ "</tr>"

							El.innerHTML += items;

							i++;

						});//태그 추가 함수 끝

		//input 삭제 함수
		$(document).on(
				"click",
				"#ElDel",
				function() {
					//클릭한 버튼의 조상에 바로 아래 형제 = tbody 의 id를 가져와서 변수에 담아준다.
					var closestId = $(this).closest("thead").next().attr("id");
					//해당 아이디로 element를 찾는다.
					var El = document.getElementById(closestId);

					//클릭한 버튼의 조상에 바로 아래 형제의 자식= tr중 hi라는 클래스의 길이를 가져오고 +2 시켜준다. 
					var delLeng = $(this).closest("thead").next().children(
							".hi").length + 2;

					if (delLeng > 2) {
						while (El.lastChild) {
							El.removeChild(El.lastChild);

							break;
						}
					}

				});//태그 삭제 함수 끝
				
			$(document).on("click","#titleDel",function(){
				//나의 부모의 첫번째 자식 요소의 텍스트값  = Main 운동(h3태그) 가져오기				
				var hTagTitle = $(this).parent().children().eq(0).text();
				//이 내용이 Main 운동 이라면 삭제가 안되고 아니라면 삭제처리
				if(hTagTitle == "Main 운동"){
					alert("메인 운동은 삭제 하실 수 없습니다.");	
				}else{
					//선택한 버튼이 속해있는 테이블 아이디 값을 찾아와서 지운다.
					var closestId = $(this).closest("thead").parent().attr("id");
					var removeId = "#"+closestId;
					$(removeId).remove();
				}
					
			});

	}//window.onload

	//클릭하면 제목 삭제해야됨
	function tagetDelete(el) {

		// 	  alert(el);
		// 	  var target = el.parentNode.getAttribute('target');
		// 	  alert(target);

		// 	  var field = document.getElementById(target);
		// 	  document.getElementById('field').removeChild(field);
	}
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 운동 종목 테이블 */
#container {
	width: 20%;
	margin: 0 auto;
}

#container #input-form {
	text-align: center;
}

#user-table {
	margin: 0 auto;
	text-align: center;
}

#input-form {
	margin-top: 10px;
	margin-bottom: 10px;
}

#user-table {
	border-collapse: collapse;
}

#user-table>thead>tr {
	background-color: #333;
	color: #fff;
}

#user-table>thead>tr>th {
	padding: 8px;
	width: 150px;
}

#user-table>tbody>tr>td {
	border-bottom: 1px solid gray;
	padding: 8px;
}
</style>
</head>
<body>
	<div id='calendar'></div>

	<!-- The Modal -->
	<div id="myModal" class="modal">




		<!-- Modal content -->
		<div id="modal-content" class="modal-content">
			<span class="close">&times;</span>

			<button id="ElAdd">종목추가</button>
			<form id="frm">
				<table id="table">
					<thead id="itemsHead">
						<tr>
							<!-- 추가적인 input을 생성하는 버튼 -->
							<th colspan="2"><button id="ElBtn" type="button">+</button></th>
							<th colspan="2"><button id="ElDel" type="button">-</button></th>

						</tr>
						<tr>
							<th colspan="4"><h3>Main 운동</h3><button id="titleDel" type="button">삭제</button></th>
						</tr>
						<tr>
							<th><label> Set(세트수) </label></th>
							<th><label> Reps(반복횟수) </label></th>
							<th><label> lb(무게)</label></th>

						</tr>
					</thead>
					<tbody id="items">
						<tr>
							<td><p>1</p></td>
							<td><input type="number" min="1" value="10"></td>
							<td><input type="number" min="1"></td>
						</tr>
					</tbody>
				</table>
			</form>

			<div id="container">
				<div id="input-form">
					운동명 : <input type="text" id="keyword" />
				</div>
				<table id="user-table">
					<thead>
						<tr>
							<th>부위</th>
							<th>운동명</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>가슴</td>
							<td class="itemsName">벤치프레스</td>
						</tr>
						<tr>
							<td>가슴</td>
							<td class="itemsName">체스트프레스</td>
						</tr>
						<tr>
							<td>등</td>
							<td class="itemsName">데드리프트</td>
						</tr>
						<tr>
							<td>등</td>
							<td class="itemsName">바벨로우</td>
						</tr>
						<tr>
							<td>등</td>
							<td class="itemsName">렛풀다운</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>