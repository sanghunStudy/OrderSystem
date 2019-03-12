<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var sum =0;

	function add(){
		var s = document.getElementById("sexSel");
		var a = 0;
		var h = 0;
		var w = 0;
		
		s = sexSel.options[sexSel.selectedIndex].text; //성별
		h = document.getElementById("h").value; //키
		a = document.getElementById("a").value; //나이
		w = document.getElementById("w").value //몸무게
		
		sum = Cal(s,h,a,w);
				
		alert(sum);
	}

	
	function Cal(s,h,a,w) {

			
		if(s == "남자") return  (w * 10) + (h *6.25) -(a * 5)+5;
		else return (w * 10) + (h *6.25) -(a * 5) - 161;
	}
</script>
</head>
<body>
	<h1>일일 칼로리 계산기</h1>
	<table>
		<tr>
			<th>Step 1 - 신체 정보 입력</th>
		</tr>
		<tr>
			<td>성별 나이 키 체중을 입력하고, 식단 정보 및 오늘의 훈련량을 설정하세요.</td>
		</tr>
	</table>
	<form>
		<table>
			<tr>
				<td>성별</td>
				<td><select id ="sexSel" name="sexSel">
						<option value="1">남자</option>
						<option value="2">여자</option>
				</select></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" id ='a'></td>
			</tr>
			<tr>
				<td>키</td>
				<td><input type="text" id ='h'></td>
			</tr>
			<tr>
				<td>체중</td>
				<td><input type="text" id ='w'></td>
			</tr>
			<button type="button" onclick="add()"></button>
			<%-- 
			<tr>
				<td>훈련량</td>
				<td><select>
						<option value="일상생활">일상생활</option>
						<option value="적은훈련량">적은훈련량</option>
						<option value="일반적인훈련량">일반적인훈련량</option>
						<option value="높은훈련량">높은훈련량</option>
				</select></td>
			</tr>
			<tr>
				<td>식단 목표</td>
				<td><select>
						<option value="">체중감소(극단적)</option>
						<option value="">체중감소(적극적)</option>
						<option value="">체중감소(중립적)</option>
						<option value="">체중감소(소극적)</option>
						<option value="">체중유지</option>
						<option value="">체중증가(소극적)</option>
						<option value="">체중증가(중립적)</option>
						<option value="">체중증가(적극적)</option>
				</select></td>
			</tr>
			--%>
		</table>
	</form>
	<a href="..">처음으로</a>
</body>
</html>