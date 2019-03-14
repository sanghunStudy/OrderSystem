<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment_min.js"></script>
<script>
	$(function(){
		getCommentList();
	});

	function fn_comment(code){
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/review_board/commentAdd',
			data:$('#commentForm').serialize(),
			success:function(data){
				if(data == 'success'){
					getCommentList();
					$('#comment').val("");
				}
			}
		});
	}
	
	function getCommentList(){
		   
	    $.ajax({
	        type:'GET',
	        url : '${pageContext.request.contextPath}/review_board/commentList',
	        dataType : "json",
	        data:$("#commentForm").serialize(),
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
	            var html = "";
	            var cCnt = data.length;
	            
	            if(data.length > 0){
	            	
	            	for(i=0; i<data.length; i++){
	            		
	                	html += "<div>";
	                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong> <strong>"+data[0].RcomentDate+"</strong></h6>";
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
	 
	//댓글 수정 처리
	function commentUpdateProc(code){
	    var updateContent = $('[name=content_'+code+']').val();
	    
	    $.ajax({
	        url : '${pageContext.request.contextPath}/review_board/commentUpdate',
	        type : 'post',
	        data : {'rcommentContent' : updateContent, 'rcommentId' : code},
	        success : function(data){
	        	if(data == 'success'){
					getCommentList();
					$('#comment').val("");
				} //댓글 수정후 목록 출력 
	        }
	    });
	}
	 //댓글 수정화면
	function fn_update(code,content){
	    var updateTags ='';
	    
	    updateTags += '<div class="input-group">';
	    updateTags += '<input type="text" class="form-control" name="content_'+code+'" value="'+content+'"/>';
	    updateTags += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+code+');">수정</button> </span>';
	    updateTags += '</div>';
	    
	    $('.commentContent'+code).html(updateTags);
	 
	}
	//댓글 삭제
	function fn_delete(code){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/review_board/commentDel',
			data:{'rcommentId':code},
			success:function(data){
				if(data == 'success'){
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
						<td>
							<textarea rows="3" cols="30" id="comment" name="rcommentContent" placeholder="댓글을 입력하세요"></textarea>
						<div>
							<a href="#" onclick="fn_comment('${item.reviewId}')">등록</a>
						</div>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
		<input type="hidden" id="reviewId" name="reviewId" value="${item.reviewId}">
	</form>
</div>

<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
</body>
</html>