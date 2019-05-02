<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/triceps.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/triceps.js"></script>
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
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>    
                </ul>
            </div>
            <div class="info">
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_overhead_extension.jpg" alt="sample72"/>
                    <figcaption>
                        <h3>케이블 오버헤드 익스텐션</h3>
                    </figcaption>
                    <a href="#" id="triceps_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_triesps_pushdown.jpg" alt="sample21"/>
                    <figcaption>
                        <h3>케이블 트라이셉스 푸시 다운</h3>
                    </figcaption>
                    <a href="#" id="triceps_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/close_grip_bench_press.jpg" alt="sample86"/>
                    <figcaption>
                        <h3>클로즈 그립 벤치 프레스</h3>
                    </figcaption>
                    <a href="#" id="triceps_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dips.jpg" alt="sample72"/>
                    <figcaption>
                        <h3>딥스</h3>
                    </figcaption>
                    <a href="#" id="triceps_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dumbbell_kickback.jpg" alt="sample21"/>
                    <figcaption>
                        <h3>덤벨 킥 백</h3>
                    </figcaption>
                    <a href="#" id="triceps_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/lying_triesps_extension.jpg" alt="sample86"/>
                    <figcaption>
                        <h3>라잉 트라이셉스 익스텐션</h3>
                    </figcaption>
                    <a href="#" id="triceps_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
    <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="triceps1" class="tricepsModal">
      <!-- Modal content -->
            <div class="tricepsModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_overhead_extension.jpg" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="triceps2" class="tricepsModal">
      <!-- Modal content -->
            <div class="tricepsModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/cable_triesps_pushdown.jpg" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="triceps3" class="tricepsModal">
      <!-- Modal content -->
            <div class="tricepsModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/close_grip_bench_press.jpg" alt="sample86"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="triceps4" class="tricepsModal">
      <!-- Modal content -->
            <div class="tricepsModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dips.jpg" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="triceps5" class="tricepsModal">
      <!-- Modal content -->
            <div class="tricepsModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/dumbbell_kickback.jpg" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="triceps6" class="tricepsModal">
      <!-- Modal content -->
            <div class="tricepsModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/triceps/lying_triesps_extension.jpg" alt="sample86"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>