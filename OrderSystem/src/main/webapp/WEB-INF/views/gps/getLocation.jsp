<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script>
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	console.log(position.coords.latitude + ' ' + position.coords.longitude);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    console.log('GPS를 지원하지 않습니다');
	  }
	}
	getLocation();
window.onload = function(){
	var btn = document.getElementById("btn");
	 
	 if(btn){
		 btn.addEventListener("click",function(){
				var data = document.getElementById("seach").value;
				$.ajax({
					url:'test',
					data:{
						"data":data
					},
					//dataType:"text",
					sucess:function(res){
						console.log(res);
					if(res.length > 0){
						document.getElementById("sucess").html(res);	
					}else{
						console.log("값이 없음");
					}
					
					},
					error:function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }

				});
		 });  
	 }	
}
 
</script>
<style type="text/css">
li {
	display: inline-block;
	text-decoration: none;
}
</style>
</head>
<body>
	<form action="test">
	<select name="data">
		<option value="식당">식당</option>
		<option value="헬스장">헬스장</option>
	</select>
<!-- 	<input type="text" id="seach" name="data" value="" /> -->
	<button type="submit" id="btn1">검색</button>
	<div id="sucess"></div>
	</form>
	
<div>
${item}
</div>
</body>
</html>