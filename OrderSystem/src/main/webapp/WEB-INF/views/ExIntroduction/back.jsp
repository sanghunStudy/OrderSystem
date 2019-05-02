<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/back.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/back.js"></script>
<script>
$(".hover").mouseleave(
	    function () {
	      $(this).removeClass("hover");
	    }
	  );
</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
 <body>
<div class="container">
        <h1>TRAINING</h1>
        <div class="train">
            <div class="train_menu">
                <ul class="menu">
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/chest">가슴</a></li>
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/back">등</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/abs">복근</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>    
                </ul>
            </div>
            <div class="info">
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/babel_row.jpg" alt="sample72"/>
                    <figcaption>
                        <h3>바벨 로우</h3>
                    </figcaption>
                    <a href="#" id="back_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/inverted_row.JPG" alt="sample21"/>
                    <figcaption>
                        <h3>인버티드 로우</h3>
                    </figcaption>
                    <a href="#" id="back_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/lat_pull_down.jpg" alt="sample86"/>
                    <figcaption>
                        <h3>랫 풀 다운</h3>
                    </figcaption>
                    <a href="#" id="back_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/pull_up.jpg" alt="sample72"/>
                    <figcaption>
                        <h3>풀 업</h3>
                    </figcaption>
                    <a href="#" id="back_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/romanian_dead_lift.jpg" alt="sample21"/>
                    <figcaption>
                        <h3>루마니안 데드 리프트</h3>
                    </figcaption>
                    <a href="#" id="back_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/seated_cable_row.jpg" alt="sample86"/>
                    <figcaption>
                        <h3>시티드 케이블 로우</h3>
                    </figcaption>
                    <a href="#" id="back_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
     <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="back1" class="backModal">
      <!-- Modal content -->
            <div class="backModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/babel_row.jpg" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="back2" class="backModal">
      <!-- Modal content -->
            <div class="backModalContent">
               <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/inverted_row.JPG" alt="sample21"/>
               <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="back3" class="backModal">
      <!-- Modal content -->
            <div class="backModalContent">
              <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/lat_pull_down.jpg" alt="sample86"/>  
              <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="back4" class="backModal">
      <!-- Modal content -->
            <div class="backModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/pull_up.jpg" alt="sample72"/>
               <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="back5" class="backModal">
      <!-- Modal content -->
            <div class="backModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/romanian_dead_lift.jpg" alt="sample21"/>
               <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="back6" class="backModal">
      <!-- Modal content -->
            <div class="backModalContent">
              <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/back/seated_cable_row.jpg" alt="sample86"/>  
              <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>