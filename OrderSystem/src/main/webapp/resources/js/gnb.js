$(function(){
$('.bell-li,.drop-down-menu').on('mouseover',function() {
	
	$('.drop-down-menu > ul').css('opacity',1);
})	
$('.drop-down-menu').on('mouseleave',function() {
	
	$('.drop-down-menu > ul').css('opacity',0);
})	
//$('.bell-li').on('click',function() {
//	
//	$('.drop-down-menu > ul').toggle(300,function() {
//		
//	});
//})		
	
$('.alarm-icon').click(function() {
	$('.alarm-box-header').toggle(300,function() {
		$.ajax({
			url:'/kopo/alram/alramList',
			data:{
				"id":trainerChk
			},
			type:'GET',
			success:function(res){
				var itemsList;
//				console.log(res);//리스트
				res.forEach(function(e){
					itemsList +='<div class="box sb4"><i class="far fa-bell" ></i><p>'+ e.username +'님이'+e.doneSubject +'를 완료 하였습니다.</p></div>';
				});
				$(".alarm-box-header").html(itemsList);
				$.ajax({
					url:'/kopo/alram/alramUpdate',
					data:{
						"id":trainerChk
					},
					type:'GET',
					success:function(){
						$("#bell").text("0");
					}
				});
			}
		});
	});
})
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

