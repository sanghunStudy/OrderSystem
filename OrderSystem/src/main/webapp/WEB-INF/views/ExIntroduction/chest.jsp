<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/chest.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/chest.js"></script>
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
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/chest">가슴</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/back">등</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/abs">복근</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>         
                </ul>
            </div>
            <div class="info">
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/cable_crossover.png" alt="sample72"/>
                    <figcaption>
                        <h3>케이블 크로스오버</h3>
                    </figcaption>
                    <a href="#" id="chest_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dickle_bench_press.png" alt="sample21"/>
                    <figcaption>
                        <h3>디클 벤치 프레스</h3>
                    </figcaption>
                    <a href="#" id="chest_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_fly.png" alt="sample86"/>
                    <figcaption>
                        <h3>덤벨 플라이</h3>
                    </figcaption>
                    <a href="#" id="chest_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_pull_over.png" alt="sample72"/>
                    <figcaption>
                        <h3>덤벨 풀 오버</h3>
                    </figcaption>
                    <a href="#" id="chest_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/flat_bench_press.png" alt="sample21"/>
                    <figcaption>
                        <h3>플랫 벤치 프레스</h3>
                    </figcaption>
                    <a href="#" id="chest_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/incline_bench_press.png" alt="sample86"/>
                    <figcaption>
                        <h3>인클라인 벤치 프레스</h3>
                    </figcaption>
                    <a href="#" id="chest_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
    <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="chest1" class="chestModal">
      <!-- Modal content -->
            <div class="chestModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/cable_crossover.png" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="chest2" class="chestModal">
      <!-- Modal content -->
            <div class="chestModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dickle_bench_press.png" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="chest3" class="chestModal">
      <!-- Modal content -->
            <div class="chestModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_fly.png" alt="sample86"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="chest4" class="chestModal">
      <!-- Modal content -->
            <div class="chestModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/dumbbell_pull_over.png" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="chest5" class="chestModal">
      <!-- Modal content -->
            <div class="chestModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/flat_bench_press.png" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="chest6" class="chestModal">
      <!-- Modal content -->
            <div class="chestModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/chest/incline_bench_press.png" alt="sample86"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>