<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/abs.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/abs.js"></script>
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
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/abs">복근</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>    
                </ul>
            </div>
            <div class="info">
            <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/ab_wheel_rollout.jpg" alt="sample72"/>
                    <figcaption>
                        <h3>앱 휠 롤아웃</h3>
                    </figcaption>
                    <a href="#" id="abs_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/decline_weighted_workout.jpg" alt="sample21"/>
                    <figcaption>
                        <h3>디클라인 웨이트 워크아웃</h3>
                    </figcaption>
                    <a href="#" id="abs_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/deep_bar_L_sit_hold.jpg" alt="sample86"/>
                    <figcaption>
                        <h3>딥 바 L 싯 홀드</h3>
                    </figcaption>
                    <a href="#" id="abs_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/leg_raise.jpg" alt="sample72"/>
                    <figcaption>
                        <h3>레그 레이즈</h3>
                    </figcaption>
                    <a href="#" id="abs_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/plank.jpg" alt="sample21"/>
                    <figcaption>
                        <h3>플랭크</h3>
                    </figcaption>
                    <a href="#" id="abs_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/tozutubar.jpg" alt="sample86"/>
                    <figcaption>
                        <h3>토즈투바</h3>
                    </figcaption>
                    <a href="#" id="abs_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
        <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="abs1" class="absModal">
      <!-- Modal content -->
            <div class="absModalContent">   
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/ab_wheel_rollout.jpg" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="abs2" class="absModal">
      <!-- Modal content -->
            <div class="absModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/decline_weighted_workout.jpg" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="abs3" class="absModal">
      <!-- Modal content -->
            <div class="absModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/deep_bar_L_sit_hold.jpg" alt="sample86"/>
               <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="abs4" class="absModal">
      <!-- Modal content -->
            <div class="absModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/leg_raise.jpg" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="abs5" class="absModal">
      <!-- Modal content -->
            <div class="absModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/plank.jpg" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="abs6" class="absModal">
      <!-- Modal content -->
            <div class="absModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/abs/tozutubar.jpg" alt="sample86"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>