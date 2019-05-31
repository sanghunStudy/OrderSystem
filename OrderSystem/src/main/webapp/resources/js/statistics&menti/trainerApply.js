
/* 트레이너 신청 list */
function proList() 
{
	$.ajax({
		type:'get',
		url:path+'/member/ajaxProList',
		success:function(res) {
			
			$(".pro-list").html("");
			var tr = '';
			
			console.log(res);
					for (var i=0; i < res.proList.length;i++) { 
						console.log(res.proList[i].username);
					
				tr += '<tr><td class="upload-display"><img src="' + path + '/upload/' + res.proList[i].upFilename + '"></td>';
				tr += '<td class="apply-date">' + res.proList[i].username + '</td>';
				tr += '<td>' + res.proList[i].name  +'</td>';
				tr += '<td>' + res.proList[i].sex + '</td>';
				tr += '<td>' + res.proList[i].applyDate + '</td>';
				tr += '<td><input name=username type="button" value="수락" onclick="grantDo('+res.proList[i].username +');" />';
				tr += '<input name=username type="button" value="거절" onclick="grantDel('+res.proList[i].username +');" /></td>';
					
			};
			$('.pro-list').html(tr);
		}
	});
}

	/* 트레이너 승인or허가 버튼 이벤트 */
	function grantDo(code) {
	
		$.ajax({
			type : 'post',
			url : path+'/member/grant',
			data : {
				"username" : code
			},
			success : function(data) {
				if (data == 'success') {
					alert("승인되었습니다.");
					proList();
				}
				else
					alert("승인이 실패되었습니다. 나중에 다시 시도해 주세요.");
			}
		});
	};
	
	function grantDel(code) {
		$.ajax({
			type : 'post',
			url : path+'/member/grantDel',
			data : {
				"username" : code
			},
			success : function(data) {
				if (data == 'success') {
					alert("거절되었습니다.");
					proList();
				}
				else
					alert("거절이 실패되었습니다. 나중에 다시 시도해 주세요.");
			}
		});
	};

