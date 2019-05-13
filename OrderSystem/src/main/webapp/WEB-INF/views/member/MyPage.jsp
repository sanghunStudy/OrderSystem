<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<%-- <jsp:include page="../gnb/head.jsp" flush="true" /> --%>
<body>
	<ul>
		<li><a href="${pageContext.request.contextPath}/opo/webRtc">OnlinePT 테스트</a></li>
<!-- 		<li><a href="ExerciseJournal">나의 운동일지</a></li> -->
		<li><a href="MyExerciseJournal">운동일지</a></li>
		<li><a href="basicInformation">회원 기초정보 입력</a></li>
		<li><a href="mentiManagement">멘티 관리</a></li>
		<li><a href="statistics">나의 운동 통계 </a></li>
		<li><a href="promotion">트레이너 신청</a></li>
		<li><a href="proList">트레이너 신청목록</a></li>
		<li><a href="ExerciseJournalList">운동일지상세목록</a></li>
	</ul>

</body>
</html>