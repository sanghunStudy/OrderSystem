var scrollEvent = false;
var count = 0;






$(window).load(function(){
//    console.log("로딩완료");
    go();
});

//로딩완료



//스크롤 페이지
function go(){

    $("html,body").on("mousewheel",function(c){
    
    c.preventDefault();
    var m = c.originalEvent.wheelDelta;
    var sb = $(".section0").height();

    if(m > 1 && scrollEvent == false && count >= 1){
//        console.log(count+"<<<<<count");
        scrollEvent = true;
        count--;
        $("html,body").stop().animate({scrollTop:sb*count},
            {duration:600,complete: function(){
            scrollEvent = false;}
        })

    }else if(m<1 && scrollEvent == false && count <3){
//        console.log(count+"<<<<<<else if count");
        scrollEvent = true;
        count++;
        $("html,body").stop().animate({scrollTop:sb*count},
            {duration:600, complete: function(){
             scrollEvent = false;}
        })
    }

    if(count == 1){
        $(".section1_item").addClass("animated animatedFadeInUp fadeInUp");
    }else if(count == 2){
        // alert("3번째 영역");
    }else if(count == 3){
        // alert("4번째 영역");
        $(".section3_item").addClass("animated animatedFadeInUp fadeInUp");
    }
});

}

//캐러셀
var time; // 슬라이드 넘어가는 시간
var $carouselLi;
var carouselCount; // 캐러셀 사진 갯수
var currentIndex; // 현재 보여지는 슬라이드 인덱스 값
var caInterval;
 
//사진 연결
var imgW; // 사진 한장의 너비    
$(document).ready(function(){
 
var he = "100%";
    //사진 크기 및 넘어가는 시간
    carouselInit(he, 3000);
});
 
$(window).resize(function(){
    carousel_setImgPosition();
});
 
/* 초기 설정 */
function carouselInit( height, t ){
    /*
     * height : 캐러셀 높이
     * t : 사진 전환 간격 
    */
 
    time = t;
    $("#carousel_section").height(height); // 캐너셀 높이 설정
    $carouselLi = $("#carousel_section > ul >li");
    carouselCount = $carouselLi.length; // 캐러셀 사진 갯수
    currentIndex = 0; // 현재 보여지는 슬라이드 인덱스 값
    carousel_setImgPosition();
    carousel();
}
 
function carousel_setImgPosition(){
 
    imgW = $carouselLi.width(); // 사진 한장의 너비    
    // 이미지 위치 조정
    for(var i = 0; i < carouselCount; i++)
    {
        if( i == currentIndex)
        {
            $carouselLi.eq(i).css("left", 0);
        }
        else
        {
            $carouselLi.eq(i).css("left", imgW);
        }
    }
}
 
function carousel(){
 
    // 사진 넘기기
    // 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
    // 화면에 보이는 슬라이드만 보이기
    caInterval = setInterval(function(){
        var left = "-" + imgW;
 
        //현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
        $carouselLi.eq(currentIndex).animate( { left: left }, function(){
            // 다시 오른쪽 (제자리)로 이동
            $carouselLi.eq(currentIndex).css("left", imgW);
 
            if( currentIndex == ( carouselCount - 1 ) )
            {
                currentIndex = 0;
            }
            else
            {
                currentIndex ++;
            }
        } );
 
        // 다음 슬라이드 화면으로
        if( currentIndex == ( carouselCount - 1 ) )
        {
            // 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
            $carouselLi.eq(0).animate( { left: 0 } );
        }
        else
        {
            $carouselLi.eq(currentIndex + 1).animate( { left: 0 } );
        }
    }, time);
}

