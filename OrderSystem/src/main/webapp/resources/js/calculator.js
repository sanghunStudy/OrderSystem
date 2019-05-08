$(function() {
	// Get the modal
	var modal = document.getElementById('calcModal');

	// Get the button that opens the modal
	var btn = document.getElementById("calBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
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
            url:'besave/besave',
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

