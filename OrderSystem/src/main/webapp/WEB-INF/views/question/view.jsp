<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${item.questionId}.${item.questionName}</title>
<link href="${pageContext.request.contextPath}/resources/css/Question/Question-view.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	//로그인정보가져옴
	var login = document.getElementById('login').value;
	
	//jsp에서 함수 못 읽어서 필요
	window.co_updateMode = co_updateMode;
	window.choice_comment = choice_comment;
// 	window.resize = resize;
	
	//댓글수정함수
	function co_updateMode(code,data){
		var updateForm ='';
		updateForm += '<textarea class="updateForm" name="content_'+ code +'">'+ data +'</textarea>';
		updateForm += '<div class="update_btn" data-code="'+ code +'">수정</div>';
		var coca = $('.coca').length;
		for(var i=0; i < coca; i++){
			if($('.coca:eq('+i+')').attr("data-code") == code){
				$('.masi:eq('+i+')').html(updateForm);
			}
		}
		
	}
	//댓글수정ajax
	$(document).on("click",'.update_btn',function(){
		var qcommentId = $(this).attr("data-code");
		var content = $('[name=content_'+ qcommentId +']').val();
		if(content.length > 500){
			var cutOK = confirm("500자를 초과 입력할 수 없습니다\n500자 까지 자르겠습니까?");
			if(cutOK == true){
				var cut = content.substr(0,500);
				$('[name=content_'+ qcommentId +']').val(cut);
			}
		} else {
			$.ajax({
				url:'${pageContext.request.contextPath}/question/commentUpdate',
				type:'post',
				data:{
					'qcommentId':qcommentId,
					'qcommentContent':content
				},
				success:function(data){
					if(data=='success'){
						alert("답변이 수정 되었습니다.");
						commentList();
					} else {
						alert("수정이 실패하였습니다.");
					}
				}
			});
		}
	});
	//댓글수정텍스트에리어자동수정
// 	$(document).on('keydown keyup',"updateForm", function () {
//   		$(this).height(1).height( $(this).prop('scrollHeight')+12 );	
// 	});
// 	function resize(obj) {
// 		  obj.style.height = "1px";
// 		  obj.style.height = (12+obj.scrollHeight)+"px";
// 		}
	//댓글 채택New버전 ajax
	function choice_comment(commentId,pointGetUser,point,pointLoseUser) {
		var choiceCheck = '';
		var questionId = ${item.questionId};
// 		console.log(pointGetUser+"    "+pointLoseUser);
		var really = confirm("이 글을 채택 하시겠습니까?");
		if(really == true) {
			$.ajax({
				url:"${pageContext.request.contextPath}/question/selectionCheck",
				type:"GET",
				data:{
					'questionId':questionId,
					'qcommentId':commentId,
					'pointGetUser':pointGetUser,
					'pointSet':point,
					'pointLoseUser':pointLoseUser
				},success:function(data){
					if(data == "OK"){
						alert("채택되었습니다");
						commentList();
					} else {
						alert("질문에 채택된 글이 이미 존재합니다");
					}
				}
			});
		} else {
			return false;
		}
		
	}
	
	//댓글수정버튼체크
	function updateCheck(id,commentId,content,sel) {
		if(id==login&&sel==false){
			return '<div onclick="co_updateMode('+ commentId +',\''+ content +'\');" class="update_mode"><img src="${pageContext.request.contextPath}/resources/images/icon/write.png" class="commentUpdate"></div>';
		} else {
			return '';
		}
	}
	//댓글삭제버튼체크
	function deleteCheck(id,commentcode,sel) {
		if(id==login&&sel==false){
			return '<div class="commentDel" data-code="'+ commentcode +'">삭제</div>';
		} else {
			return '';
		}
	}
	//채택여부체크
	function selectionCheck(sel){
		if(sel==true){
			return '<img src="${pageContext.request.contextPath}/resources/images/icon/checkbox.png" class="check">';
		} else {
			return '';
		}
	}
	//댓글채택버튼체크
	function choiceCheck(id,commentcode,sel){
		var writer = document.getElementById('writer').value;
		var point = ${item.pointSet};
//		console.log(writer + "        "+ point);
		if(login == writer && sel == false && login != id){
			return '<div onclick="choice_comment('+commentcode+',\''+id+'\','+point+',\''+writer+'\')" class="choice">채택</div>';
		} else {
			return '';
		}
	}
	//댓글list 불러오기 ajax
	function commentList() {
		var questionId = ${item.questionId};
		$.ajax({
			url:'${pageContext.request.contextPath}/question/qcommentList',
			type:'GET',
			data:{
				'questionId':questionId
			},
			success:function(data){
				var col = '';
				var count = 0;
				$.each(data,function(key,val){
					col += '<div class="coca" data-code="'+ val.qcommentId +'"><div class="cola">';
					col += selectionCheck(val.selectionCheck);
					col += '<img src="${pageContext.request.contextPath}/resources/images/grade-border/'+ val.tier +'-tier-border.png" class="tierborderStart" alt="'+ val.tier +'">';
					col += '<img src="${pageContext.request.contextPath}/resources/images/icon/normalperson.png" class="personImg">';
					col += '<div class="combo"><span>'+val.id+' &emsp;</span><span>'+val.qcommentDate+'</span></div>';
					col += updateCheck(val.id,val.qcommentId,val.qcommentContent,val.selectionCheck);
					col += '</div>';
					col += '<div class="masi"><div class="commentContentBox">'+val.qcommentContent+'</div></div>';
					col += choiceCheck(val.id,val.qcommentId,val.selectionCheck);
					col += deleteCheck(val.id,val.qcommentId,val.selectionCheck);
					col += '</div>'
					col += '<hr class="boundaryline">';
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
		var questionId = ${item.questionId};

		if (commentCheck == "" || commentCheck == null) {
			alert("댓글내용을 입력해 주세요");
		} else{
			var really = confirm("이대로 등록하시겠습니까?");
			if(really == true) {
				$.ajax({
					url:'${pageContext.request.contextPath}/question/commentAdd',
					type:'POST',
					data:{
						'qcommentContent':commentCheck,
						'questionId':questionId
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
			} else {
				return false;
			}
			
		}
	}); 
	
	//댓글삭제ajax
	$(document).on("click",'.commentDel',function(e){
		var commentId = $(this).attr("data-code");
		var questionId = ${item.questionId};
		var really = confirm("정말 삭제 하시겠습니까?");
		if(really == true) {
			$.ajax({
				url:'${pageContext.request.contextPath}/question/commentDel',
				type:'POST',
				data:{
					'qcommentId':commentId,
					'questionId':questionId
				},
				success:function(data){
					if(data=="success"){
						alert("삭제되었습니다.");
						commentList();
					} else{
						alert("삭제실패");
					}
				}
			});
		}
	});
	//포인트 여부확인
	var pointOX = document.getElementById('pointOX');
	var pointGet = ${item.pointSet};
	if(pointGet <= 0){
		pointOX.style.display="none";
	}
	//질문삭제
	$('.runDelete').click(function(){
		var commentCount = $('#commentCount').text();
		if(commentCount > 0) {
			alert("답변이 작성되어 있을 시 질문글을 삭제할 수 없습니다.");
			return false;
		}
		else {
			var really = confirm("정말 삭제 하시겠습니까?");
			if(really == true) {
				alert("삭제되었습니다.");
				window.location.href="delete?questionId="+${item.questionId};
			}
		}
	});
	//질문수정
	$('.gotoUpdate').click(function() {
		var commentCount = $('#commentCount').text();
		if(commentCount > 0) {
			alert("답변이 작성되어 있을 시 질문글을 수정할 수 없습니다.");
			return false;
		}
		else {
			window.location.href="update?questionId="+${item.questionId};
		}
	});
	
	var commentLength = $('.tierborderStart').length;
	for(var i=0; i < commentLength; i++) {
		var writeDayTiers = $('.tierborderStart:eq('+i+')').attr("alt");
		$('.tierborderStart:eq('+i+')').attr("src","${pageContext.request.contextPath}/resources/images/grade-border/"+writeDayTiers+"-tier-border.png");
	}
	
});
</script>
<script src="https://unpkg.com/vue"></script>
</head>
<header>
<jsp:include page="../gnb/head.jsp" flush="true" />
</header>
<body>
<div id="wrap">
	<div id="Question">
		<div id="QuestionTitle">
			<div class="bigQ">Q</div><div class="zone"><div id="pointOX">${item.pointSet}</div></div><div class="QuestionName">${item.questionName}</div>
		</div>
		<hr class="boundaryline">
		<div id="contents">
			<div id="content">
				<span>${item.questionContent}</span>
			</div>
			<div class="Question_writer">
			<img src="${pageContext.request.contextPath}/resources/images/icon/normalperson.png" class="personImg">
			<div class="Qn"><span>${item.id}&emsp;</span><span><fmt:formatDate value="${item.questionDate}" pattern="yyyy-MM-dd"/></span></div>
			</div>
		</div>
		<input type="hidden" id="login" value="${login}">
		<input type="hidden" id="writer" value="${item.id}">
	</div>
	<form action="qcommentAdd" id="qcommentForm">
	<div id="commentInput">
		<textarea v-model="co" id="comment" name="qcommentContent" placeholder="답글을 입력하세요"></textarea>
		<div id="commentAdd">
			<a>답글하기</a>
		</div>
		<a class="char-limit">({{ cl }}/500자)</a>
		<input type="hidden" name="questionId" value="${item.questionId}">
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
						if(this.cl > 500) {
							alert("더 이상 입력하실 수 없습니다.");
							this.to = v.substr(0, 500);
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
			<c:when test="${QCommentList.size() > 0}">
				<c:forEach var="QCL" items="${QCommentList}">
					<div class="coca" data-code="${QCL.qcommentId}">
						<c:if test="${QCL.selectionCheck==true}">
							<img src="${pageContext.request.contextPath}/resources/images/icon/checkbox.png" class="check">
						</c:if>
						<img src="" class="tierborderStart" alt="${QCL.tier}">
						<div class="cola">
						<img src="${pageContext.request.contextPath}/resources/images/icon/normalperson.png" class="personImg">
						<div class="combo"><span>${QCL.id} &emsp;</span><span>${QCL.qcommentDate}</span></div>
						<c:if test="${login==QCL.id&&QCL.selectionCheck==false}">
						<div onclick="co_updateMode(${QCL.qcommentId},'${QCL.qcommentContent}');" class="update_mode">
						<img src="${pageContext.request.contextPath}/resources/images/icon/write.png" class="commentUpdate"></div>
						</c:if>
						</div>
						<div class="masi"><div class="commentContentBox">${QCL.qcommentContent}</div></div>
						
						<c:if test="${login==item.id&&QCL.selectionCheck==false&&login!=QCL.id}">
							<div onclick="choice_comment(${QCL.qcommentId},'${QCL.id}',${item.pointSet},'${item.id}')" class="choice">
								채택
							</div>
						<%-- <a href="selection?mcommentId=${MCL.mcommentId}&menuId=${item.menuId}&id=${MCL.id}">채택</a> --%>
						</c:if>
						<c:if test="${login==QCL.id&&QCL.selectionCheck==false}">
							<div class="commentDel" data-code="${QCL.qcommentId}">삭제</div>
						</c:if>
					</div>
					<hr class="boundaryline">
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	<hr class="boundaryline">
	<%-- <jsp:include page="comment.jsp" flush="true" /> --%>
	<div class="floor_btns">
		<c:if test="${login==item.id}">
			<div class="gotoAndRun_btns">
				<a><div class="gotoUpdate">수정</div></a>
				<a><div class="runDelete">삭제</div></a>
			</div>
		</c:if>
		<a href="list"><div class="gotoList">목록으로</div></a>
	</div>
	<hr class="End-line">
</div>
</body>
</html>