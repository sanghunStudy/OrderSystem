<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item.menuId}.${item.menuName}</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	//comment.jsp안되서 댓글jsp 여기서 ajax으로 보냄
	//댓글등록
	$('#commentAdd').click(function(){
		var commentCheck = document.getElementById("comment").value;
		var menuId = ${item.menuId};

		if (commentCheck == "" || commentCheck == null) {
			alert("댓글내용을 입력해 주세요");
		} else{
			$.ajax({
				url:'${pageContext.request.contextPath}/menu/commentAdd',
				type:'POST',
				data:{
					'mcommentContent':commentCheck,
					'menuId':menuId
				},
				success:function(data){
					if(data=='success'){
						alert("댓글입력성공");
						$('#comment').val("");
					} else {
						alert("로그인 후 등록할 수 있습니다.");
					}
				}
			});
		}
	});
	
});
</script>
<style>
#wrap {width:1000px; margin:0 auto;}
#commentAdd {width:100px;height:30px; border:1px solid black;cursor:pointer;float:right;text-align:center;padding-top:3px;box-sizing:border-box;}
#contents {width:500px; margin:0 auto;}
#content {width:320px; border:1px solid white; margin:0 auto;}
#QuestionTitle h2 {width:500px;}
#qn {width:200px; float:right;}
#commentInput {width:500px; margin:0 auto;}
#comment {resize:none;}
#commentOutput {width:500px; margin:30px auto;}
</style>
</head>
<body>
<div id="wrap">
	<div id="Question">
		<div id="QuestionTitle">
			<h2>질문제목 : <span>${item.menuName}</span></h2>
			<div class="Qn">작성자 : <span>${item.id}</span></div>
		</div>
		<div id="contents">
		<a>질문내용</a>
		<div id="content">
			<span>${item.menuContent}</span>
		</div>
		</div>
		<div>
			<a>작성일 : <span><fmt:formatDate value="${item.menuDate}" pattern="yyyy-MM-dd"/></span></a>&emsp;
			<a>조회수 : <span>${item.menuViews}</span></a>
		</div>
	</div>
	<form>
	<div id="commentInput">
		<textarea rows="5" cols="60" id="comment" name="mcommentContent" placeholder="답글을 입력하세요"></textarea>
		<div id="commentAdd">
			<a>답글등록</a>
		</div>
	</div>
	</form>
	<div id="commentOutput">
		<c:choose>
			<c:when test="${MCommentList.size() > 0}">
				<div id="commentList">
					<c:forEach var="MCL" items="${MCommentList}">
						<div>
						<c:if test="${MCL.selectionCheck==true}">
							<h3>채택된 글</h3>
						</c:if>
							<ul>
								<li><span>${MCL.id}</span>님의 답변</li>
								<li>답변내용 : <span>${MCL.mcommentContent}</span></li>
								<li>답변일 : <span>${MCL.mcommentDate}</span></li>
								<c:if test="${login==item.id&&MCL.selectionCheck==false&&login!=MCL.id}">
									<li><a href="selection?mcommentId=${MCL.mcommentId}&menuId=${item.menuId}&id=${MCL.id}">채택</a></li>
								</c:if>
								<c:if test="${login==MCL.id&&MCL.selectionCheck==false}">
									<li><a href="commentDel?mcommentId=${MCL.mcommentId}&menuId=${item.menuId}">삭제</a></li>
								</c:if>
							</ul>
						</div>
					</c:forEach>
				</div>
			</c:when>
		</c:choose>
	</div>
	<%-- <jsp:include page="comment.jsp" flush="true" /> --%>
	<c:if test="${login==item.id}">
	<span>
		<a href="update?menuId=${item.menuId}">변경</a>
		<a href="delete?menuId=${item.menuId}">삭제</a>
	</span>
	</c:if>
	<a href="list">목록으로</a>
</div>
</body>
</html>