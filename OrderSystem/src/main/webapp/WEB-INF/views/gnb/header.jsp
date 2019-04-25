<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderSystem</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>



<!-- <script>
/* window.onload = function(){
}
 */	
 function getCookie(c_name)

	{

		var i,x,y,ARRcookies=document.cookie.split(";");

		for (i=0;i<ARRcookies.length;i++)

		{

		  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));

		  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);

		  x=x.replace(/^\s+|\s+$/g,"");

		  if (x==c_name)

			{

			return unescape(y);

			}

		  }

	}


 
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
				
				
				var hi = getCookie(menuCode);//누른 녀석의 쿠키 밸류값 가져옴 즉 amount
				var menuName = $('#menuName'+menuCode).text();
				var menuPrice = $('#menuPrice'+menuCode).text();
				
				console.log(hi);
				
				
				
				
				var tag = '<div>'+
				'<p>메뉴명 : </p> <span id="cartName'+menuCode+'"></span>'+
				'<p>가격 : </p> <span id="cartPrice'+menuCode+'"></span>'+
				'<p>수량 : </p> <span id="amount'+menuCode+'"></span>'+
				'<p>합계 : </p> <span id="totalPrice'+menuCode+'"></span>'+
				'</div>'
				
				
				$('#cartBox').html(tag);
				
				$('#cartName'+menuCode).text(menuName);
				$('#cartPrice'+menuCode).text(menuPrice);
				$('#amount'+menuCode).text(hi);
				$('#totalPrice'+menuCode).text(hi*menuPrice);
// 				for(var i =0; i < co.length; i++){
//  					$('#cartBox').html(co);	
// 					console.log(co[i] + "쿠키 길이는 : "+data);
// 				}
				start = true;
			}
			
		});

		}
	}	

 	function cartDel(){
 		$.ajax({
 			url:'${pageContext.request.contextPath}/cartDel',
 			success:function(data){
 				
 				$('#cartBox').html('');

 				start = true;
 			}
 		});
 	}

</script> -->

<script>
//실행했을때 리스트 가져오게하기
window.onload = function(){
		cartList();

}
	//장바구니 리스트
	function cartList(){
		
		var total = 0;
		$.ajax({
			url:'${pageContext.request.contextPath}/cartList',
			success : function(response) {
				
				console.log(response);
				for(var i=0; i < response.length; i++){
						
						document.getElementById('cartName').innerHTML += "<Strong>"+response[i].menuName+" </Strong><button onclick='cartDel(" + response[i].menuId + ")'> 삭제 </button>";
						document.getElementById('cartPrice').innerHTML += "<Strong>"+response[i].menuPrice+" </Strong>";
						document.getElementById('amount').innerHTML += "<Strong>"+response[i].amount+" </Strong>"	
						document.getElementById('Price').innerHTML += "<Strong>"+response[i].amount * response[i].menuPrice+" </Strong>"
						total += response[i].amount * response[i].menuPrice;
						
						
				}
				document.getElementById('totalPrice').innerHTML = "<Strong>"+total+"</Strong>";
				console.log(total + '<<<');
			}
			
		
		});	
	}
	//장바구니 등록
	function cartAdd(menuCode) {
		document.getElementById('cartName').innerHTML = "";
		document.getElementById('cartPrice').innerHTML = "";
		document.getElementById('amount').innerHTML = "";
		document.getElementById('Price').innerHTML = "";
		document.getElementById('totalPrice').innerHTML = "";
		
		
		var total = 0;
		
		
		$.ajax({
			url : '${pageContext.request.contextPath}/cartAdd',
			type : 'post',
			async : false,
			data : {
				'code' : menuCode
			},
			success : function(response) {
				
// 				cartList(); 함수 호출 사용하면 코드는 줄여주지만 화면에 버벅거림이 생겨서 주석처리하고 반복문 돌림.. 
				for(var i=0; i < response.length; i++){
					
					document.getElementById('cartName').innerHTML += "<Strong>"+response[i].menuName+" </Strong><button onclick='cartDel(" + response[i].menuId + ")'> 삭제 </button>";
					document.getElementById('cartPrice').innerHTML += "<Strong>"+response[i].menuPrice+" </Strong>";
					document.getElementById('amount').innerHTML += "<Strong>"+response[i].amount+" </Strong>"	
					document.getElementById('Price').innerHTML += "<Strong>"+response[i].amount * response[i].menuPrice+" </Strong>"
					
					total += response[i].amount * response[i].menuPrice;
					
					
			}
			document.getElementById('totalPrice').innerHTML = "<Strong>"+total+"</Strong>";
			}
		});
	}
	//삭제
	function cartDel(menuCode){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/cartDel',
			data:{
				'code' : menuCode
			},
			success:function(){

				document.getElementById('cartName').innerHTML = "";
				document.getElementById('cartPrice').innerHTML = "";
				document.getElementById('amount').innerHTML = "";
				document.getElementById('Price').innerHTML = "";
				document.getElementById('totalPrice').innerHTML = "";
				
				cartList();
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
	<%-- 	<div class="wrap-loading">

		<div>
			<img src="${pageContext.request.contextPath}/resources/images/loading1.gif" />
		</div>

	</div> --%>


	<div>
		<div id="cartBox">
			
			<p>메뉴명 : </p> <span id="cartName"></span>
			<p>가격 : </p> <span id="cartPrice"></span>
			<p>수량 : </p> <span id="amount"></span>
			<p>메뉴별 합계 : </p> <span id="Price"></span>
			<p>총 합계 : </p> <span id="totalPrice"></span>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/cartView"><button>장바구니 보기</button></a>
</body>


<!-- 	<header> -->











<!-- 		<div id="lnb"> -->
<!-- 			<h1> -->
<%-- 				<a href="${pageContext.request.contextPath}/"><img --%>
<%-- 					src="${pageContext.request.contextPath}/resources/images/gnb/logo.png"></a> --%>
<!-- 			</h1> -->
<!-- 			<nav> -->
<!-- 				<ul> -->
<!-- 					<li><a href="#">식단</a> -->
<!-- 						<ul> -->
<!-- 							<li><a -->
<%-- 								href="${pageContext.request.contextPath}/calorie/calculator">기초대사량 --%>
<!-- 									측정</a></li> -->
<!-- 							<li><a href="#">하위메뉴</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">운동가이드</a> -->
<!-- 						<ul> -->
<!-- 							<li><a -->
<%-- 								href="${pageContext.request.contextPath}/strength/training">1RM계산기</a></li> --%>
<!-- 							<li><a href="#">하위메뉴</a></li> -->
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">커뮤니티</a> -->
<!-- 						<ul> -->
<%-- 							<li><a href="${pageContext.request.contextPath}/menu/list">메뉴</a></li> --%>
<!-- 							<li><a -->
<%-- 								href="${pageContext.request.contextPath}/review_board/list">후기게시판</a></li> --%>
<!-- 						</ul></li> -->
<!-- 					<li><a href="#">고객센터</a> -->
<!-- 						<ul> -->
<%-- 							<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li> --%>
<!-- 							<li><a href="#">하위메뉴</a></li> -->
<!-- 						</ul></li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 			<h2 class="hide">회원</h2> -->
<!-- 			<ul class="login"> -->
<%-- 				<sec:authorize access="isAnonymous()"> --%>
<%-- 					<li><a href="${pageContext.request.contextPath}/member/add"> --%>
<!-- 							회원가입 </a></li> -->
<%-- 					<li><a href="<c:url value="/login"/>"> 로그인 </a> --%>
<%-- 				</sec:authorize> --%>
<%-- 				<sec:authorize access="isAuthenticated()"> --%>
<!-- 					인증된 사용자면 principal에 있는 username을 찾아서 화면에 보여준다. -->
<%-- 					<sec:authentication property="principal.username" /> --%>
<!-- 					<li><a -->
<%-- 						href="${pageContext.request.contextPath}/member/MyPage?id= <sec:authentication property="principal.username"/>">마이페이지</a></li> --%>
<!-- 					<li><a href="#" -->
<!-- 						onclick="document.getElementById('logoutForm').submit();">로그아웃</a></li> -->
<!-- 					<form id="logoutForm" -->
<%-- 						action="${pageContext.request.contextPath}/logout" method="post"> --%>
<%-- 						<input type="hidden" name="${_csrf.parameterName}" --%>
<%-- 							value="${_csrf.token}"> --%>
<!-- 					</form> -->
<%-- 				</sec:authorize> --%>
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 	</header> -->
</html>