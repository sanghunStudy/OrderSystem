<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동소개</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ExIntroduction/shoulder.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ExIntroduction/shoulder.js"></script>
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
                    <li class="part" id="opened_page"><a href="${pageContext.request.contextPath}/ExIntroduction/shoulder">어깨</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/biceps">이두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/triceps">삼두</a></li>
                    <li class="part"><a href="${pageContext.request.contextPath}/ExIntroduction/lowbody">하체</a></li>    
                </ul>
            </div>
           <div class="info">
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/behind_neck_press.png" alt="sample72"/>
                    <figcaption>
                        <h3>비하인드 넥프레스</h3>
                    </figcaption>
                    <a href="#" id="shoulder_btn1"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/bent_over_lateral_raise.png" alt="sample21"/>
                    <figcaption>
                        <h3>벤트 오버 레터럴 레이즈</h3>
                    </figcaption>
                    <a href="#" id="shoulder_btn2"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/dumbbell_shoulder_press.png" alt="sample86"/>
                    <figcaption>
                        <h3>덤벨 숄더 프레스</h3>
                    </figcaption>
                    <a href="#" id="shoulder_btn3"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/front_raise.png" alt="sample72"/>
                    <figcaption>
                        <h3>프론트 레이즈</h3>
                    </figcaption>
                    <a href="#" id="shoulder_btn4"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/military_press.png" alt="sample21"/>
                    <figcaption>
                        <h3>밀리터리 프레스</h3>
                    </figcaption>
                    <a href="#" id="shoulder_btn5"></a>
                </figure>
                <figure class="snip1273">
                    <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/side-lateral_raise.png" alt="sample86"/>
                    <figcaption>
                        <h3>사이드 레터럴 레이즈</h3>
                    </figcaption>
                    <a href="#" id="shoulder_btn6"></a>
                </figure>
            </div>
        </div>
        </div>
     <div id="ModalContentTotalBox">
        <!-- The Modal -->
        <div id="shoulder1" class="shoulderModal">
      <!-- Modal content -->
            <div class="shoulderModalContent"> 
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/behind_neck_press.png" alt="sample72"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="shoulder2" class="shoulderModal">
      <!-- Modal content -->
            <div class="shoulderModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/bent_over_lateral_raise.png" alt="sample21"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="shoulder3" class="shoulderModal">
      <!-- Modal content -->
            <div class="shoulderModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/dumbbell_shoulder_press.png" alt="sample86"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="shoulder4" class="shoulderModal">
      <!-- Modal content -->
            <div class="shoulderModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/front_raise.png" alt="sample72"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="shoulder5" class="shoulderModal">
      <!-- Modal content -->
            <div class="shoulderModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/military_press.png" alt="sample21"/>
                <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        <div id="shoulder6" class="shoulderModal">
      <!-- Modal content -->
            <div class="shoulderModalContent">
                <img src="${pageContext.request.contextPath}/resources/images/ExIntroduction/shoulder/side-lateral_raise.png" alt="sample86"/>
                 <div id="ModalContentTitle">
                    <h3>케이블 오버헤드 익스텐션</h3>
                    <p>팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf 팔 운동중 하나입니다asdfsdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf</p>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>