<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/charts.css">
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/style.css"></head> --%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/icomoon/demo-files/demo.css"> --%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/charts.js"></script> 

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<title>Insert title here</title>
<style>

</style>
<script>

var deadAvg=[],
	deadDate=[],
	squatAvg=[],
	squatDate=[],
	benchAvg=[],
	benchDate=[],
	inputWeight=[],
	inputDate=[],
	list=[]; 


</script>
</head>
<body>
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
 			deadDate.push('${avg.start}');
			deadAvg.push('${avg.avgLb}');
			
			for(var i=0 ; i<30-deadAvg.length() ; i++) {
				deadAvg.push(' ');
				deadDate.push(' ');
			}
		</script> 
		</c:when>
		<c:when test="${avg.exerciseName eq '스쿼트'}">
 		<script> 
				squatDate.push('${avg.start}');
 				squatAvg.push('${avg.avgLb}');
 			
		</script>			
		</c:when>
		<c:when test="${avg.exerciseName eq '플랫벤치프레스'}">
		<script> 
 					benchDate.push('${avg.start}');
 					benchAvg.push('${avg.avgLb}');
 				
 		</script> 
		</c:when>
		<c:otherwise>
		<script>
		
		</script>
		</c:otherwise>
		</c:choose>
		<script> 
 		
		</script>
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
<script>
new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["탄수화물","단백질","지방"],
      datasets: [
        {
          label: "탄단지 비율",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
          data: [1180,720,320]
        }
      ]
    },
    options: {
    	maintainAspectRatio: false,
      title: {
        display: true,
        text: '3대 영양소 권장섭취량 (in kcal)'
      }
    }
});
</script>
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
		<table class="exercise-list">
			<tr>
				<td>이름</td>
				<td>세트수</td>
				<td>횟수</td>
				<td>중량</td>
			</tr>
			
				<c:forEach var="item" items="${todayList}" begin="0">
								
					<c:forEach var="details" items="${item.details}" >
					<script>	
					var item = 
						{date:'${item.start}',
						 name:'${item.exerciseName}',	
						 set:'${details.exerciseSet}',
						 reps:'${details.exerciseReps}',
						 lb:'${details.exerciseLb}'
							}				
					list.push(item);
			
					</script>
			<tr>
					<td>${item.exerciseName}</td>
						
							<td>${details.exerciseSet}</td>
							<td>${details.exerciseReps}</td>
							<td>${details.exerciseLb}</td>
					</tr>				
					</c:forEach>
			
				</c:forEach>
		<script>
		
		</script>
		
		</table>
	</div>
</div>
</div>
</body>
</html>