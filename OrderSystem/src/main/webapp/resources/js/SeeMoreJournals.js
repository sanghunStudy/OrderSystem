$(function(){
	var detailbox = document.getElementById('more_exercise_list');
	
	$('.detail').click(function(){
		detailbox.style.display = "block";
	});
	
	$('.more_exercise').click(function(event) {
		if(event.target==detailbox){
			detailbox.style.display = "none";
		}
	});
	
	$('.last-exercise-slider').bxSlider({
		slideWidth:1000,
		slideMargin:0,
		maxSlides:1,
		pager:true
		
	});
});