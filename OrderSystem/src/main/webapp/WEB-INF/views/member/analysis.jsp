<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/charts.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/charts.js"></script> 

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<title>Insert title here</title>
<style>

</style>
</head>
<body>
<div class="menu-box">
<div class="menu-bar"></div>
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
			
				<c:forEach var="item" items="${list}" begin="0" varStatus="i">
								
					<c:forEach var="details" items="${item.details}" >
			<tr>
					<td>${item.exerciseName}</td>
						
							<td>${details.exerciseSet}</td>
							<td>${details.exerciseReps}</td>
							<td>${details.exerciseLb}</td>
					</tr>				
					</c:forEach>
			
				</c:forEach>

		
		</table>
	</div>
</div>
</body>
</html>