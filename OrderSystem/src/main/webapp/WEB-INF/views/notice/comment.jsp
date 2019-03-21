<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment_min.js"></script>
<script>

// var token = $("meta[name='_csrf']").attr("content");
// var header = $("meta[name='_csrf_header']").attr("content");

	var securityId = "${securityId}";

	$(function(){
		getCommentList();
	
		document.getElementById("comentBtn").onclick = function(){
			if(securityId == "null" || securityId == 'anonymousUser')
				alert('로그인 후 이용 가능합니다.');
			else
				fn_comment('${item.noticeId}')
		}
		
	});

	//등록
	function fn_comment(code){
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/notice/commentAdd',
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
	
	//리스트
	function getCommentList(){
		
		
		
	    $.ajax({
	        type:'GET',
	        url : '${pageContext.request.contextPath}/notice/commentList',
	        dataType : "json",
	        data:$("#commentForm").serialize(),
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
	            var html = "";
	            var cCnt = data.length;
	            
	            if(data.length > 0){
	            	
	            	for(i=0; i<data.length; i++){
	            		
	                	html += "<div>";
	                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong> <strong>"+data[0].NcomentDate+"</strong></h6>";
	                    html += "<tr><td><div class='commentContent"+data[i].c_code+"'>"+data[i].comment;
	                 //로그인한 아이디와 작성자가 같으면 수정삭제 가능
	                    if(data[i].writer == securityId){
		                    html += "<a href='#' onclick='fn_update("+data[i].c_code+ ",\"" +data[i].comment+ "\")'>수정</a>";
		                   	html += "<a href='#' onclick='fn_delete("+data[i].c_code+ ")'>삭제</a>";	
	                    }
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
	        url : '${pageContext.request.contextPath}/notice/commentUpdate',
	        type : 'post',
	        data : {'ncomentContent' : updateContent, 'ncomentId' : code},
	        beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	        	   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
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
			url:'${pageContext.request.contextPath}/notice/commentDel',
			data:{'ncomentId':code},
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
</script>
</head>
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
<%-- 							<input type="hidden" name="id" value="<sec:authentication property="principal.username"/>"> --%>
						</td>
						<td>
							<textarea rows="3" cols="30" id="comment" name="ncomentContent" placeholder="댓글을 입력하세요"></textarea>
						<div>
							<a href="#" id="comentBtn" onclick="fn_comment('${item.noticeId}')">등록</a>
						</div>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
		<input type="hidden" id="noticeId" name="noticeId" value="${item.noticeId}">
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