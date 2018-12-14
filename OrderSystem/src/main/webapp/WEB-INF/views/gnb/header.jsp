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
	function cartAdd(menuCode){
		alert(menuCode);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/cart',
			type:'post',
			data:{
				'code':menuCode
			},
			success:function(data){
				
				console.log(data);
				}
			
		});
		
	}	

 	function cartDel(){
 		$.ajax({
 			url:'${pageContext.request.contextPath}/cartDel',
 			success:function(data){
 				
 			}
 		});
 	}
// 	//제품 담기
// 	pf.addProduct = function(pCode, qty){
// 		if(qty != 1){
// 			qty = $('.opt_qty').text();
// 		}
// 		var condimentList = $('.topping_options').find('span');
// 		var cCode = [];
		
// 		if(condimentList.size() > 0){
// 			for(var i=0; i<condimentList.size(); i++) {
// 				cCode.push(condimentList.eq(i).attr('data-cCode'));
// 			}
// 			cCode = cCode.join(',');
// 		} else {
// 			cCode = null;
// 		}
		
// 		cntt.ajax.post(
// 			'/cart/addProduct',
// 			{
// 				pCode : pCode,
// 				cCode : cCode,
// 				qty : qty
// 			},
// 			function (response) {
// 				if(response){
// 					popAlert("제품이 담겼습니다.");
					
// 					//TODO : 공통스크립트로 빼기??
// 					$('.menu_close').click(); //메뉴 상세 팝업 닫기
// 					condimentList.remove(); //컨디먼트 리스트 삭제
// 					$('html, body').animate({ scrollTop : 0 },500); //스크롤 상단 이동
// 					headerFunc.loadHeaderCart('Y'); //장바구니 갱신
// 				}
// 			}
// 		);
// 	};
</script>
</head>
<body>
<a>장바구니</a>
<button onclick="cartDel()">장바구니 비우기</button>
</body>
</html>