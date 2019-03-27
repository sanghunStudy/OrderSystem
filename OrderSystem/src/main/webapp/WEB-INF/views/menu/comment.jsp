<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment_min.js"></script>
<script>
	$(function(){
		getCommentList();
	});
	
	function fn_comment(code){
		var commentCheck = document.getElementById("comment").value;
		
 		if(commentCheck == "" || commentCheck == null){
 			alert("댓글내용을 입력해 주세요");
 		} else {
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/menu/commentAdd',
				data:$('#commentForm').serialize(),
				 beforeSend : function(xhr)
	             {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	             },
				success:function(data){
					if(data == 'success'){
						getCommentList();
						$('#comment').val("");
					}
				}
			});
 		}	
	}

	function getCommentList() {
		$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath}/menu/commentList',
			dataType: "json",
			data:$("#commentForm").serialize(),
			contentType: "application/x-www-urlencoded; charset=UTF-8",
			success: function(data){
// 				console.log(data);
				var html="";
				var cCnt=data.length;
				
				if(data.length > 0){
					
					for(i=0;i<data.length;i++){
// 						console.log(data[i]);
						html += "<div>";
						html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong><strong>"+data[0].McommentDate+"</strong></h6>";
						html += "<tr><td><div class='commentContent"+data[i].c_code+"'>"+data[i].comment;
	                   	html += "<a href='#' onclick='fn_update("+data[i].c_code+ ",\"" +data[i].comment+ "\")'>수정</a>";
	                   	html += "<a href='#' onclick='fn_delete("+data[i].c_code+ ")'>삭제</a>";
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
	            $("#commentList").html(html);
	            
	        },
	        error:function(request,status,error){
	            
	       }
		});
	}
	
	//댓글 삭제
	function fn_delete(code){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/menu/commentDel',
			data:{'mcommentId':code},
			 beforeSend : function(xhr)
             {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
			success:function(data){
				if(data == 'success'){
					getCommentList();
					$('#comment').val("");
				}
			}			
		});
	}
	//댓글수정처리
	function commentUpdateProc(code) {
		var updateContent = $('[name=content_'+code+']').val();
		
		$.ajax({
			url: '${pageContext.request.contextPath}/menu/commentUpdate',
			type: 'post',
			data: {'mcommentContent':updateContent,'mcommentId':code},
			 beforeSend : function(xhr)
             {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
             },
			success: function(data){
				if(data == 'success'){
					getCommentList();
					$('#comment').val("");
				}
			}
		});
	}
	
	function fn_update(code,content){
		var updateTags ='';
		
		updateTags += '<div class="input-group">';
		updateTags += '<input type="text" class="form-control" name="content_'+code+'" value="'+content+'"/>';
		updateTags += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+code+');">수정</button> </span>';
	    updateTags += '</div>';
	    
	    $('.commentContent'+code).html(updateTags);
	 
	}
	
</script>
<body>
<div>
	<form id="commentForm" name="commentForm" action="post">
	<sec:csrfInput />
		<div>
			<div>
				<span><strong>댓글</strong></span><span id="cCnt"></span>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<textarea rows="3" cols="30" id="comment" name="mcommentContent" placeholder="댓글을 입력하세요"></textarea>
						<div>
							<a href="#" onclick="fn_comment('${item.menuId}')">등록</a>
						</div>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
		<input type="hidden" id="menuId" name="menuId" value="${item.menuId}">
	</form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
    <sec:csrfInput />
        <div id="commentList">
        </div>
    </form>
</div>
</body>
</html>