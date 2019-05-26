<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동종류 목록</title>
<meta name="viewport" content="width=device-width, minimum-sclae=1, maximum-sclae=1, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<style>
html,
body {
  box-sizing: border-box;
  line-height: 1.5;
}
.menu-box{
display:block;
flex-wrap:wrap;
padding-left:8.5px;
margin:0 auto;
width: 55px;
height:600px;
border-radius:6px;
background:linear-gradient(130deg, #1d8cf8, #3358f4);
position:fixed;
margin-left: 20px;
top: 15%;
z-index:1;
-webkit-transition:width 0.5;
transition:width 0.5s;
overflow:hidden;
overflow-anchor: none;
}
.menu-bar {
    margin-top: 15px;
     
}
.logo{white-space: nowrap;transition: all .3s ease 0s; color:#fff;}
.logo p { position: relative;
    	top: -35px;
    	left: 50px;
		white-space:nowrap;
		color:white;
		font-size:12px;
		}
		

.menu-box:hover {
	width:200px;
}
.menu-bar p{
    position: relative;
    top: -35px;
    left: 50px;
	white-space:nowrap;
	color:white;
	font-size:12px;
	
}

.menu-icons {
	font-size:32px;
	color:#fff;
	margin-top:10px;
	line-height:1.7;
	cursor:pointer;
	list-style:none;
}
.menu-icons a{
	color:#fff;
	text-decoration:none;
}

</style>
</head>
<body>
		<div class="menu-box">
			<div class="logo">
				<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo">
				<p>TRAINERBOT</p></a>
			</div>
			<ul class="menu-bar">
				<li class="menu-icons"><a href="statistics"><i class="fas fa-chart-bar"></i><p>운동일지 통계</p></a></li>
				<li class="menu-icons"><a href="MyExerciseJournal"><i class="fas fa-book"></i><p>운동일지 작성</p></a></li>
				<li class="menu-icons"><a href="basicInformation"><i class="fas fa-user-edit"></i><p>설문조사</p></a></li>
				<li class="menu-icons"><a href="mentiManagement"><i class="fas fa-users"></i><p>멘티 관리</p></a></li>
				<li class="menu-icons"><a href="${pageContext.request.contextPath}/opo/webRtc"><i class="fas fa-comment-dots"></i><p>화상채팅</p></a></li>
			</ul>
		</div>
	<c:choose>
		<c:when test="${eTlist.size() > 0}">
			<ul>
			<c:forEach var="eTlist" items="${eTlist}">
				<li>운동명 : ${eTlist.teName} 추천 세트수 : ${eTlist.teSet} set 추천 횟수 ${eTlist.teReps} reps 추천 기구 ${eTlist.teTool} <a href="typeOfExerciseAdd?teNum=${eTlist.teNum}">수정</a> <a href="typeOfExerciseDel?teNum=${eTlist.teNum}">삭제</a></li>
			</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p>등록된 운동이 없습니다.</p>
		</c:otherwise>
	</c:choose>
	<a href="typeOfExerciseAdd?teNum=0">운동 등록하기</a>
	<a href="${pageContext.request.contextPath}/member/MyPage">마이페이지 목록으로</a>
</body>
</html>