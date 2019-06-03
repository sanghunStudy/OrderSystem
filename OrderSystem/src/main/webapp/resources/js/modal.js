$(function() {
	/* 운동관리,식단관리 모달창 이벤트 */
	
	var Modal = document.getElementById('modal');


			
	var modalClickEvent = {
			'modal-btn':function() {
				Modal.style.display = "block";
			}

	}
		
	
	
	$('.modal-btn-box').on('click','button',function(e) {
		var target = e.target || e.srcElement;
		
		if(modalClickEvent.hasOwnProperty(target.id)) {
			modalClickEvent[target.id].call();
	
		
		}			
		
	});
	
})