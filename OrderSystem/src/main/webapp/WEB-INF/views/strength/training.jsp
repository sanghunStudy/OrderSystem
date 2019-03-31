<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

<script src="https://unpkg.com/vue"></script>
<style>
#onet{
	text-align:center;
	border:1px solid black;
}
</style>
</head>
<body>
		<div id="app">
			<label>사용중량</label> <input v-model="x" type="number" id="kg">
            <label>반복횟수</label> <input v-model="y" type="number" id="reps">
			<label>추산1RM : </label> <span id="onerm">{{ sum }}</span>
		
	 
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
				<td>{{ one }}</td>
				<td>8</td>
				<td>~2분</td>
			</tr>
			<tr>
				<td>2</td>
				<td>60%</td>
				<td>{{ two }}</td>
				<td>5</td>
				<td>~2분</td>
			</tr>
			<tr>
				<td>3</td>
				<td>70%</td>
				<td>{{ three }}</td>
				<td>3</td>
				<td>~3분</td>
			</tr>
			<tr>
				<td>4</td>
				<td>80%</td>
				<td>{{ four }}</td>
				<td>1</td>
				<td>~3분</td>
			</tr>
			<tr>
				<td>5</td>
				<td>90%</td>
				<td>{{ five }}</td>
				<td>1</td>
				<td>~5분</td>
			</tr>
			<tr>
				<td>6</td>
				<td>95%</td>
				<td>{{ six }}</td>
				<td>1</td>
				<td>5-15분</td>
			</tr>
			<tr>
				<td>7</td>
				<td>100%</td>
				<td>{{ seven }}</td>
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
				<td>{{ eight }}</td>
				<td>1</td>
				<td>5-15분</td>
			</tr>
			<tr>
				<td>9+</td>
				<td>102% from New PR</td>
				<td>{{ nine }}</td>
				<td>1</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	</div>
	<script>
    
        var app = new Vue({
        el: '#app',
        data: {
            x: 0,
            y: 0,
            sum: 0,
            one: 0,
            two: 0,
            three: 0,
            four: 0,
            five: 0,
            six: 0,
            seven: 0,
            eight: 0,
            nine: 0
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
            },
            
            sum : function(v) {
            	var mp = [];
            	
            	var percent = [0.5,0.6,0.7,0.8,0.9,0.95,1.0,1.02];
            	
            	for (var u = 0; u <= percent.length; u++){
            		var selectone = this.sum * percent[u];
                	var min = 999.9;
                	var result = 0;
            		
            		for(var i = 0; i < selectone; i++){
            			mp[i] = i * 2.5;
            		}  
            		for(var i = 1; i < mp.length; i++){
           			
            			if(Math.abs(selectone-mp[i]) < min){
            				min = selectone-mp[i];
            				result = mp[i];
            			}
            		}
            		switch(u){
            		case 0: this.one = result; break;
            		case 1: this.two = result; break;
            		case 2: this.three = result; break;
            		case 3: this.four = result; break;
            		case 4: this.five = result; break;
            		case 5: this.six = result; break;
            		case 6: this.seven = result; break;
            		case 7: this.eight = result; break;
            		case 8: this.nine = result; break;
            		default:break;
            		}
            	}
            }
		}
        });
    </script>
</body>
</html>