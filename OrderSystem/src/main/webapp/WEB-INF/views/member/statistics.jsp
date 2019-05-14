<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/charts.css">
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/style.css"></head> --%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/demo-files/demo.css"> --%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/charts.js"></script> 

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<title>나의 운동 차트</title>
<style>

</style>

</head>
<body>
<c:forEach var="energy" items="${metabolism}">
	<script>
	metabolism={
		b:'${energy.bmetabolism}',
		e:'${energy.erequirement}'		
	}
	
	</script>
</c:forEach>
<c:forEach var="weights" items="${weight}">
	<script>
		
	inputDate.push('${weights.start}');
	inputWeight.push('${weights.userWeight}');
	
	</script>
</c:forEach>
<c:forEach var="avg" items="${avgLb}"> 
	<c:choose> 
 		<c:when test="${avg.exerciseName eq '데드리프트'}" > 
		<script>
		
		dead.push('${avg.avgLb}');
		deadDate.push('${avg.start}');
		</script> 
		</c:when>
		<c:when test="${avg.exerciseName eq '스쿼트'}">
 		<script> 
	
		squat.push('${avg.avgLb}');
		squatDate.push('${avg.start}');
		
		</script>			
		</c:when>
		<c:when test="${avg.exerciseName eq '플랫벤치프레스'}">
		<script> 
	
		bench.push('${avg.avgLb}');
		benchDate.push('${avg.start}');
		
 		</script> 
		</c:when>
		<c:otherwise>

		</c:otherwise>
		</c:choose>

</c:forEach>

<div id="fullBox">
<div class="menu-box">
<div class="menu-bar">
	<div class="menu-icons"><a href="statistics"><i class="fas fa-chart-bar"></i></a></div>
	<div class="menu-icons"><a href="MyExerciseJournal"><i class="fas fa-book"></i></a></div>
	<div class="menu-icons"><a href="basicInformation"><i class="fas fa-user-edit"></i></a></div>
	<div class="menu-icons"><a href="mentiManagement"><i class="fas fa-users"></i></a></div>
	<div class="menu-icons"><a href="${pageContext.request.contextPath}/opo/webRtc"><i class="fas fa-comment-dots"></i></a></div>
</div>
</div>
<div id="wrapper">
<div class="four-charts">
	<div id="lineChart dead" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-daed"></canvas>

	</div>
	<div id="lineChart squat" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-squat" ></canvas>

	</div>
	<div id = "lineChart bench" style="position: relative; height:25vh; width:22vw">
		<canvas id="line-chart-bench"></canvas>

	</div>
	<div id = "doughnutChart" style="position: relative; height:25vh; width:22vw">
	<canvas id="doughnut-chart"></canvas>

	</div>
</div>
	<div id = "another-chart">
		<div id = "lineChart-weight" style="position: relative; height:35vh; width:54vw">
			<canvas id="line-chart-weight"></canvas>
		</div>
		<div id = "radarChart" style="position: relative; height:35vh; width:35vw">
			<canvas id="radar-chart"></canvas>

		</div>
	</div>
	
	<div id = "exercise-list-box">
		<h5>최근 운동일지</h5>
		<div class="detail"><span>more</span><i class="fas fa-plus"></i></div>
		<table class="exercise-list">
			<tr>
			    <td>운동명</td>
			    <td>평균 중량</td>
				<td>반복회수</td>
				<td>세트 합계</td>
				<td>1RM</td>
			</tr>
			
				<c:forEach var="item" items="${avgLb}" begin="0" varStatus="status">
					
				
					<script>
						data = {
							date:'${item.start}',
							name:'${item.exerciseName}',
							lb:'${item.avgLb}',
							reps:'${item.sumReps}',
							set:'${item.doneSet}',
							oneRm:'${item.oneRm}'
						};
						copyArray.push(data);
	
					</script>		
					
								
			<c:if test="${item.start == avgLb[0].start}">
			<tr class="percentRow">
					<td class="exTitle">${item.exerciseName}</td>
					<td class="avgLb">${item.avgLb}</td>
					<td class="sumReps">${item.sumReps}</td>
					<td class="doneSet">${item.doneSet}</td>
					<td class="oneRm">${item.oneRm}</td>
					
			</tr>				
			</c:if>	
				</c:forEach>	

		</table>
		<script>
// 		var lbs = document.getElementsByClassName('avgLb');
// 		var repeatCounts =  document.getElementsByClassName('sumReps');
// 		var totSets = document.getElementsByClassName('doneSet');
// 		var RMs = document.getElementsByClassName('oneRm');
	
		console.log(copyArray);
	

			var index = -1;
			var val = document.body.getElementsByClassName('exTitle');
			for(var q=0;q<val.length;q++){
			var filteredObj = copyArray.filter(function(item, i){
			
			    
			    return item.name === val[q].innerText;
			  
			});
			for(var i=0; i<4;i++) {
				
			var lbPercent = rateCal(filteredObj[1].lb,filteredObj[0].lb)+'%';
			    repsPercent = rateCal(filteredObj[1].reps,filteredObj[0].reps)+'%';
			    setPercent = rateCal(filteredObj[1].set,filteredObj[0].set)+'%';
			    oneRmPercent = rateCal(filteredObj[1].oneRm,filteredObj[0].oneRm)+'%';
			var rate = documnet.body.createElemnet('span');
			rate.className = 'rate';
			rate.innerHTML = percent;
			console.log()
			
			}
			console.log(filteredObj);
		
			}
		</script>
	</div>
	<div class="toWrapper">
		<div class="toDo">
			<div><div class="title"><span>To do list</span></div><div class="edit_list"><i class="fas fa-edit"></i></div></div>
			<div class=""></div>
		</div>
		<div class="toEat">
			<div><div class="title"><span>To eat list</span></div><div class="edit_list"><i class="fas fa-edit"></i></div></div>
			<div class=""></div>
		</div>
	</div>
</div>
</div>
<script>
// for(var j=0; j<copyArray.length;j++) {
// 	for(var k=0; k<copyArray; k++) {
// 		if(copyArray[j].name = copyArray[k].name) {
// 			row = {
// 					date:copyArray[k].date,
// 					name:copyArray[k].name,
// 					lb:copyArray[k].lb,
// 					reps:copyArray[k].reps,
// 					set:copyArray[k].set,
// 					oneRm:copyArray[k].oneRm
// 			}
// 			change.push(row);
// 			console.log(change);
		
// 		}
// 	}
// }
</script>
<script src="${pageContext.request.contextPath}/resources/js/statistics.js"></script>
</body>
</html>