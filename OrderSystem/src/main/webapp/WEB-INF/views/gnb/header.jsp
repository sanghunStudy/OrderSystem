<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderSystem</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* window.onload = function(){
}
 */	
 
 
 var start = true;
 
 $(document).ready(function(){
	$('.wrap-loading').hide(); 
 });
 
 
 $(document).ajaxStart(function(){
// 	 start = false;
// 	$('.wrap-loading').show();
	start = false;
 
 });
 
 $(document).ajaxStop(function(){
	 $('.wrap-loading').hide(); 
 });
	function cartAdd(menuCode){
		
		
		if(start){
			
		
		$.ajax({
			url:'${pageContext.request.contextPath}/cart',
			type:'post',
			async: false,
			data:{
				'code':menuCode
			},
// 			begin : function() {

// 				start = false;

// 			},
			success:function(data){
				var co = [];
				co.push(document.cookie);
				
				
				for(var i =0; i < co.length; i++){
 					$('#cartBox').html(co);	
					console.log(co[i] + "쿠키 길이는 : "+data);
				}
				start = true;
			}
			
		});

		}
	}	

 	function cartDel(){
 		$.ajax({
 			url:'${pageContext.request.contextPath}/cartDel',
 			success:function(data){
 				var co = [];
				co.push(document.cookie);
				
 				$('#cartBox').html(co);
 				start = true;
 			}
 		});
 	}

</script>

<style type="text/css">
.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
		endColorstr='#20000000'); /* ie */
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}


</style>


</head>
<body>
	<div class="wrap-loading">

		<div>
			<img src="${pageContext.request.contextPath}/resources/images/loading1.gif" />
		</div>

	</div>

	<a>장바구니</a>
	<div>
		<div id="cartBox">
		
		</div>
	</div>
	<button onclick="cartDel()">장바구니 비우기</button>
</body>
</html>