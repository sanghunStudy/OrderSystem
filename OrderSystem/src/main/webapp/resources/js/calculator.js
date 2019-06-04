$(function() {
	// Get the modal
	var calculatorModal = document.getElementById('calcModal');

	// Get the button that opens the modal
	var calculatorbtn = document.getElementById("calBtn");

	// Get the <span> element that closes the modal
	var calculatorspan = document.getElementsByClassName("calculatorModal-close")[0];

	// When the user clicks on the button, open the modal
	calculatorbtn.onclick = function() {
		calculatorModal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	calculatorspan.onclick = function() {
		calculatorModal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == calculatorModal) {
			calculatorModal.style.display = "none";
		}
	}

});

$(document).ready(function() {

	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

	$('.fa-save').click(function() {
		var Bmetabolism = $('#Bmetabolism').text();
		var Erequirement = $('#Erequirement').text();
        $.ajax({
            url:'/kopo/besave/besave',
            type:'POST',
            data:{'Bmetabolism':Bmetabolism,
            	'Erequirement': Erequirement
            },
            success:function(data){
            	if(data == 1)
                alert("저장되었습니다.");
            	else
            	alert("저장이 실패했습니다.");
            }
        });
	});
})

