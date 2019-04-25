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
    
  
});

function wrapWindowByMask(){
	 $(".inputId").val("");
	 $(".inputPw").val("");
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
