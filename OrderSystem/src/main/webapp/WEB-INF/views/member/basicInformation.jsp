<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 기초정보 조사</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/basicInformation.js"></script>
<link rel ="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/basicInformation.css"/>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<%@ include file="../gnb/sidebar.jsp"%>
<body id="bi-body">
<div class="form-container cf-form">
<div class="bi-title-box">
	<p id="bi-title">회원 기초정보 조사</p>
</div>
  <form id="questionnaire-form" action="basicInformation" method="post">
    <div class="slide-container">
      <div class="slide">
        <h3> 당신의 나이를 입력해주세요 </h3>
        <div class="radio-container">
        	<div class="group">
        	<input type="number" id="match_1" name="age" class="bi-age" min="0" required="required">
        	<span class="highlight"></span>
        	<span class="bar"></span>
        	<label class="bi-input-label">나이</label>
        	</div>
        </div>
        <div class="error-message">당신의 나이를 입력해주세요..!</div>
      </div>
      <div class="slide">
        <h3>당신의 성별을 선택 해주세요</h3>
	        <div class="radio-container">
				<input type="radio" name="sex" id="q2_match_1" value="f" data-icon='' />
			</div>
			<div class="radio-container">
				<input type="radio" name="sex" id="q2_match_2" value="m" data-icon='' />
	        </div>
        <div class="error-message">당신의 성별을 선택 해주세요..!</div>
      </div>
      <div class="slide">
        <h3>당신의 신장을 입력해주세요</h3>
			<div class="radio-container">
	        	<div class="group">
	        	<input type="number" id="q3_match_1" class="bi-height" name="height" min="0" placeholder="cm">
	        	<span class="highlight"></span>
	        	<span class="bar"></span>
	        	<label class="bi-input-label">신장</label>
	        	</div>
			</div>
        <div class="error-message">당신의 신장을 입력해주세요..!</div>
      </div>
      <div class="slide">
        <h3>당신의 체중을 입력해주세요</h3>
        	<div class="radio-container">
	        	<div class="group">
		        	<input type="number" class="bi-weight" name="weight" min="0" placeholder="kg">
		        	<span class="highlight"></span>
		        	<span class="bar"></span>
		        	<label class="bi-input-label">체중</label>
	        	</div>
      		</div>
      	<div class="error-message">당신의 체중을 입력해주세요..!</div>
      </div>
      <div class="slide">
        <h3>일주일에 술을 얼마나 드시나요 ?</h3>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="drinkingMatch" name="drinking" value="거의 마시지 않는다." checked>
        	<label for="drinkingMatch">0회</label>
        </div>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="drinkingMatch1" name="drinking" value="1~3회">
        	<label for="drinkingMatch1">1~3회</label>
        </div>
        <div class="radio-container">
     		<input type="radio" class="bi-text-input-box" id="drinkingMatch2" name="drinking" value="4~6회">
        	<label for="drinkingMatch2">4~6회</label>
        </div>
        <div class="radio-container">
     		<input type="radio" class="bi-text-input-box" id="drinkingMatch3" name="drinking" value="그 이상">
        	<label for="drinkingMatch3">그 이상</label>
        </div>
        <div class="error-message">음주 빈도를 선택해주세요..!!</div>
      </div>
      <div class="slide">
        <h3>일주일에 몇 번 운동을 하시나요 ?</h3>
        <div class="radio-container">
			<input type="radio" class="bi-text-input-box" id="frequency" name="frequency" value="거의 하지 않는다." checked>
        	<label for="frequency">0회</label>
        </div>
        <div class="radio-container">
			<input type="radio" class="bi-text-input-box" id="frequency1" name="frequency" value="1~3회">
        	<label for="frequency1">1~3회</label>
        </div>
        <div class="radio-container">
			<input type="radio" class="bi-text-input-box" id="frequency2" name="frequency" value="4~6회">
        	<label for="frequency2">4~6회</label>
        </div>
        <div class="radio-container">
			<input type="radio" class="bi-text-input-box" id="frequency3" name="frequency" value="그 이상">
        	<label for="frequency3">그 이상</label>
        </div>
        <div class="error-message">운동 빈도를 선택해주세요..!! </div>
      </div>
      <div class="slide">
        <h3>운동을 통하여 얻고싶은 것이 무엇인가요 ?</h3>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="purpose" name="purpose" value="다이어트" checked>
        	<label for="purpose">다이어트</label>
        </div>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="purpose1" name="purpose" value="근력증가">
        	<label for="purpose1">근력증가</label>
        </div>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="purpose2" name="purpose" value="근육량증가">
        	<label for="purpose2">근육량증가</label>
        </div>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="purpose3" name="purpose" value="건강">
        	<label for="purpose3">건강</label>
        </div>
        <div class="error-message">운동을 통해 얻고 싶은 효과를 선택해주세요..!! </div>
      </div>
      <div class="slide">
        <h3>어떤 직종에 종사하시나요 ?</h3>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="job" name="job" value="활동량이 거의 없는 직업" checked>
        	<label for="job">활동량이 거의 없는 직업</label>
        </div>
        <div class="radio-container">
        	<input type="radio" class="bi-text-input-box" id="job1" name="job" value="활동량이 많은 직업">
        	<label for="job1">활동량이 많은 직업</label>
        </div>
        <div class="error-message">어떤 직종에 종사하시는지 선택해주세요..!!</div>
      </div>
      <div class="slide">
      	<h3>설문에 응해주셔서 감사합니다. 마지막으로 하고싶은 말을 입력해주세요.</h3>
      	<div class="radio-container">
        	<div class="group">
	        	<input type="text" name="dictum" id="last_input">
	        	<span class="highlight"></span>
	        	<span class="bar"></span>
	        	<label class="bi-input-label">하고싶은 말</label>
        	</div>
      	</div>
      		<div class="error-message">하고싶은 말을 입력해주세요..!</div>
      </div>
    </div>
  </form>
  <div class="buttons-container">
<!--     <button class="btn-white btn-previous bI-btn">이전</button> -->
	<div class="icon btn-white btn-next">
	  <div class="arrow"></div>
	</div>
<!--     <button class="btn-white btn-next bI-btn">다음</button> -->
    <button class="float-right btn-submit bI-btn">Submit</button>
  </div>
  <div class="bi-footer">
  	<P>본 설문서는 TRAINER BOT에서 여러가지 피드백, 원활한 회원관리 운영에 대한 중요한<br /> 자료이오니 성심껏 작성해 주시기 바랍니다. </P>
  </div>
</div>

</body>
</html>