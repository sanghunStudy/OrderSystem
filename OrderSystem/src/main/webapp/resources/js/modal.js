
$(function() {
	/* 운동관리,식단관리 모달창 이벤트 */
	
	var Modal = document.getElementById('modal');


			
	var modalClickEvent = {
			'trainer-apply':function() {
				Modal.style.display = "block";

			},
			'modal-btn':function() {
				Modal.style.display = "block";
			}
	}
		
	
	
	$('.menu-icons').on('click','i',function(e) {
		var target = e.target || e.srcElement;
		
//		trainer_username = $(this).parents('.item-box').children('.username').text(); /* 트레이너 리스트부분, 공통모달에는 포함되지 않음*/
		
		if(modalClickEvent.hasOwnProperty(target.id)) {
			modalClickEvent[target.id].call();
			
		
		}			
		
	});

	// 모달창 닫기
	var notModal = function () {			
		if(Modal.style.display == 'block')
			return $('div').not('div.modal');

	}



	$(document).on('mousedown', notModal,
			function(e) {
				if (Modal.style.display =='block') {
					if (!$(e.target).parents().hasClass('modal') && !$(e.target).hasClass('modal')){
						var close = confirm("창을 닫게 되면 입력한 정보가 사라집니다. 정말로 닫으시겠습니까?");
						if(close == true) {
							Modal.style.display = 'none';
							$('form :input').val('');

							 
						}
					}
				}



			});
})