var trainer_username = '';
var photoSrc = '';
var trainer = '';
function selectUserbI(managerId) {
	var test = this.value;


	$.ajax({
		type : "GET",
		url : "/kopo/trainer/selectUserbI",
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
	
	const background = document.querySelector('.background');
	const toggleBody = document.querySelector('.toggle-body');
	const toggleBtn = document.querySelector('.toggle-btn');
	const gender = document.querySelectorAll('.gender');

	toggleBtn.addEventListener('click', () => {
	  background.classList.toggle('background--on');
	  toggleBody.classList.toggle('toggle-body--on');
	  toggleBtn.classList.toggle('toggle-btn--on');
	  toggleBtn.classList.toggle('toggle-btn--scale');
	  gender[0].classList.toggle('gender--female');
	  gender[1].classList.toggle('gender--female');
	});
	
	$('.apply').click(function() {
		$('.apply').val(trainer_username);
		selectUserbI(trainer_username);
	
	});
	var Modal = document.getElementById('modal');
	var DModal = document.getElementById('detail-modal');
	var modalClickEvent = {

		'modal-btn' : function() {
			Modal.style.display = "block";
		},
		'detail-btn' : function() {
			DModal.style.display = "block";
			$('.detail-photo').css('background',"url('"+photoSrc+")");
			$('.trainer-name').text(trainer);
			
		}
	}

	$('.modal-btn-box').on(
			'click',
			'button',
			function(e) {
				var target = e.target || e.srcElement;

				
				
				if (modalClickEvent.hasOwnProperty(target.id)) {
					/* 트레이너 리스트부분, 공통모달에는 포함되지 않음 */
					trainer_username = $(this).parents('.item-box').find(
					'.username').text();
					
					photoSrc = $(this).parents('.item-box').find('img').attr('src');
					trainer = $(this).parents('.item-box').find('.username').text();
					modalClickEvent[target.id].call();
					
				

				}

			});
	// 모달창 닫기
	var notModal = function() {
		if (Modal.style.display == 'block')
			return $('div').not('div.modal');
		else if (DModal.style.display == 'block')
			return $('div').not('div.dmodal');
	}
	

	$(document)
			.on(
					'mousedown',
					notModal,
					function(e) {
						if (Modal.style.display == 'block') {
							if (!$(e.target).parents().hasClass('modal')
									&& !$(e.target).hasClass('modal')) {
								var close = confirm("창을 닫게 되면 입력한 정보가 사라집니다. 정말로 닫으시겠습니까?");
								if (close == true) {
									Modal.style.display = 'none';
									$('form :input').val('');

								}
							}
						}
						else if (DModal.style.display == 'block') {
							if (!$(e.target).parents().hasClass('dmodal')
									&& !$(e.target).hasClass('dmodal')) {
								
									DModal.style.display = 'none';
									

								
							}
						}

					});
})