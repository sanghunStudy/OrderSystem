<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item.menuId}.${item.menuName}</title>
<link href="${pageContext.request.contextPath}/resources/css/Question/Question-view.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	var login = ${login};
	//댓글수정버튼
	function updateCheck(id) {
		if(id==login){
			return '<img src="${pageContext.request.contextPath}/resources/images/icon/write.png" class="commentUpdate">';
		} else {
			return '';
		}
	}
	function deleteCheck(id,commentcode) {
		if(id==login){
			return '<div class="commentDel" data-code="'+ commentcode +'">삭제</div>';
		} else {
			return '';
		}
	}
	//댓글list 불러오기 ajax
	function commentList() {
		var menuId = ${item.menuId};
		$.ajax({
			url:'${pageContext.request.contextPath}/menu/mcommentList',
			type:'GET',
			data:{
				'menuId':menuId
			},
			success:function(data){
				var col = '';
				var count = 0;
				$.each(data,function(key,val){
					col += '<div class="coca"><div class="cola">';
					col += '<img src="${pageContext.request.contextPath}/resources/images/icon/normalperson.png" class="personImg">';
					col += '<div class="combo"><span>'+val.id+' &emsp;</span><span>'+val.mcommentDate+'</span></div>';
					col += updateCheck(val.id);
					col += '</div>';
					col += '<div class="masi">'+val.mcommentContent+'</div>';
					col += deleteCheck(val.id,val.mcommentId);
					col += '</div>'
					count += 1;
				});
				$('#commentOutput').html(col);
				$('#commentCount').html(count);
			}
		});
	}
	//댓글등록 ajax
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
						$('#comment').val("");
						commentList();
					} else {
						alert("로그인 후 등록할 수 있습니다.");
					}
				}
			});
		}
	}); 
	
	$(document).on("click",'.commentUpdate',function(){
		
	});
	//댓글삭제ajax
	$(document).on("click",'.commentDel',function(e){
		var commentId = $(this).attr("data-code");
		$.ajax({
			url:'${pageContext.request.contextPath}/menu/commentDel',
			type:'POST',
			data:{
				'mcommentId':commentId
			},
			success:function(data){
				if(data=="success"){
					commentList();
				} else{
					alert("삭제실패");
				}
			}
		});
	});
	
	
	var pointOX = document.getElementById('pointOX');
	var pointGet = ${item.pointSet};
	if(pointGet <= 0){
		pointOX.style.display="none";
	}
});
</script>
<script src="https://unpkg.com/vue"></script>
</head>
<body>
<div id="wrap">
	<div id="Question">
		<div id="QuestionTitle">
			<div class="bigQ">Q</div><div class="zone"><div id="pointOX">${item.pointSet}</div></div><div class="QuestionName">${item.menuName}</div>
		</div>
		<div id="contents">
			<div id="content">
				<span>${item.menuContent}</span><span>${item.menuViews}</span>
			</div>
			<div class="Question_writer">
			<img src="${pageContext.request.contextPath}/resources/images/icon/normalperson.png" class="personImg">
			<div class="Qn"><span>${item.id}&emsp;</span><span><fmt:formatDate value="${item.menuDate}" pattern="yyyy-MM-dd"/></span></div>
			</div>
		</div>
	</div>
	<form action="mcommentAdd" id="mcommentForm">
	<div id="commentInput">
		<textarea v-model="co" id="comment" name="mcommentContent" placeholder="답글을 입력하세요"></textarea>
		<div id="commentAdd">
			<a>답글하기</a>
		</div>
		<a class="char-limit">({{ cl }}/100자)</a>
		<input type="hidden" name="menuId" value="${item.menuId}">
	</div>
	<script>
			var commentLengthCheck = new Vue({
				el:'#commentInput',
				data: {
					co:'',
					cl:0,
					to:''
				},
				watch: {
					co: function(v) {
						this.cl = Number(v.length);
						if(this.cl > 100) {
							alert("더 이상 입력하실 수 없습니다.");
							this.to = v.substr(0, 100);
							/* console.log(this.to); */
							this.co = this.to;
						}
					}
				}
			});
		</script>
	</form>
	<div class="commentCount">
		댓글 <span id="commentCount">${item.cnt}</span>개
		<div class="commentExplanation">
		<c:if test="${login==item.id}">
			<img src="${pageContext.request.contextPath}/resources/images/icon/textbbuloon.png" class="notification"><a>마음에 드는 답변을 하나만 채택 할 수 있습니다.</a>
		</c:if>
		<c:if test="${login != item.id}">
			<img src="${pageContext.request.contextPath}/resources/images/icon/textbbuloon.png" class="notification"><a>답변이 채택되면 포인트를 받습니다.</a>
		</c:if>
		</div>
	</div>
	<div id="commentOutput">
		<c:choose>
			<c:when test="${MCommentList.size() > 0}">
				<c:forEach var="MCL" items="${MCommentList}">
					<div class="coca">
						<c:if test="${MCL.selectionCheck==true}">
							<h3>채택된 글</h3>
						</c:if>
						<div class="cola">
						<img src="${pageContext.request.contextPath}/resources/images/icon/normalperson.png" class="personImg">
						<div class="combo"><span>${MCL.id} &emsp;</span><span>${MCL.mcommentDate}</span></div>
						<c:if test="${login==MCL.id&&MCL.selectionCheck==false}">
						<img src="${pageContext.request.contextPath}/resources/images/icon/write.png" class="commentUpdate">
						</c:if>
						</div>
						<div class="masi">${MCL.mcommentContent}</div>
						
						<c:if test="${login==item.id&&MCL.selectionCheck==false&&login!=MCL.id}">
							<a href="selection?mcommentId=${MCL.mcommentId}&menuId=${item.menuId}&id=${MCL.id}">채택</a>
						</c:if>
						<c:if test="${login==MCL.id&&MCL.selectionCheck==false}">
							<div class="commentDel" data-code="${MCL.mcommentId}">삭제</div>
						</c:if>
						
					</div>
				</c:forEach>
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