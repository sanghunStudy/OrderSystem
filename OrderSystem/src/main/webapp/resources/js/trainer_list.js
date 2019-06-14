var trainer_username = '';
var photoSrc = '';
var trainer = '';
var trainerSex = '';
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
				$('input[name="weights"]').val(parseFloat($('input[name="weights"]').val()).toFixed(1));
				$('input[name="height"]').val(parseFloat($('input[name="height"]').val()).toFixed(1));
				document.getElementById("managerID").value = managerId;
				document.getElementById("trainer").submit();
				alert('정상적으로 신청되었습니다.');

			}
		}
	});
}
function checkTrainerTier(trainer_username) {
	$.ajax({
		url:"trainer/checkTrainerTier",
		type:"GET",
		data:{
			'username':trainer_username
		},
		success:function(data) {
			console.log(data);
			if(data == "OK") {
				selectUserbI(trainer_username);
			} else {
				alert("해당 트레이너의 멘티가 꽉 찼습니다.");
			}
		}
	});
}
$(function() {
	
	const background = document.querySelector('.background');
	const toggleBody = document.querySelector('.toggle-body');
	const toggleBtn = document.querySelector('.toggle-btn');
	const gender = document.querySelectorAll('.gender');

//	toggleBtn.addEventListener('click', () => {
//	  background.classList.toggle('background--on');
//	  toggleBody.classList.toggle('toggle-body--on');
//	  toggleBtn.classList.toggle('toggle-btn--on');
//	  toggleBtn.classList.toggle('toggle-btn--scale');
//	  gender[0].classList.toggle('gender--female');
//	  gender[1].classList.toggle('gender--female');
//	});
	
	$('.apply').click(function() {
		$('.apply').val(trainer_username);
		checkTrainerTier(trainer_username);
		
	
	});
	var Modal = document.getElementById('modal');
	var DModal = document.getElementById('detail-modal');
	var modalClickEvent = {

		'modal-btn' : function() {
			
			Modal.style.display = "block";
			
			/* ===== Logic for creating fake Select Boxes ===== */
			$('.sel').each(function() {
			  $(this).children('select').css('display', 'none');
			  
			  var $current = $(this);
			  
			  $(this).find('option').each(function(i) {
			    if (i == 0) {
			      $current.prepend($('<div>', {
			        class: $current.attr('class').replace(/sel/g, 'sel__box')
			      }));
			      
			      var placeholder = $(this).text();
			      $current.prepend($('<span>', {
			        class: $current.attr('class').replace(/sel/g, 'sel__placeholder'),
			        text: placeholder,
			        'data-placeholder': placeholder
			      }));
			      
			      return;
			    }
			    
			    $current.children('div').append($('<span>', {
			      class: $current.attr('class').replace(/sel/g, 'sel__box__options'),
			      text: $(this).text()
			    }));
			  });
			});

			// Toggling the `.active` state on the `.sel`.
			$('.sel').click(function() {
			  $(this).toggleClass('active');
			});

			// Toggling the `.selected` state on the options.
			$('.sel__box__options').click(function() {
			  var txt = $(this).text();
			  var index = $(this).index();
			  
			  $(this).siblings('.sel__box__options').removeClass('selected');
			  $(this).addClass('selected');
			  
			  var $currentSel = $(this).closest('.sel');
			  $currentSel.children('.sel__placeholder').text(txt);
			  $currentSel.children('select').prop('selectedIndex', index + 1);
			  $('.sel__placeholder').css('color','#981d85');
			});

		},
		'detail-btn' : function() {
			DModal.style.display = "block";
			$('.detail-photo').css('background',"url('"+photoSrc+"'),url('/kopo/resources/images/icon/default-profile-icon.jpg')");
			$('.detail-photo').css('background-size','contain');
			
			$('.trainer-name').text($('.trainer-name').val());
			$('.id-content').text($('.trainer-id').val());
			$('.career-contents').text($('.trainer-career').val());
			
			if(trainerSex == '여자'){
				background.className = 'background background--on';
				toggleBody.className = 'toggle-body toggle-body--on';
				gender[0].className = 'male gender gender--female';
				gender[1].className = 'female gender gender--female';
				toggleBtn.className = 'toggle-btn toggle-btn--on toggle-btn--scale';
			
			}
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
					'.trainer-id').val();
					
//					photoSrc = $(this).parents('.item-box').find('img').attr('src');
					photoSrc = $(this).parents('.item-box').find('.text').attr('src');
					trainer = $(this).parents('.item-box').find('.username').text();
					trainerSex = $(this).parents('.item-box').find('.trainer-sex').val();
					
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