<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#list { width: 400px; border:1px solid black; border-collapse:collapse;}
	#list td, #list th { border: 1px solid black; text-align:center;}
	#list > thead > tr { color:yellow; background-color:purple;}
</style>
<script src="https://unpkg.com/vue"></script>
	<script>
		var vmNut = new Vue({
			el : '#nutr',
			data : {
				bodyFat : '',
				protein : '',
				fat : '',
			},
			computed : {
				
			}
		});
	</script>
	<h1>영양 균형 설정</h1>
	<div id="nutr">
		<h3>영양 균형 설정</h3>
		<table border=1>
			<tr>
				<td>step2 - 영양 균형 설정</td>				
			</tr>
			<tr>
				<td>현재 체지방 수치를 입력하고, 단백질과 지방 섭취비율을 설정하세요.</td>
			</tr>
		</table>
		<table border=1>
			<tr>
				<td>체지방 수치</td>
				<td><input type="text" v-model="bodyFat"></td>
			</tr>
			<tr>
				<td>단백질 섭취비율 설정</td>
				<td>
					<select v-model="protein">
						<option disabled="disabled" selected>단백질 섭취비율을 설정해주세요</option>
						<option>1.6</option>
						<option>1.7</option>
						<option>1.8</option>
						<option>1.9</option>
						<option>2.0</option>
						<option>2.1</option>
						<option>2.2</option>
						<option>2.3</option>
						<option>2.4</option>
						<option>2.5</option>
						<option>2.6</option>
						<option>2.7</option>
						<option>2.8</option>
						<option>2.9</option>
						<option>3.0</option>
						<option>3.1</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>지방 섭취비율 설정</td>
				<td>
					<select v-model="fat">
						<option disabled="disabled" selected>지방 섭취비율을 설정해주세요</option>
						<option>0.9g/kg</option>
						<option>1.0g/kg</option>
						<option>1.1g/kg</option>
						<option>1.2g/kg</option>
						<option>1.3g/kg</option>
						<option>20%</option>
						<option>25%</option>
						<option>30%</option>
					</select>
				</td>
			</tr>
		</table>
		<span>{{bodyFat}}</span>
		<table border=1>
			<tr>
				<td colspan="6">ACSM이 권장하는 운동선수와, 신체 황동이 왕성한 성인을 위한 에너지 비율</td>
			</tr>
			<tr>
				<td>탄수화물</td>
				<td>총열량의 45-65%</td>
				<td>단백질</td>
				<td>총열량의 10-35%</td>
				<td>지방</td>
				<td>총열량의 20-35%</td>
			</tr>
		</table>
		
		<table border=1>
			<tr>
				<td colspan="3">오늘의 영양 균형</td>
			</tr>
			<tr>
				<td>탄수화물</td>
				<td>단백질</td>
				<td>지방</td>
			</tr>
			<tr>
				<td>123</td>
				<td>213</td>
				<td>41</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
			</tr>
			<tr>
				<td>4</td>
				<td>5</td>
				<td>6</td>
			</tr>
		</table>
	</div>
</head>
<body>

</body>
</html>