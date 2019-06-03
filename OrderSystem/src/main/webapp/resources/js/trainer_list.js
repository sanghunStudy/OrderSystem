function selectUserbI(managerId) {
	var test = this.value;
	var weights = $('.weights').val();
	var height = $('.height').val();
	var etc = $('.etc').val();
	console.log(weights);
	console.log(height);
	console.log(etc);
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/trainer/selectUserbI",
		data : {
			'weights' : weights,
			'height' : height,
			'etc' : etc
		},
		success : function(data) {
			if (data == 0) {
				alert("회원 기초 정보를 등록하세요");
			} else if (data == 2) {
				alert("신청 내역이 존재합니다.");
			} else {
			
				document.getElementById("managerID").value = managerId;
				document.getElementById("trainer").submit();

			}
		}
	});
}
$(function() {
	$('.apply').click(function() {
				
				selectUserbI(trainer_username);
				$('.apply').val(trainer_username);
	})
})