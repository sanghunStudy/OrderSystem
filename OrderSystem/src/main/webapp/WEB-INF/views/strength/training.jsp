<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript">
	/* function calconerm() {
		var kg = document.getElementById("kg").value;
		kg = Number(kg);
		var reps = document.getElementById("reps").value;
		reps = Number(reps);
		var onerm = Math.floor(kg * (1 + (reps / 30)));
		document.getElementById("onerm").value = onerm;
	} */
	/* 
	function OnermPercent() {
		var onerm = document.getElementById("onerm").value;
		onerm = Number(onerm);
		var maxonerm = onerm+2.5;
		var twodpfive;
		for(var i=0; i<=maxonerm; i++)
			var twodpfive[i] = 2.5*i;
		console.log(twodpfive);
	} */
</script>
<script src="https://unpkg.com/vue"></script>
<style>
#onet{
	text-align:center;
	border:1px solid black;
}
</style>
</head>
<body>
	<form>
		<div id="app">
			<label>사용중량</label> <input v-model="x" type="number" id="kg">
            <label>반복횟수</label> <input v-model="y" type="number" id="reps">
			<label>추산1RM : </label> <span id="onerm">{{ sum }}</span>
		</div>
	</form>
	 <script>
    
        var app = new Vue({
        el: '#app',
        data: {
            x: 0,
            y: 0,
            sum: 0
        },
        watch : {
			x : function(v) {
               
               var result = Math.floor(Number(v) * (1 + (Number(this.y) / 30)));
				
                if(isNaN(result)) this.sum = 0;
                else 
                this.sum = result;
            },
            
			y : function(v) {
               
               var result = Math.floor(Number(this.x) * (1 + (Number(v) / 30)));
				
                if(isNaN(result)) this.sum = 0;
                else 
                this.sum = result;
            }
		}
        });
    </script>
	<table id="onet">
		<thead>
			<tr>
				<th>Warm up set</th>
				<th>%1RM</th>
				<th>중량</th>
				<th>reps</th>
				<th>셋트당 휴식시간</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>50%</td>
				<td id="fifty"></td>
				<td>8</td>
				<td>~2분</td>
			</tr>
			<tr>
				<td>2</td>
				<td>60%</td>
				<td id="sixty"></td>
				<td>5</td>
				<td>~2분</td>
			</tr>
			<tr>
				<td>3</td>
				<td>70%</td>
				<td id="seventy"></td>
				<td>3</td>
				<td>~3분</td>
			</tr>
			<tr>
				<td>4</td>
				<td>80%</td>
				<td id="eighty"></td>
				<td>1</td>
				<td>~3분</td>
			</tr>
			<tr>
				<td>5</td>
				<td>90%</td>
				<td id="ninety"></td>
				<td>1</td>
				<td>~5분</td>
			</tr>
			<tr>
				<td>6</td>
				<td>95%</td>
				<td id="ninetyfive"></td>
				<td>1</td>
				<td>5-15분</td>
			</tr>
			<tr>
				<td>7</td>
				<td>100%</td>
				<td id="onehundred"></td>
				<td>1</td>
				<td>5-15분</td>
			</tr>
			<tr>
				<th>NEW 1RM SET</th>
				<th colspan="4">컨디션에 따라 NEW 1RM SET 진행하세요.</th>
			</tr>
			<tr>
				<td>8+</td>
				<td>102%</td>
				<td id="onehundredtwo"></td>
				<td>1</td>
				<td>5-15분</td>
			</tr>
			<tr>
				<td>9+</td>
				<td>102% from New PR</td>
				<td id=""></td>
				<td>1</td>
				<td></td>
			</tr>
		</tbody>
	</table>
</body>
</html>