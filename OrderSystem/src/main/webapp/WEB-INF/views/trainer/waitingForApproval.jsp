<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 대기 회원</title>
<style type="text/css"> 
     #submit{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #submit:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     } 
     #cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #cancel:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     }

    .modal { 
    	 text-align: center; 
         display: block; 
         margin: 0 auto; 
         font-size: 16px; 
         color: #999; 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 500px; 
         height: 350px; 
         border-radius: 0.5rem; 
     } 
     .close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
     } 
     .close-button:hover { 
         background-color: darkgray; 
     } 
     .show-modal { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
    
</style>

</head>
<body>
<h1>승인 대기 회원 목록</h1>
	<c:choose>
		<c:when test="${wfaList.size() > 0}">
			<ul>
			<c:forEach var="wfa" items="${wfaList}">
				<li>
					<label><button onclick="toggleModal('${wfa.username}')">회원명 : </button></label>
					${wfa.username} 
					<label>신청일자 : </label>
					${wfa.applyDate} 
					<label>승인상태 : </label>
					${wfa.reading}
				</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p>현재 승인 대기중인 회원이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	
     <!-- 팝업 될 레이어 --> 
     <div class="modal"> 
         <div class="modal-content"> 
             <span class="close-button">&times;</span>
             <div class="userDetailViews">
             </div> 
			<input type="button" id="cancel" value="취소"> 
         </div>
         <form action="grantApproval" id="grantApprovalSubmit" method="post">
         	<input type="hidden" id="usernameSend" name="username">
         </form> 
     </div>
     
     
     <script type="text/javascript"> 
         var modal = document.querySelector(".modal"); 
         var closeButton = document.querySelector(".close-button"); 
         var cancelButton = document.querySelector("#cancel");
         var userDetailViews = document.querySelector(".userDetailViews");
         var httpRequest;	
		
        //모달 출력하는 함수
        function toggleModal(username) {
        	 httpRequest = new XMLHttpRequest();
        	 if (!httpRequest) {
        	      console.log('Giving up :( Cannot create an XMLHTTP instance');
        	      return false;
        	    }
        	    httpRequest.onreadystatechange = alertContents;
        	    httpRequest.open("GET", "userDetailView?username="+username);
        	    httpRequest.send();
        	    
        	    
             modal.classList.toggle("show-modal"); 
         }
        
        //ajax 통신 성공후 처리하는 함수
        function alertContents() {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
              if (httpRequest.status === 200) {
                console.log(httpRequest.responseText);
                var item = JSON.parse(httpRequest.responseText);
                console.log(item.Detail.username);
                userDetailViews.innerHTML =
                	"<ul>"+
                	"<li><span>아이디 :" + item.Detail.username + "</span></li>"+
                	"<li><span>나이 :" + item.Detail.age + "</span></li>"+
                	"<li><span>성별 :" + item.Detail.sex + "</span></li>"+
                	"<li><span>키 :" + item.Detail.height + "</span></li>"+
                	"<li><span>몸무게 :" + item.Detail.weight + "</span></li>"+
                	"<li><span>주 음주 빈도 :" + item.Detail.drinking + "</span></li>"+
                	"<li><span>주 운동량 :" + item.Detail.frequency + "</span></li>"+
                	"<li><span>운동 목적 :" + item.Detail.purpose + "</span></li>"+
                	"<li><span>직업 :" + item.Detail.job + "</span></li>"+
                	"<li><span>참고사항 :" + item.Detail.dictum + "</span></li>"+
                	"<li><input type='button' value='승인허가' onclick=grantApproval('"+item.Detail.username+"')></li>"
                	"</ul>";
              } else {
                console.log('There was a problem with the request.');
              }
            }
          }
        
        //모달종료
		function modalCancel(){
			modal.classList.toggle("show-modal");
		}
		
        //화면 아무곳이나 눌러도 모달 종료
        function windowOnClick(event) { 
             if (event.target === modal) { 
            	 modalCancel(); 
             } 
         }
		
         function grantApproval(userId){
        	 document.getElementById("usernameSend").value = userId;
        	 document.getElementById("grantApprovalSubmit").submit();
     		
         }
         closeButton.addEventListener("click", modalCancel); 
         cancel.addEventListener("click", modalCancel); 
         window.addEventListener("click", windowOnClick); 
     </script>

</body>
</html>