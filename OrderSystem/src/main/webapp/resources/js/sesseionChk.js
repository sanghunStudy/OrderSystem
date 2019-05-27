var initMinute;
var remainSecond;



function clearTime(min){
	initMinute = min;
	remainSecond = min * 60;
}

function setTimer(){
	remainMinute_ = parseInt(remainSecond/60);
	remainSecond_ = remainSecond%60;
	
	if(remainSecond > 0){
// 		$("#timer").empty();
// 		$("#timer").append(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2));
		if(remainSecond < 60){
			$("#sessionChk").show();
			$("#sessionChk p").empty();
			$("#sessionChk p").append("아무 동작이 없으면"+Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2)+"후 자동 로그아웃 됩니다.");
//			console.log(remainSecond);
//			console.log(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2)+"후 자동 로그아웃 됩니다.");
		}
		remainSecond--;
		setTimeout("setTimer()",1000);
	}else{
		alert("로그아웃 되었습니다.");
		location.href = logoutUri;
	}
}

function Lpad(str,len){
	str = str + "";
	while(str.length<len){
		str = "0"+str;
	}
	return str;
}

//$("#sessionExtension").on("click",function(){
//	location.reload();
//});
//시간연장 버튼을 누르면 페이지를 새로고침 하여 세션 연장
function sessionChk(){
	location.reload();
}