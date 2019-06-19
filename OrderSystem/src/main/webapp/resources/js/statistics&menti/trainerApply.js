
$(document).ready(function() {
	Date.prototype.format = function (f) {
	    if (!this.valueOf()) return " ";
	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	    var d = this;
	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear(); // 년 (4자리)
	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
	            case "dd": return d.getDate().zf(2); // 일 (2자리)
	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
	            default: return $1;
	        }
	    });
	};
	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
	Number.prototype.zf = function (len) { return this.toString().zf(len); };
});
function DateFormatReady(date) {
	console.log(date);
	var dates = new Date(date);
	var change = dates.format('yyyy-MM-dd');
	return '<td>'+ change + '</td>';
}
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
			
			if(res.proList.length > 0) {
				for (var i=0; i < res.proList.length;i++) { 
					
//					tr += '<tr><td class="upload-display"><img src="' + path + '/upload/' + res.proList[i].upFilename + '" onError="this.src=' + defaultImage +'" class="psa"></td>';
							tr += '<tr><td class="upload-display"><img src="' + path + '/upload/' + res.proList[i].upFilename + '" onError="defaultImage(this)" class="psa"></td>';						
					tr += DateFormatReady(res.proList[i].applyDate);
					tr += '<td>' + res.proList[i].username + '</td>';
					tr += '<td>' + res.proList[i].name  +'</td>';
					tr += '<td>' + res.proList[i].sex + '</td>';
					tr += '<td><input class="info" name=username type="button" value="상세보기" onclick="grantDo('+res.proList[i].username +');" /></td>';
					tr += '<td><input class="accept" name=username type="button" value="수락" onclick="grantDo('+res.proList[i].applyNum +');" /></td>';
					tr += '<td><input class="reject" name=username type="button" value="거절" onclick="grantDel('+res.proList[i].applyNum +');" /></td>';
					tr += '</tr>';
						
				};
			} else {
				tr += '<tr><td colspan="7" class="nolist">신청한 트레이너가 없습니다.</td></tr>';
			}
				
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
				"applyNum" : code
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
				"applyNum" : code
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

