<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
	src='${pageContext.request.contextPath}/resources/js/packages/moment/main.js'></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

$(document).ready(function(){
	ajaxLoad();//시작하자마자ajax로드해서 리스트를 달력에 뿌려준다.
});	


//클릭한 날짜를 담을 변수선언
var ClickDateStr;
var DayTitle;

function ajaxLoad(){
	$.ajax 
	({ 
	 type: "GET", 
	 contentType: "application/json; charset=utf-8", 
	 url: "${pageContext.request.contextPath}/member/ExerciseJournalList", 
	 dataType: 'json', 
	 success: function (data) 
	 { 
		 console.log(data);
	//배열선언 뿌려줄 리스트를 담을
	  var events = []; 
		for(var i =0; i <data.EJ.length; i++){
			events.push({
				exerciseCode:data.EJ[i].exerciseCode,
				title : data.EJ[i].title,
				start : data.EJ[i].start,
				url:'${pageContext.request.contextPath}/member/ExerciseJournalView?exerciseCode='+data.EJ[i].exerciseCode,

			});
		}//for끝 
	  
	  calendarLoad(events);//달력 호출하면서 뿌려줄 목록을 넘겨준다. 
	 },//success 끝 
	 error: function (xhr, err) { 
	  alert("ERROR! - readyState: " + xhr.readyState + "<br/>status: " + xhr.status + "<br/>responseText: " + xhr.responseText); 
	 } 
	}); //ajax 끝

}//ajaxLoad

//달력 로드하기
function calendarLoad (eventData) {
		console.log(eventData);//ajax 결과값 받아와서 출력
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interactionPlugin','interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : '2019-03-12',
			navLinks : true, // can click day/week names to navigate views
			 
			dateClick: function(info) {
				//클릭한 날짜를 전역변수에 담아준다.
				ClickDateStr = info.dateStr;
			    
// 				alert('Clicked on: ' + info.dateStr);
// 			    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
// 			    alert('Current view: ' + info.view.type);
			    // change the day's background color just for fun
// 			    info.dayEl.style.backgroundColor = 'red';
			  },
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				var title = prompt('제목을 입력하세요 !');
				DayTitle = title;
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
			events : eventData,
			
			//제목을 클릭했을때 이벤트 발생
			eventClick: function(info){
// 				console.log(info.event.extendedProps.exerciseCode);
// 			    alert('Event: ' + info.event.title);
				//클릭한 제목의 db 코드번호
				var eventTitle = info.event.extendedProps.exerciseCode;
			    $.ajax({
					url:"${pageContext.request.contextPath}/member/ExerciseJournalOne",
					type:"post",
					data:{
						"exerciseCode":eventTitle
					},
					beforeSend : function(xhr)
		            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
					success:function(res){
						console.log(res);
						modalPop(res);
						
					}
			    });//ajax 끝
			    
			}
		});
		calendar.render();
		}//events 끝
		





	var sungwoon = document.getElementsByClassName('fc-content');
//모달창
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
			location.reload();
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
				location.reload();
			}
		}

	}

	//팝업 내부
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
						var cloneEl = $("#Sample").clone().find("h3")
								.text(title).end().find("#exName").val(title).attr("name","ExerciseName")
								.end().find("tbody").attr("id",
										"tbodyItems" + cloneCount).end().attr("id",
										"table" + cloneCount).attr("style",
										"display:block").insertAfter(
										"[id^=table]:last");

						cloneEl.appendTo('#frm');
						cloneCount++;
						//9가 아니면 있는거니까 경고창 출력
					} else {
						alert("이미 선택한 종목입니다.");
					}
				});

		//모달창에 input 추가 함수
		$(document)
				.on(
						"click",
						"#ElBtn",
						function ElBtn() {
// 							console.log($(this).closest("thead").next().children(".hi").length+"<<<<<<자기의 tbody id값");

							//클릭한 버튼의 조상에 바로 아래 형제 = tbody 의 id를 가져와서 변수에 담아준다.
							var closestId = $(this).closest("thead").next()
									.attr("id");
							
// 							console.log(closestId);
							//해당 아이디로 element를 찾는다.
							var El = document.getElementById(closestId);

							//클릭한 버튼의 조상에 바로 아래 형제의 자식= tr중 hi라는 클래스의 길이를 가져오고 +2 시켜준다.
							var i = $(this).closest("thead").next().children(
									".hi").length + 2;

							var j = $(this).closest("thead").next().children(
									".hi").length +1;
							
							var items = "<tr class='"+ i +" hi'>"
									+ "<td><p>"
									+ i
									+ "</p>"
									+ "<input type='hidden' min='1' name='set' value='"+i+"'/>"
									+ "</td>"
									+ "<td><input type='number' min='1' name='Reps' value='10'/></td>"
									+ "<td><input type='number' min='1' name='lb'/></td>"
									// 							+ "<td><button type='button' id='oneElDel'>-</button></td>"
									+ "</tr>"
							$(items).appendTo(El);
							i++;

						});//태그 추가 함수 끝
		//개별 input 태그 삭제
		$(document).on("click", "#oneElDel", function() {
			console.log($(this).closest("tr").attr("id") + "<<<<<<<부모");
			var inputDelId = "#" + $(this).closest("tr").attr("id");
			$(inputDelId).remove('tr');
		})

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
			//운동 종목 삭제 함수
		$(document).on("click", "#titleDel", function() {
			//나의 부모의 첫번째 자식 요소의 텍스트값  = Main 운동(h3태그) 가져오기				
			var hTagTitle = $(this).parent().children().eq(0).text();
			//이 내용이 Main 운동 이라면 삭제가 안되고 아니라면 삭제처리
			if (hTagTitle == "Main 운동") {
				alert("메인 운동은 삭제 하실 수 없습니다.");
			} else {
				//선택한 버튼이 속해있는 테이블 아이디 값을 찾아와서 지운다.
				var closestId = $(this).closest("thead").parent().attr("id");
				var removeId = "#" + closestId;
				$(removeId).remove();
			}

		});//운동종목 삭제함수 끝

	}//window.onload

	
//작성완료 버튼을 눌렀을때 아이디가 table을 포함하는 모든 table 태그의 input의 value값을 가지고 와서 배열에 담아준다.
	$(document).on("click", "#ElSubmit",function(){
// 		console.log(ClickDateStr+"<클릭한 날짜");
// 		console.log(DayTitle + "<입력한 제목");
		var tableArray = new Array();

		//전역 변수로 선언하여 받아온 클릭한 날짜와 입력한 제목을 넣어준다.
		tableArray.push(
				{
					"ExerciseDate":ClickDateStr
				},
				{
					"title":DayTitle
				}
						);
		//제이쿼리 선택자가 유동적일때 id ^= a a로 시작하는것
		//id *= a a가 포함된것
		//id $= a a로 끝나는것
		$("table[id*='table']").find("input").each(function(){
			var tableVal = $(this).prop("value");
			var tableName = $(this).prop("name");
			//tableName 변수에 들어있는 값을 키 값으로 써주기 위해 []안에 넣어서 처리 해준다.
			tableArray.push(
					{
						[tableName]:tableVal
					}
						);
		});
				
		var JsonData = JSON.stringify(tableArray);
		console.log(JsonData);
		
		$.ajax({
			type:'post',
			async:false,
			contentType:'application/json;charset=UTF-8',
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			data:JSON.stringify(tableArray),
			dataType:'json',
			url:'${pageContext.request.contextPath}/member/ExerciseJournalSubmit',
			success:function(res){
// 				console.log(res);
				location.reload();
			}
		});
	});
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
	margin-top:200px;
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
<jsp:include page="../gnb/head.jsp" flush="true" />
	<div id='calendar'></div>

	<!-- The Modal -->
	<div id="myModal" class="modal">




		<!-- Modal content -->
		<div id="modal-content" class="modal-content">


			<table id="Sample" style="display: none;">
				<thead id="itemad">
					<tr>
						<!-- 추가적인 input을 생성하는 버튼 -->
						<th colspan="2"><button id="ElBtn" type="button">+</button></th>
						<th colspan="2"><button id="ElDel" type="button">-</button></th>

					</tr>
					<tr>
						<th colspan="4"><h3>Main 운동</h3> <input type="hidden"
							id="exName" name="ExerciseName" value="Main 운동" />
							<button id="titleDel" type="button">삭제</button></th>
					</tr>
					<tr>
						<th><label> Set(세트수) </label></th>
						<th><label> Reps(반복횟수) </label></th>
						<th><label> lb(무게)</label></th>

					</tr>
				</thead>
				<tbody id="ite">
					<tr>
						<td><p>1</p> <input type="hidden" name="set" value="1" /></td>
						<td><input type="number" name="Reps" min="1" value="10"></td>
						<td><input type="number" name="lb" min="1" value=""></td>
					</tr>
				</tbody>
			</table>

			<span class="close">&times;</span>


			<!-- 			<button id="ElSubmit" onclick="document.getElementById('frm').submit();">작성완료</button> -->
			<button id="ElAdd">종목추가</button>
			<button id="ElSubmit">작성완료</button>
			<form id="frm" class="sform" action="ExerciseJournal" method="post">
				<sec:csrfInput />
				<table id="table">
					<thead id="itemsHead">
						<tr>
							<!-- 추가적인 input을 생성하는 버튼 -->
							<th colspan="2"><button id="ElBtn" type="button">+</button></th>
							<th colspan="2"><button id="ElDel" type="button">-</button></th>

						</tr>
						<tr>
							<th colspan="4"><h3>Main 운동</h3> <input type="hidden"
								name="ExerciseName" value="Main 운동" />
								<button id="titleDel" type="button">삭제</button></th>
						</tr>
						<tr>
							<th><label> Set(세트수) </label></th>
							<th><label> Reps(반복횟수) </label></th>
							<th><label> lb(무게)</label></th>

						</tr>
					</thead>
					<tbody id="tbodyItems">
						<tr>
							<td><p>1</p> <input type="hidden" name="set" value="1" /></td>
							<td><input type="number" name="Reps" min="1" value="10"></td>
							<td><input type="number" name="lb" min="1"></td>
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