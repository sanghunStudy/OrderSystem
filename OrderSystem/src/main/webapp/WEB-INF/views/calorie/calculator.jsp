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
       <!-- <div id="account">
			잔고 : <input type="text" v-model="balance" />
			<br/>
			회원님의 등급 : 
			<span v-if="balance >= 1000000">Gold</span>
			<span v-else-if="balance >= 500000">Sliver</span>
			<span v-else-if="balance >= 200000">Bronze</span>
			<span v-else>Basic</span>
        </div>
    <script>
		var simple1 = new Vue ({
			el : '#account',
			data : {
				balance : 0
			}
		})
    </script>
    	<div id="exmaple">
    		<table id="list">
    		<thead>
    			<tr>
    				<th>번호</th><th>이름</th><th>전화번호</th><th>주소</th>
    			</tr>
    		</thead>
    		<tbody id="contacts">
    			<tr v-for="contact in contacts">
    				<td>{{contact.no}}</td>
    				<td>{{contact.name}}</td>
    				<td>{{contact.tel}}</td>
    				<td>{{contact.address}}</td>
    			</tr>
    		</tbody>
    		</table>
    	</div>
    <script>
    	var model = {
    			"pageno": 1,
    			"pagesize" : 10,
    			"totalcount" : 100,
    			"contacts" : [
    				{ "no" : 100, "name": "설현", "tel": "010-3456-8299", "address": "서울"},
    				{ "no" : 99, "name": "혜리", "tel": "010-3456-8298", "address": "서울"},
    				{ "no" : 98, "name": "하니", "tel": "010-3456-8297", "address": "경기"},
    				{ "no" : 97, "name": "성소", "tel": "010-3456-8296", "address": "제주"},
    				{ "no" : 96, "name": "혜리", "tel": "010-3456-8295", "address": "서울"},
    				{ "no" : 95, "name": "하니", "tel": "010-3456-8294", "address": "경기"},
    				{ "no" : 94, "name": "성소", "tel": "010-3456-8293", "address": "제주"},
    				{ "no" : 93, "name": "혜리", "tel": "010-3456-8292", "address": "서울"},
    				{ "no" : 92, "name": "하니", "tel": "010-3456-8291", "address": "경기"},
    				{ "no" : 91, "name": "성소", "tel": "010-3456-8290", "address": "제주"},
    			]
    	}
    	
    	var list = new Vue ({
    		el : "#exmaple",
    		data : model
    	});
    </script>
     --> 
    <!-- <div id="app">
    	<input type="text" v-model="height">
    	<input type="text" v-model="weight">
    	<table border=1>
    		<tr>
    			<td>기초대사량</td>
    			<td>추정 에너지 요구량</td>
    		</tr>
    		<tr>
    			<td><span v-pre>{{message}}</span></td>
    			<td>dd</td>
    		</tr>
    	</table>
    </div>
     -->
     <h1>칼로리계산기</h1>
    <div id="exam">
     <table border=1>
     	<tr>
     		<td>성별</td>
     		<td>
     		 <select v-model="sex">
     		 	<option disabled="disabled" selected>성별을 선택하세요</option>
     		 	<option>남자</option>
     		 	<option>여자</option>
     		 </select>
     		</td>
     	</tr>
     	<tr>
			<td>나이</td>
			<td><input type="text" v-model="age"></td>
		</tr>
		<tr>
			<td>키</td>
			<td><input type="text" v-model="height"></td>
		</tr>
		<tr>
			<td>체중</td>
			<td><input type="text" v-model="weight"></td>
		</tr> 
		<tr>
			<td>훈련량</td>
			<td>
			 <select v-model= "train">
					<option disabled="disabled" selected>훈련량을 설정해주세요</option>
					<option>일상생활</option>
					<option>적은훈련량</option>
					<option>일반적인훈련량</option>
					<option>높은훈련량</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>식단 목표</td>
			<td><select v-model="goal">
					<option disabled="disabled" selected>식단목표를 설정해주세요</option>
					<option>체중감소(극단적)</option>
					<option>체중감소(적극적)</option>
					<option>체중감소(중립적)</option>
					<option>체중감소(소극적)</option>
					<option>체중유지</option>
					<option>체중증가(소극적)</option>
					<option>체중증가(중립적)</option>
					<option>체중증가(적극적)</option>
			</select></td>
		</tr>
     </table>
     <table border=1>
     <tr>
     	<td>기초대사량</td>
     	<td>추정에너지요구량</td>
     </tr>
     <tr>
     	<td>{{Math.round(sum)}}</td>
     	<td>{{Math.round(goalCal)}}</td>
     </tr>
     </table>
    </div>
    <script>
		var vmSum = new Vue({
			el : "#exam",
			data : { 
				 	 sex : '',
					 age : '',
					 height :'',
					 weight : '',
					 train : '',
					 goal : ''
			},
			computed : {
				sum : function() {
					if (this.sex == "남자") return (this.weight * 10) + (this.height * 6.25) - (this.age * 5) +5;
					else if(this.sex == "여자") return (this.weight * 10) + (this.height * 6.25) - (this.age * 5) -161;
					else return 0;
				},
				preCal : function() {
					if(this.train == "일상생활") return this.sum * 1.2;
					else if (this.train == "적은훈련량") return this.sum * 1.37;
					else if (this.train == "일반적인훈련량") return this.sum * 1.55;
					else if (this.train == "높은훈련량") return this.sum * 1.725;
					else return 0;
				},
				goalCal : function() {
					if(this.goal == "체중감소(극단적)") return this.preCal * 0.7; 
					else if(this.goal == "체중감소(적극적)") return this.preCal * 0.75;
					else if(this.goal == "체중감소(중립적)") return this.preCal * 0.80;
					else if(this.goal == "체중감소(소극적)") return this.preCal * 0.85;
					else if(this.goal == "체중증가(소극적)") return this.preCal * 1.05;
					else if(this.goal == "체중증가(중립적)") return this.preCal * 1.1;
					else if(this.goal == "체중증가(적극적)") return this.preCal * 1.15;
					else return this.preCal;
				}
			},
		});
    </script>
</head>
<body>
</body>
</html>