$(function(){
	$('#tbqjf').mouseenter(function(){
    	var classes =  $(this).attr('class');
        $(this).attr('class', 'animate');
        var indicator = $(this);
        setTimeout(function(){ 
        	$(indicator).addClass(classes);
        }, 20);
    });

    //검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();  
    });       

    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();  

    });      


    $('.inputId, .inputPw').focus(function() {
    	$(this).prev().css('color','#d543a6');
    	$(this).prev().animate({'margin-left':'10px'},500);
    	$(this).animate({'margin-left':'40px'},500);
    	$(this).val("");
    }).focusout(function() {
    	$(this).prev().animate({'margin-left':'20px'},500);
    	$(this).prev().css('color','grey');
    	$(this).animate({'margin-left':'80px'},500);
    });
    
    
 // 스크롤 내렸을때 내비바 설정
    var didScroll; 
    var lastScrollTop = 0; 
    var delta = 5; 
    var navbarHeight = $('header').outerHeight(); 
    $(window).scroll(function(event){ 
    	didScroll = true; 
    	}); 
    setInterval(function() { 
    	if (didScroll) { 
    		hasScrolled();
    		didScroll = false; 
    		} 
    	}, 250); 
    function hasScrolled() { 
    	var st = $(this).scrollTop(); 
    	
    	// Make sure they scroll more than delta 
    	if(Math.abs(lastScrollTop - st) <= delta) 
    		return; 
    	// If they scrolled down and are past the navbar, add class .nav-up. 
    	// This is necessary so you never see what is "behind" the navbar. 
    	if (st > lastScrollTop && st > navbarHeight){ 
    		
    		// Scroll Down 
    		$('header').removeClass('nav-down').addClass('nav-up'); 
    		} else { 
    		// Scroll Up 
    		if(st + $(window).height() < $(document).height()) { 
    			$('header').removeClass('nav-up').addClass('nav-down'); 
    			} 
    		} 
    	lastScrollTop = st; 
    	}

});

function wrapWindowByMask(){
	 $(".inputId").val("");
	 $(".inputPw").val("");
	 $("#LoginChk").text("");
	 $(".window").css("height","330px");
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = "100%";
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  

    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    

    //윈도우 같은 거 띄운다.
    $(".window").show();

}

//달력
function inputDatepicker(){
	//input을 date1로 선언
	$(".input-date").datepicker({
			dateFormat : 'yy-mm-dd' //Input Display Format 변경
			,showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear : true //콤보박스에서 년 선택 가능
			,changeMonth : true //콤보박스에서 월 선택 가능                
			,showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			,buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			,buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			,yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort : [ '1', '2', '3', '4', '5', '6','7', '8', '9', '10', '11', '12' ] //달력의 월 부분 텍스트
			,monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
			,dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일','금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트,
			,minDate :0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)//maxDate: 0
			,maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
		});
	//초기값을 오늘 날짜로 설정
	$('.input-date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)   
}
