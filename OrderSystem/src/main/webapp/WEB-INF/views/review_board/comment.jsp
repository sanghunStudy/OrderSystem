<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/moment_min.js"></script>
<script>
	// var token = $("meta[name='_csrf']").attr("content");
	// var header = $("meta[name='_csrf_header']").attr("content");

	var securityId = "${securityId}";
	var reCode = "${item.reviewId}";
	
	
	$(function() {
		getCommentList();

		document.getElementById("comentBtn").onclick = function() {
			if (securityId == "null" || securityId == 'anonymousUser')
				alert('로그인 후 이용 가능합니다.');
			else
				fn_comment('${item.reviewId}')
		}

	});

	// 댓글 쓰기
	function fn_comment(code) {

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/review_board/commentAdd',
			data : $('#commentForm').serialize(), //form의 아이디값
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data) {
				if (data == 'success') {
					getCommentList();
					$('#comment').val("");
				}
			}
		});
	}
	// 대댓글 쓰기
	function fn_recomment(parent,CommentCode) {
console.log(reCode+"<<<reCode");
console.log(parent+"<<<parent");

var rCommentContent = $("#rCommentContent").val();
console.log(rCommentContent+"<<<reCode");



		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/review_board/recommentAdd',
			data : {
				'rcommentParent' : parent,
				'reviewId' : reCode,
				'rcommentContent' : rCommentContent
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data) {
				if (data == 'success') {
					
					getrCommentList(parent,CommentCode);
					$('#rCommentContent').val("");
				}
			}
		});
	}
	//대댓글 리스트
	function getrCommentList(parent,CommentCode) {
		
			$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/review_board/rcommentList',
					dataType : "json",
					data : {'reviewId' : reCode,
						   'rcommentParent' : parent},
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						var html = "";
						var cCnt = data.length;
						html += "<div>";
						html += "<textarea rows='3' cols='30' id='rCommentContent' name='rcommentContent' placeholder='댓글을 입력하세요'>";
						html += "</textarea>";
						html += "<div><a href='#' id='comentBtn' onclick='fn_recomment("+ parent + ",\"" + CommentCode + "\")'>등록</a></div>";
						html += "</div>";
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								html += "<div>";
								html += "<div><table class='table'><h6><strong>"+ data[i].writer+ "</strong> <strong>"+ data[0].RcomentDate + "</strong></h6>";
								html += "<tr><td><div class='commentContent"+ data[i].c_code+"'>" + data[i].comment;
								html += "<a href='#' onclick='fn_update("+ data[i].c_code + ",\"" + data[i].comment + "\")'>수정</a>";
								html += "<a href='#' onclick='fn_delete("+ data[i].c_code + ")'>삭제</a>";
								html += "</div></td></tr>";
								html += "</table></div>";
								html += "</div>";
							}
						} else {
							html += "<div>";
							html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</table></div>";
							html += "</div>";
						}
						$("#cCnt").html(cCnt);
						var rCommentId = "#rComment"+CommentCode;
						console.log(rCommentId);
						$(rCommentId).html(html);
					},
					error : function(request, status, error) {
					}
				});
	}
	
	//댓글 리스트
	function getCommentList() {
			$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/review_board/commentList', 
					dataType : "json",
					data : $("#commentForm").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						var html = "";
						var cCnt = data.length;
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
								html += "<div>";
								html += "<div><table class='table'><h6><strong>"+ data[i].writer+ "</strong> <strong>"+ data[0].RcomentDate + "</strong></h6>";
								html += "<tr><td><div class='commentContent"+ data[i].c_code+"'>" + data[i].comment;
								html += "<a href='#' onclick='getrCommentList("+ data[i].parent + ",\"" + data[i].c_code + "\")'>답글</a>";
								html += "<a href='#' onclick='fn_update("+ data[i].c_code + ",\"" + data[i].comment + "\")'>수정</a>";
								html += "<a href='#' onclick='fn_delete("+ data[i].c_code + ")'>삭제</a>";
								html += "</div></td></tr>";
								html += "</table></div>";
								html += "<blockquote><div id='rComment"+ data[i].c_code + "'></div></blockquote>";
								html += "</div>";
							}
						} else {
							html += "<div>";
							html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</table></div>";
							html += "</div>";
						}
						$("#cCnt").html(cCnt);
						$("#commentList").html(html);
					},
					error : function(request, status, error) {
					}
				});
	}

	//댓글 수정 처리
	function commentUpdateProc(code) {
		var updateContent = $('[name=content_' + code + ']').val();
			$.ajax({
					url : '${pageContext.request.contextPath}/review_board/commentUpdate',
					type : 'post',
					data : {
						'rcommentContent' : updateContent,
						'rcommentId' : code
					},
					beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(data) {
						if (data == 'success') {
							getCommentList();
							$('#comment').val("");
						} //댓글 수정후 목록 출력 
					}
				});
	}
	//댓글 수정화면
	function fn_update(code, content) {
		var updateTags = '';
		updateTags += '<div class="input-group">';
		updateTags += '<input type="text" class="form-control" name="content_'+code+'" value="'+content+'"/>';
		updateTags += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
				+ code + ');">수정</button> </span>';
		updateTags += '</div>';
		$('.commentContent' + code).html(updateTags);
	}
	
	//대댓글 리스트
	
	
	/*$('#fn_reComment').click(function(){
		#.ajax({
			url:'${pageContext.request.contextPath}/review_board/commentList',
			type : 'GET';
		})
	})*/
	//대댓글화면
	/*function fn_reComment(code) {
		$.ajax
		var reCommentTags = '';
		reCommentTags += '<div>';
		reCommentTags += '<input type="text" name="content_"">';
		reCommentTags += '<span><button type="button" onclick="reCommentProc(' + code + ');">등록</button></span>';
		reCommentTags += '</div';
		$('.commentContent' + code).html(reCommentTags);
	}*/
	
	//댓글 삭제
	function fn_delete(code) {
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/review_board/commentDel',
			data : {
				'rcommentId' : code
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data) {
				if (data == 'success') {
					getCommentList();
					$('#comment').val("");
				}
			}
		});
	}
</script>
</head>
<body>

	<div>
		<form id="commentForm" name="commentForm" action="post">
			<div>
				<div>
					<span><strong>댓글</strong></span><span id="cCnt"></span>
				</div>
				<div>
					<table>
						<tr>
							<td><textarea rows="3" cols="30" id="comment"
									name="rcommentContent" placeholder="댓글을 입력하세요"></textarea>
								<div>
									<a href="#" id="comentBtn"
										onclick="fn_comment('${item.reviewId}')">등록</a>
								</div></td>
						</tr>

					</table>
				</div>
			</div>
			<input type="hidden" id="reviewId" name="reviewId"
				value="${item.reviewId}">
		</form>
	</div>
	<div class="container">
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="commentList"></div>
<!-- 			<div id="rComment"></div> -->
		</form>
	</div>
</body>
</html>