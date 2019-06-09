<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>트레이너봇 내정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/myinfo.css">
<script src="${pageContext.request.contextPath}/resources/js/myinfo.js"></script>
</head>
<%@ include file="../gnb/nav.jsp"%>
<%@ include file="../alarm.jsp"%>
<%@ include file="../gnb/sidebar.jsp"%>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>
	<div id="full-box">
		<div id="wrapper">
			<div class="first-line">
				<div class="profile-myinfo profile-box">
					<h3>트레이너 봇 프로필</h3>
					<div class="myinfo-contents contents-box">
						<div class="photo-box">
							<img src="#"
								onError="javascript:this.src='/kopo/resources/images/icon/default-profile-icon.jpg'"
								class="myphoto">
						</div>
						<div class="myinfo-box">
							<div>
								<span>아이디</span><span class="id-val">${userProfile.username}</span>
							</div>
							<div>
								<span>권한</span><span class="name-valu">${userProfile.authority}</span>
							</div>
							<div>
								<span>회원기초정보조사 여부</span><span class="isServey">${userProfile.ubChk == 1?"Yes":"N"}</span>
							</div>
						</div>

					</div>
					<div class="update-myinfo">
						<button class="chart-menti btn-collection menti-btn">
							<span onclick="location.href='${pageContext.request.contextPath}/member/update'">수정</span>
						</button>
					</div>
				</div>
				<div class="profile-myTier profile-box">
					<h3>나의 티어</h3>

					<div class="tier-contents contents-box">
						<div class="tier-box">
							<img
								src="${pageContext.request.contextPath}/resources/images/chalinger-tier.png">
						</div>
						<div class="tier-info-box">
							<p>CHALINGER</p>
						</div>
					</div>
				</div>
			</div>
			<div class="second-line">
				<div class="profile-myBoard profile-box">
					<h3>내가 쓴 게시글</h3>
					<div class="board-contents contents-box">
						<table>
							<tr>
								<th>글번호</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<c:choose>
								<c:when test="${qBoard.size() > 0 }">
									<tr>		
										<c:forEach var="qBoard" items="${qBoard}">
										<td>${qBoard.questionId}</td>
										<td><a href="${pageContext.request.contextPath}/question/view?questionId=${qBoard.questionId}">${qBoard.questionName}</a></td>
										<td>${qBoard.id}</td>
										<td><fmt:formatDate value="${qBoard.questionDate}" pattern="yyyy-MM-dd" /></td>
										<td>${qBoard.questionViews}</td>
										</c:forEach>
									</tr>
								</c:when>
								<c:otherwise>
									<p>작성한 게시글이 없습니다.</p>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
				<div class="profile-myComment profile-box">
					<h3>내가 쓴 댓글</h3>
					<div class="comment-contents contents-box">
							<c:choose>
								<c:when test="${qBoardComment.size() > 0 }">
										<c:forEach var="qBComment" items="${qBoardComment}">
											${qBComment.qcommentContent}
											${qBComment.qcommentDate}
											${qBComment.selectionCheck == true?"채택":"채택아님"}
										</c:forEach>
								</c:when>
								<c:otherwise>
									<p>작성한 댓글이 없습니다.</p>
								</c:otherwise>
							</c:choose>
					</div>
				</div>
			</div>
			<div class="bottom-line">
				<p>
					트레이너봇을 더 이상 이용하지 않는다면 <a href="#">회원탈퇴 바로가기</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>