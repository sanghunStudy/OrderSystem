
var userPoint = "${userPoint}";
var ChkApplyAuthority = '${sessionScope.user}';

$(function() {
   
   var Modal = document.getElementById('modal');

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

     if($('.toggle-btn').attr('value') == 'male') 
        $('.toggle-btn').attr('value','female');
     else
        $('.toggle-btn').attr('value','male');

     $('.gender_value').val($('.toggle-btn').attr('value'));
     console.log($('.gender_value').val());
   });
   
   var modalClickEvent = {
         'trainer-apply':function() {
     		if (userPoint <= 500 || ChkApplyAuthority == "") {
    			alert('테스트');
    			location.href = "/kopo";
    		
    		}
     		else 
     			Modal.style.display = "block";

         },
         'modal-btn':function() {
            Modal.style.display = "block";
         }
   }
   
   
   
   
   $('.menu-icons').on('click','i',function(e) {
      var target = e.target || e.srcElement;
      
//      trainer_username = $(this).parents('.item-box').children('.username').text(); /* 트레이너 리스트부분, 공통모달에는 포함되지 않음*/
      
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