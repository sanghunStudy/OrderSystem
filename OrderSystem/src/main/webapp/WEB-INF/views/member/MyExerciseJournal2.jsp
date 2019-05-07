<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>운동일지</title>

<style>

/* 전체영역 */
#allDiv{
	width:1024px;
	margin:0 auto;
}

/* 오른쪽 운동명 전체박스 */
#infoContainer{
	float:right;
	width:550px;
	margin:0 6px;
	background:#ebeb;
}

/* 운동명 개별 박스 */
#infoContainer div{
	border:1px solid #eee;
	margin:5px 20px;
	height:60px;
}

.exTitles p{
	margin:0px;
	padding:0px;
}

/* 왼쪽 전체박스 */
#inputContainer{
	float:left;
	width:400px;
}

/* 검색박스 */
#SearchBox{
	height:80px;
	border:1px solid #eee;
}

/* 검색인풋박스 */
#SearchInput{
	width:324px;
	line-height:70px;
	margin:0 auto;
}
#createDiv li{
	list-style: none;
}

/* 왼쪽 박스 input태그 설정 */
#createDiv input{
	width:50px;
	border:none;
	border-bottom:1px solid black;
	margin:0 5px;
}
#SearchInput input{
	width:300px;
	height:20px;
	padding:10px;
}
.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.tabs li {
	background: none;
	color: #222;
/* 	display: inline-block; */
	padding: 10px 15px;
	cursor: pointer;
}

.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}

/* 새로 생기는 탭태그 */
#createli {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

#createli li {
	background: none;
	color: #222;
	padding: 10px 15px;
	cursor: pointer;
}

#createli li.current {
	background: #ededed;
	color: #222;
}

.exercise_content {
	display: block;
/* 	background: #ededed; */
	padding: 15px;
}

.exercise_content {
	display: inherit;
}

.icon{
	font-size:40px;
}
</style>

<script type="text/javascript">
	$(function() {
		//input을 date1로 선언
		$("#date1")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd' //Input Display Format 변경
							,
							showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
							,
							showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
							,
							changeYear : true //콤보박스에서 년 선택 가능
							,
							changeMonth : true //콤보박스에서 월 선택 가능                
							,
							showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
							,
							buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
							,
							buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
							,
							buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
							,
							yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
							,
							monthNamesShort : [ '1', '2', '3', '4', '5', '6',
									'7', '8', '9', '10', '11', '12' ] //달력의 월 부분 텍스트
							,
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
							,
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
							,
							dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
									'금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
							,
							minDate :0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
// 							minDate : "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
							,
// 							maxDate: 0
 							maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
						});

		//초기값을 오늘 날짜로 설정
		$('#date1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            

		//탭메뉴
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})
		var count = 1;

		//검색기능
		$("#keyWord").keyup(function(){
			var word = $(this).val();
			$("#infoContainer > .exTitles").hide();
			var items = $("#infoContainer > .exTitles > p:contains('" + word + "')");
// 			console.log(items);
			
			$(items).parent().show();
		});
		
		//운동명 클릭시 탭메뉴 생성하기
		$(".itemsName")
				.on(
						"click",
						function() {
							//클릭한 텍스트 가져오자
							var exerciseTitle = $(this).attr("title");
							$("#keyword").val(exerciseTitle);

							var createTitle;
							var createContent;
							//공통적인 부분(탭메뉴 기본 input태그)
							var btnItem = "<button id='inputAdd'>+</button><button id='inputDel'>-</button>";
							var inputItems = 
									  "<ul class='input_item"+count+"'>"
									+ "<li>"
									+"<input type='hidden' name='ExerciseName' value='"+exerciseTitle+"'/>"
									+"<span>1</span>"
									+ "<input type='hidden' min='1' name='set' value='1'/>"
									+ "<input type='number' min='1' name='Reps' value='10'/>"
									+ "<input type='number' min='1' name='lb'/>"
									+"</li>"
									+"</ul>";
							
							var delLi = "<span class='deletelis'>X</span>";
							console.log("선택한 이름"+exerciseTitle);		
							//선택한 종목이 이미 존재하나 확인
							var chkTitle = $(".exercise_link:contains("
									+ exerciseTitle + ")").length;
							
							//존재하지 않는다면 (길이가 0) 탭메뉴를 만들어준다.
							if (chkTitle == 0) {

								//탭메뉴 생성
								//처음 만드는 탭의 내용은 보여준다
								if (count == 1) {
									createContent =
											"<div class='exercise_link current' data-tab='exercise_content"+count+"'>"
											+ exerciseTitle 
											+ delLi
											+ "</div>"
											+ "<div id='exercise_content"+count+"' class='exercise_content current'>"
											+ btnItem + inputItems + "</div>";

								} else {
									createContent = 
											"<div class='exercise_link' data-tab='exercise_content"+count+"'>"
											+ exerciseTitle 
											+ delLi
											+ "</div>"
											+ "<div id='exercise_content"+count+"' class='exercise_content'>"
											+ btnItem + inputItems + "</div>";

								}

								$("#createli").append(createTitle);
								$("#createDiv").append(createContent);
								// 			$(".exercise_content").css("display","none");

								count++;
							} else {
								alert("이미 선택한 종목입니다.");
							}
						});
	});
	
	
	
	
	//생성된 탭 메뉴 삭제
	$(document).on("click",".deletelis",function(){
		// data-tab을 찾아서 li와 data-tab의 내용과 같은 아이디를 가진 항목을 삭제
		var delData = $(this).parents("div").attr("data-tab");
// 		$(this).parents().remove();
		$(this).parent().remove();
		console.log("h111h");
		$("#"+delData).remove();


// 		//삭제후 남은li중 첫번째 녀석의 data-tab을 가져와서 그 녀석과 관련된 내용을 자동으로 보이게 함
// 		var FdataTab = $("#createli li:first-child").attr("data-tab");
// 		$("#createli li:first-child").addClass("current","current")
// 		//여기서 css("display","block")만 쓰면 안먹힘 왜 그런지는 아직 모르겠음;
// 		$("#"+FdataTab).css("display","block");
// 		$("#"+FdataTab).css();

	});
	//input 태그 추가
	$(document)
			.on(
					"click",
					"#inputAdd",
					function() {
						//클릭한 버튼이 있는 영역의 input태그가 존재하는 ul의 클래스
						var divClass = $(this).siblings("ul").attr("class");

						//div의 spane 태그의 길이를 가져온다.
						var inputNum = $("." + divClass).find("span").length + 1;

						var addInput = "<li><span>"
								+ inputNum
								+ "</span>"
								+ "<input type='hidden' min='1' name='set' value='"+ inputNum +"'/>"
								+ "<input type='number' min='1' name='Reps' value='10'/>"
								+ "<input type='number' min='1' name='lb'/></li>";
						//해당 ul에 li를 추가해준다.
						$("." + divClass).append(addInput);
					});

	//input태그 삭제
	$(document).on("click", "#inputDel", function() {
		//클릭한 버튼이 있는 영역의 input태그가 존재하는 ul의 클래스
		var divClass = $(this).siblings("ul").attr("class");

		var redivClass = "." + divClass;
		//div의 span 태그의 길이를 가져온다.
		var inputNum = $(redivClass).find("span").length;
		//span 태그가 1개보다 많으면 삭제
		if (inputNum > 1) {
			$(redivClass + " li").last().remove();
		}

	});
	//작성완료버튼 클릭시 운동일자, 일지제목, 운동명, 운동정보(세트수,중량,반복회수)를 서버로 보내야함.
	$(document).on("click","#eJSubmit",function(){
		var ClickDateStr = $("#date1").val();
		var DayTitle = $("#inputTitle").val();
		var userWeight = $("#userWeight").val();
// 		console.log("작성완료");
		
		//배열선언
		var tableArray = new Array();
		//배열에 날짜,제목 넣는다
		tableArray.push({
			"ExerciseDate":ClickDateStr
		},
		{
			"title":DayTitle
		},
		{
			"userWeight":userWeight
		}
		);
		
		//ul태그중 클래스명이 input_item을 포함하는 것들의 input태그의 값 가져와서 배열에 넣는다.
		$("ul[class*='input_item']").find("input").each(function(){
			var tableVal = $(this).prop("value");
			var tableName = $(this).prop("name");
			
			tableArray.push(
					{
					[tableName]:tableVal
				}
			);
			
		});
		
		//json형식으로 바꿔준다.
		var JsonData = JSON.stringify(tableArray);
// 		console.log(JsonData);
		
		//ajax을 통해서 서버에 전달
		$.ajax({
			type:'post',
			async:false,
			contentType:'application/json;charset=UTF-8',
			data:JSON.stringify(tableArray),
			dataType:'json',
			url:'${pageContext.request.contextPath}/member/ExerciseJournalSubmit',
			success:function(res){
// 				console.log(res);
 				location.href = "MyPage";
			}
		});
	});
	
	$(document).on("click",".icon",function(){
		alert("test");
		console.log($(this));
		$("inputTitle").val($(this));
	});
</script>
</head>
<%-- <jsp:include page="../gnb/head.jsp" flush="true" /> --%>
<body>
	<div id="allDiv">
		<h1>MyExerciseJournal</h1>
		<input type="text" name="date" id="date1" size="12" disabled="disabled"/>
<!-- 		<div> -->
<!-- 			<span class="icon"><i class="fas fa-grin"></i></span> -->
<!-- 			<span class="icon"><i class="far fa-frown"></i></span> -->
<!-- 			<span class="icon"><i class="far fa-tired"></i></span> -->
<!-- 		</div> -->
		
		
		<div id="infoContainer">
				<div class="exTitles">
					<p>벤치프레스</p>
					<span>3set</span><span>1reps</span><span>바벨</span><span class="itemsName" title="플랫벤치프레스">담기</span>
				</div>
				<div class="exTitles">
					<p>인클라인 벤치 프레스</p>
					<p><span>3set</span><span>1reps</span><span>바벨</span><span class="itemsName" title="인클라인 벤치프레스">담기</span></p>
				</div>


				<div class="exTitles">
					<p>데드리프트</p>
					<p><span>3set</span><span>1reps</span><span>바벨</span><span class="itemsName" title="데드리프트">담기</span></p> 
				</div>
				<div class="exTitles">	
					<p class="itemsName">바벨로우</p>
				</div>


				<div class="exTitles">
					<p>스쿼트</p>
					<p><span>3set</span><span>1reps</span><span>바벨</span><span class="itemsName" title="스쿼트">담기</span></p> 
				</div>
				<div class="exTitles">					
					<p class="itemsName">런지</p>
				</div>

				<div class="exTitles">
					<p class="itemsName">밀리터리 프레스</p>
				</div>
				<div class="exTitles"> 
					<p class="itemsName">숄더프레스</p>
				</div>


				<div class="exTitles">
					<p class="itemsName">덤벨컬</p> 
				</div>
				<div class="exTitles">	
					<p class="itemsName">해머컬</p>
				</div>


				<div class="exTitles">
					<p class="itemsName">크런치</p> 
				</div>
				<div class="exTitles">	
					<p class="itemsName">레그레이즈</p>
				</div>
			</div>


			<!-- 클릭했을때 생기는 탭메뉴 -->
			<div id="inputContainer">
				<div id="SearchBox">
					<div id="SearchInput">
						<input type="text" id="keyWord">
					</div>
				</div>
				<div>
				<label>제 목</label>
				<input type="text" id="inputTitle"/>
				
				<label>체 중</label>
				<input type="number" id="userWeight" min="0"/>
				</div>
				<ul id="createli">

				</ul>
				<div id="createDiv"></div>
			<button type="button" id="eJSubmit">작성완료</button>
			</div>
		
	</div>
</body>
</html>