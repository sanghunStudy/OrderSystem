
/* 트레이너 신청 list */
function proList() 
{
	$.ajax({
		type:'get',
		url:path+'/member/ajaxProList',
		success:function(res) {
			
			$(".pro-list").html("");
			var tr = '';
			var defaultImage  ='/kopo/resources/images/icon/default-profile-icon.jpg';
					for (var i=0; i < res.proList.length;i++) { 
					
//				tr += '<tr><td class="upload-display"><img src="' + path + '/upload/' + res.proList[i].upFilename + '" onError="this.src=' + defaultImage +'" class="psa"></td>';
						tr += '<tr><td class="upload-display"><img src="' + path + '/upload/' + res.proList[i].upFilename + '" onError="defaultImage(this)" class="psa"></td>';						
				tr += '<td>' + res.proList[i].applyDate + '</td>';
				tr += '<td class="apply-date">' + res.proList[i].username + '</td>';
				tr += '<td>' + res.proList[i].name  +'</td>';
				tr += '<td>' + res.proList[i].sex + '</td>';
				tr += '<td><input class="info" name=username type="button" value="상세보기" onclick="grantDo('+res.proList[i].username +');" /></td>';
				tr += '<td><input class="accept" name=username type="button" value="수락" onclick="grantDo('+res.proList[i].username +');" /></td>';
				tr += '<td><input class="reject" name=username type="button" value="거절" onclick="grantDel('+res.proList[i].username +');" /></td>';
					
			};
			$('.pro-list').html(tr);
		}
	});
}
function defaultImage(obj) {
	console.log(obj.setAttribute('src','/kopo/resources/images/icon/default-profile-icon.jpg'));
}
//onError="javascript:this.src='/kopo/resources/images/icon/default-profile-icon.jpg'" class="psa"
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

