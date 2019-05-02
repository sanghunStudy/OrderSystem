<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/lowbody.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/lowbody.js"></script>
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
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/back">등</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/abs">복근</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>    
                </ul>
            </div>
            <div class="info">
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/hiba_squat.png" alt="sample72"/>
                    <figcaption>
                        <h3>하이바 스쿼트</h3>
                    </figcaption>
                    <a href="#" id="lowbody_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_curl.png" alt="sample21"/>
                    <figcaption>
                        <h3>레그 컬</h3>
                    </figcaption>
                    <a href="#" id="lowbody_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_extension.png" alt="sample86"/>
                    <figcaption>
                        <h3>레그 익스텐션</h3>
                    </figcaption>
                    <a href="#" id="lowbody_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_press.png" alt="sample72"/>
                    <figcaption>
                        <h3>레그 프레스</h3>
                    </figcaption>
                    <a href="#" id="lowbody_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/low_bar_squat.png" alt="sample21"/>
                    <figcaption>
                        <h3>로우 바 스쿼트</h3>
                    </figcaption>
                    <a href="#" id="lowbody_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/lunge.png" alt="sample86"/>
                    <figcaption>
                        <h3>런지</h3>
                    </figcaption>
                    <a href="#" id="lowbody_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
     <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="lowbody1" class="lowbodyModal">
      <!-- Modal content -->
            <div class="lowbodyModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/hiba_squat.png" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="lowbody2" class="lowbodyModal">
      <!-- Modal content -->
            <div class="lowbodyModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_curl.png" alt="sample21"/>
                  <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="lowbody3" class="lowbodyModal">
      <!-- Modal content -->
            <div class="lowbodyModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_extension.png" alt="sample86"/>
                  <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="lowbody4" class="lowbodyModal">
      <!-- Modal content -->
            <div class="lowbodyModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/leg_press.png" alt="sample72"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="lowbody5" class="lowbodyModal">
      <!-- Modal content -->
            <div class="lowbodyModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/low_bar_squat.png" alt="sample21"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="lowbody6" class="lowbodyModal">
      <!-- Modal content -->
            <div class="lowbodyModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/lowbody/lunge.png" alt="sample86"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>