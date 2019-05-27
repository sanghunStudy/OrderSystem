<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gnb.js"></script>
<title>운동일지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script type="text/javascript">
	$(document).ready(function(){
		inputDatepicker();
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
		$(".itemsName").on("click",function() {
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
		var sChk = "${sessionScope.user}";
		if(sChk){
			var ClickDateStr = $("#date1").val();
			var DayTitle = $("#inputTitle").val();
			var userWeight = $("#userWeight").val();
//	 		console.log("작성완료");
			
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
//	 		console.log(JsonData);
			
			//ajax을 통해서 서버에 전달
			$.ajax({
				type:'post',
				async:false,
				contentType:'application/json;charset=UTF-8',
				data:JSON.stringify(tableArray),
				dataType:'json',
				url:'${pageContext.request.contextPath}/member/ExerciseJournalSubmit',
				success:function(res){
//	 				console.log(res);
	 				location.href = "MyPage";
				}
			});
		}else{
			alert('로그인 후 이용 가능합니다.');
		}
		

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
	<div id="myExercise" class="content-container">
		<h1>MyExerciseJournal</h1>
		<input type="text" name="date" id="date1" class="input-date" size="12" disabled="disabled"/>
<!-- 		<div> -->
<!-- 			<span class="icon"><i class="fas fa-grin"></i></span> -->
<!-- 			<span class="icon"><i class="far fa-frown"></i></span> -->
<!-- 			<span class="icon"><i class="far fa-tired"></i></span> -->
<!-- 		</div> -->
		
		
		<div id="infoContainer">
			<c:choose>
				<c:when test="${eTlist.size() > 0 }">
					<c:forEach var="eTlist" items="${eTlist}">
					<div class="exTitles">
						<p>${eTlist.teName}</p>
						<span>${eTlist.teSet}</span><span>${eTlist.teReps}</span><span>${eTlist.teTool}</span><span class="itemsName" title="${eTlist.teName}">담기</span>
					</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>등록된 운동이 없습니다.</p>
				</c:otherwise>
			</c:choose>
			</div>


			<!-- 클릭했을때 생기는 탭메뉴 -->
			<div id="inputContainer">
				<div id="SearchBox">
					<div id="SearchInput" class="input-auto-box">
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