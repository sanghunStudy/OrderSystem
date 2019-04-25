$(function(){
	$('#tbqjf').mouseenter(function(){
    	var classes =  $(this).attr('class');
        $(this).attr('class', 'animate');
        var indicator = $(this);
        setTimeout(function(){ 
        	$(indicator).addClass(classes);
        }, 20);
    });
});