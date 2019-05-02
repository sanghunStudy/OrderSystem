<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/biceps.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/biceps.js"></script>
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
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>    
                </ul>
            </div>
         <div class="info">
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/barbell_curl.png" alt="sample72"/>
                    <figcaption>
                        <h3>바벨 컬</h3>
                    </figcaption>
                    <a href="#" id="armtrain_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/concentrate_curl.png" alt="sample21"/>
                    <figcaption>
                        <h3>컨센트레이트 컬</h3>
                    </figcaption>
                    <a href="#" id="armtrain_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/dumbbell_curl.png" alt="sample86"/>
                    <figcaption>
                        <h3>덤벨 컬</h3>
                    </figcaption>
                    <a href="#" id="armtrain_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/ez-var_curl.png" alt="sample72"/>
                    <figcaption>
                        <h3>ez-bar 컬</h3>
                    </figcaption>
                    <a href="#" id="armtrain_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/hammer_curl.png" alt="sample21"/>
                    <figcaption>
                        <h3>해머 컬</h3>
                    </figcaption>
                    <a href="#" id="armtrain_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/pretzel_curl.png" alt="sample86"/>
                    <figcaption>
                        <h3>프리쳐 컬</h3>
                    </figcaption>
                    <a href="#" id="armtrain_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
    <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="armtrain1" class="armModal">
      <!-- Modal content -->
            <div class="armModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/barbell_curl.png" alt="sample72"/>
               <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="armtrain2" class="armModal">
      <!-- Modal content -->
            <div class="armModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/concentrate_curl.png" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="armtrain3" class="armModal">
      <!-- Modal content -->
            <div class="armModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/dumbbell_curl.png" alt="sample86"/>
               <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="armtrain4" class="armModal">
      <!-- Modal content -->
            <div class="armModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/ez-var_curl.png" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="armtrain5" class="armModal">
      <!-- Modal content -->
            <div class="armModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/hammer_curl.png" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="armtrain6" class="armModal">
      <!-- Modal content -->
            <div class="armModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/biceps/pretzel_curl.png" alt="sample86"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>