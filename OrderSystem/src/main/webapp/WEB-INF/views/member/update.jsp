<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/memberUpdate.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- 여기에 스크립트 추가 -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <script>
  var myTier = '${item.tier}';
  var myPoint = '${item.point}';
  var nextTierPoint =1000;
  var myTierPoint = 0;
  var myPercent = 0;
  var obj = 0;
  
  
const array = Array(Array());
	
	array[0][0] = obj = {"bronze":500};
	array[0][1] = obj = {"silver":1000};
	array[0][2] = obj = {"gold":1500};
	array[0][3] = obj = {"platinum":2000};
	array[0][4] = obj = {"diamond":2500};
	


//   var map1 = new Map();
// var items;  
//   map1.set("bronze",500);
//   map1.set("silver",1000);
//   map1.set("gold",1500);
//   map1.set("platinum",2000);
//   map1.set("diamond",2500);

  //현포 / 다음단계포인트 * 100
  				
        $(document).ready(function() {
        	console.log(array);
        	
//         	for(var i=0; i<array.length; i++){
//         			console.log(array[i]);
//         		if(myTier == array[i]){
//         			console.log(">>>>>>>>>>"+array[i]);
//         			for(var j=0; j<array[i].length; j++){
//         				console.log(array[i][j]);
//         			}	
//         		}
        		
//         	}
        	
//         	for(var item in tierGrade){
//         		if(myTier == item){
//         			myTierPoint = tierGrade[item];
//         			console.log("tierGrade[item] "+tierGrade[item]);
//         			console.log("next tierGrade[item] "+tierGrade[item])
//         		}
//         		console.log("item = " + item);
//         	}
			myPercent = (myPoint-myTierPoint)/(nextTierPoint-myTierPoint)*100;
//       		console.log((myPoint-myTierPoint)/(nextTierPoint-myTierPoint)*100);
      		progress(myPercent);
        	var obj = document.updateFrm;
            $(".update-submit").click(function() {
            	var currentPw = $(".current-password").val();
            	$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/LoginChk",
					data:{
						"username":obj.username.value,
						"password":currentPw
					},
					success:function(data){
						if(data == 0){
							document.getElementById("pwChk").innerHTML = ("<span class='update-repw-span' style='color:red;'>비밀번호를 다시 확인하세요.</span>");
							$(".current-password").focus();
						}else{
							$(".current-password").attr("readonly",true);
							document.getElementById("pwChk").innerHTML = ("<span class='update-repw-span' style='color:green;'>비밀번호가 일치합니다.</span>");
							$(".new-password").focus();
							var newPw = $(".new-password").val();
							var reNewPw = $(".re-new-password").val();
							console.log(newPw.length);
							if(newPw.length == 0){
								document.getElementById("newPwChk").innerHTML = ("<span class='update-repw-span' style='color:red;'>새로운 비밀번호를 입력하세요.</span>");
									
							}else if(reNewPw.length == 0){
								$(".re-new-password").focus();
								document.getElementById("reNewPwChk").innerHTML = ("<span class='update-repw-span' style='color:red;'>새로운 비밀번호를 확인하세요.</span>");
							}else if(newPw === reNewPw){
								alert("비밀번호가 변경 되었습니다.");
								$("[name='updateFrm']").submit();
// 								VerifyRecaptcha();
							}else{
								alert("새 비밀번호를 확인해주세요");
								
							}
							
						}
					}
				});
            	


            });
        });
    	function VerifyRecaptcha(){
            $.ajax({
                url: '${pageContext.request.contextPath}/member/VerifyRecaptcha',
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function(data) {
                    if(data == 0){
                    	alert("수정이 완료 되었습니다.");
               			$("[name='updateFrm']").submit();
                    }else if(data == 1){
                    	alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                    	return;
                    }else{
                    	alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		return;
                    }
                }
            });
    	}
    	
    	//프로그레스바
    	function progress(myPercent){
    		console.log(myPercent);
  		  if ($('.progress-bar').width() < 500) {
	  		  $('.progress-bar').animate({
	  		    width: "+="+ myPercent*5  +"px"
	  		  });
  			}
    	}
  		
</script>
<style>
/* 
SETTINGS
If you need the loader go faster or slower, this is the place to change. Don't forget to update 'time' in the javascript
*/


</style>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
<div class="update-wrap">
<h1>회원정보수정</h1>
	<div class="contents">
	<form action="update" method="post" name="updateFrm" class="update-frm">
		<div class="update-left-box">
			<div class="tier-box">
				<img src="${pageContext.request.contextPath}/resources/images/grade/chalinger-tier-bg-none.png">
			</div>
			<div class="tier-info-box">
				<p>CHALINGER</p>
			</div>
			<div class="progress-wrap">
				<h4>Next Grade</h4>
				<div class="progress-container">
				  <ul>
				    <li></li>
				    <li></li>
				    <li></li>
				    <li></li>
				  </ul>
				  <div class="progress-bar"></div>
				</div>
			</div>
		</div>
		<div class="update-right-box">
			<div class="update-content-box">
				<p><label>User ID</label></p>
				<span>${item.username}</span>
				<input type="hidden" name="username" value="${item.username}">
			</div>
			<div  class="update-content-box">
				<p><label>Password</label></p>	
				<input type="password" class="current-password" placeholder="  Password">
				<div id="pwChk">
				</div>
			</div>
			<div  class="update-content-box">
				<p><label>NewPassword</label></p>
				<input type="password" class="new-password" placeholder="  NewPassword">
				<div id="newPwChk">
				</div>
			</div>
			<div  class="update-content-box">
				<p><label>ConfirmPassword</label></p>
				<input type="password" class="re-new-password" name="password" placeholder="  ConfirmPassword">
				<div id="reNewPwChk">
				</div>
			</div>
			<!--여기에 div 추가 -->
	<!-- 		<div class="g-recaptcha" data-sitekey="6Lft0aYUAAAAAPiRCIqh_mTsqaLySix0SFs6Yfq5"></div>  -->
			<div class="update-content-box">
				<button type="button" class="update-submit chart-menti btn-collection menti-btn">수정완료</button>
			</div>
		</div>
	</form> 
	</div>
</div>
</body>
</html>