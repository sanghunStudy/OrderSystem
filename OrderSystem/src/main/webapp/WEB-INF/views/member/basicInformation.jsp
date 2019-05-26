<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 기초정보 조사</title>
<style>
@import url('//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
/* Full Source: https://github.com/tamino-martinius/ui-snippets-radiobuttons/blob/master/src/index.css */
*{margin : 0; padding:0px;}
body {
background:#201d2e !IMPORTANT;
}
:root {
  --theme-light--color-bg: #f9fafa;
  --theme-light--color-font: #42494f;
  --theme-light--color-border: rgba(0, 0, 0, .08627);
  --theme-light--color-default: #fff;
  --theme-light--color-primary: #6bbaf0;
  --theme-light--color-secondary: #89949b;
  --theme-light--color-success: #a0bf69;
  --theme-light--color-danger: #cc6164;
  --theme-light--color-line-default: #42494f;
  --theme-light--color-line-primary: #fff;
  --theme-light--color-line-secondary: #fff;
  --theme-light--color-line-success: #fff;
  --theme-light--color-line-danger: #fff;
  --theme-dark--color-bg: #42494f;
  --theme-dark--color-font: #f9fafa;
  --theme-dark--color-border: hsla(0, 0%, 100%, .08627);
  --theme-dark--color-default: #3a3f47;
  --theme-dark--color-primary: #6bbaf0;
  --theme-dark--color-primary: var(--theme-light--color-primary);
  --theme-dark--color-secondary: #22292f;
  --theme-dark--color-success: #a0bf69;
  --theme-dark--color-success: var(--theme-light--color-success);
  --theme-dark--color-danger: #cc6164;
  --theme-dark--color-danger: var(--theme-light--color-danger);
  --theme-dark--color-line-default: #f9fafa;
  --theme-dark--color-line-primary: #fff;
  --theme-dark--color-line-secondary: #fff;
  --theme-dark--color-line-success: #fff;
  --theme-dark--color-line-danger: #fff;
  --input-color: #fff;
  --input-color: var(--theme-light--color-default);
  --input-color--bg: #f9fafa;
  --input-color--bg: var(--theme-light--color-bg);
  --input-color--font: #42494f;
  --input-color--font: var(--theme-light--color-font);
  --input-color--border: rgba(0, 0, 0, .08627);
  --input-color--border: var(--theme-light--color-border);
  --input-size--large: 13px;
  --input-size--default: 11px;
  --input-size--small: 9px;
  --input-size--xsmall: 8px;
  --input-size: 11px;
  --input-size: var(--input-size--default)
}

.theme-light {
  --input-color: #fff;
  --input-color: var(--theme-light--color-default);
  --input-color--line: #42494f;
  --input-color--line: var(--theme-light--color-line-default);
  --input-color--default: #fff;
  --input-color--default: var(--theme-light--color-default);
  --input-color--bg: #f9fafa;
  --input-color--bg: var(--theme-light--color-bg);
  --input-color--font: #42494f;
  --input-color--font: var(--theme-light--color-font);
  --input-color--border: rgba(0, 0, 0, .08627);
  --input-color--border: var(--theme-light--color-border)
}

.theme-light .input--primary {
  --input-color: #6bbaf0;
  --input-color: var(--theme-light--color-primary);
  --input-color--line: #fff;
  --input-color--line: var(--theme-light--color-line-primary)
}

.theme-light .input--secondary {
  --input-color: #89949b;
  --input-color: var(--theme-light--color-secondary);
  --input-color--line: #fff;
  --input-color--line: var(--theme-light--color-line-secondary)
}

.theme-light .input--success {
  --input-color: #a0bf69;
  --input-color: var(--theme-light--color-success);
  --input-color--line: #fff;
  --input-color--line: var(--theme-light--color-line-success)
}

.theme-light .input--danger {
  --input-color: #cc6164;
  --input-color: var(--theme-light--color-danger);
  --input-color--line: #fff;
  --input-color--line: var(--theme-light--color-line-danger)
}
.input {
  font-size: 11px;
  font-size: var(--input-size--default);
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
  color: #42494f;
  color: var(--input-color--font);
  --input-size: 11px;
  --input-size: var(--input-size--default);
      padding: 8px 0 8px 0;
}

.input.input--large {
  --input-size: 13px;
  --input-size: var(--input-size--large)
}

.input.input--small {
  --input-size: 9px;
  --input-size: var(--input-size--small)
}

.input.input--xsmall {
  --input-size: 8px;
  --input-size: var(--input-size--xsmall)
}

.input label {
  text-align: left
}

.input__box {
  display: inline-block;
  width: 11px;
  width: var(--input-size);
  height: 11px;
  height: var(--input-size);
  margin-right: 7px;
  margin-right: calc(18px - var(--input-size));
  background-color: var(--input-color--default);
  border-color: rgba(0, 0, 0, .08627);
  border: 1px solid var(--input-color--border);
  vertical-align: -2.75px;
  vertical-align: calc((var(--input-size--default) - var(--input-size)) / 2 - var(--input-size--default) / 4);
  -webkit-transition: background-color .1s ease;
  transition: background-color .1s ease;
  -webkit-transition-delay: .05s;
  transition-delay: .05s
}

@-webkit-keyframes wobble {
  0% {
    -webkit-transform: scale(1) rotate(0deg);
    transform: scale(1) rotate(0deg)
  }
  40% {
    -webkit-transform: scale(1.1, .9) rotate(5deg);
    transform: scale(1.1, .9) rotate(5deg)
  }
  70% {
    -webkit-transform: scale(.9, 1.1) rotate(-3deg);
    transform: scale(.9, 1.1) rotate(-3deg)
  }
  80% {
    -webkit-transform: scale(1.05, .95) rotate(1deg);
    transform: scale(1.05, .95) rotate(1deg)
  }
  to {
    -webkit-transform: scale(1) rotate(0deg);
    transform: scale(1) rotate(0deg)
  }
}

@keyframes wobble {
  0% {
    -webkit-transform: scale(1) rotate(0deg);
    transform: scale(1) rotate(0deg)
  }
  40% {
    -webkit-transform: scale(1.1, .9) rotate(5deg);
    transform: scale(1.1, .9) rotate(5deg)
  }
  70% {
    -webkit-transform: scale(.9, 1.1) rotate(-3deg);
    transform: scale(.9, 1.1) rotate(-3deg)
  }
  80% {
    -webkit-transform: scale(1.05, .95) rotate(1deg);
    transform: scale(1.05, .95) rotate(1deg)
  }
  to {
    -webkit-transform: scale(1) rotate(0deg);
    transform: scale(1) rotate(0deg)
  }
}

.preload * {
  -webkit-animation-duration: 0s !important;
  animation-duration: 0s !important
}

.input--radio {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none
}

.input--radio input {
  display: none
}

.input--radio .input__box {
  border-radius: 11px;
  border-radius: var(--input-size);
  opacity: .9;
  position: relative;
  overflow: hidden
}

.input--radio .input__box:after,
.input--radio .input__box:before {
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  -webkit-transform-origin: 38% 38%;
  transform-origin: 38% 38%;
  -webkit-transform: scale(0);
  transform: scale(0);
  width: 11px;
  width: var(--input-size);
  height: 11px;
  height: var(--input-size);
  border: 1px solid transparent;
  border-radius: 11px;
  border-radius: var(--input-size);
  -webkit-transition: transform .2s ease;
  transition: transform .2s ease
}

.input--radio .input__box:before {
  -webkit-transition-delay: .2s;
  transition-delay: .2s;
  background-color: #fff;
  background-color: var(--input-color)
}

.input--radio .input__box:after {
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
  background-color: var(--input-color--line)
}

.input--radio label {
  cursor: pointer
}

.input--radio label:hover .input__box {
  opacity: 1
}

.input--radio input:checked+.input__box {
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
  -webkit-animation-name: wobble;
  animation-name: wobble;
  -webkit-animation-duration: .3s;
  animation-duration: .3s;
  -webkit-animation-timing-function: ease;
  animation-timing-function: ease
}

.input--radio input:checked+.input__box:before {
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
  -webkit-transform: scale(1.1);
  transform: scale(1.1)
}

.input--radio input:checked+.input__box:after {
  -webkit-transition-delay: .2s;
  transition-delay: .2s;
  -webkit-transform: scale(.33);
  transform: scale(.33)
}

.input--radio input:disabled+.input__box,
.input--radio input:disabled+.input__box+span {
  opacity: .5
}

/*sh*/
/* .center input{ */
/* 	border:none; */
/* 	border-bottom: 1px solid black; */
/* } */
body,
html {
  padding: 0;
  margin: 0
}

article {
     font-family: Gotham Rounded SSm A, Gotham Rounded SSm B, Gotham Rounded A, Gotham Rounded B, proxima-nova-soft, Verdana, Geneva, sans-serif;
    /* color: #42494f; */
    /* color: var(--input-color--font); */
    /* background: #f9fafa; */
    /* background: var(--input-color--bg); */
    /* display: -webkit-box; */
    /* display: flex; */
    /* -webkit-box-align: center; */
    /* -ms-flex-align: center; */
    /* align-items: center; */
    /* -webkit-box-pack: center; */
    /* -ms-flex-pack: center; */
    /* justify-content: center; */
    /* width: 50%; */
    /* float: left; */
    text-align: left;

}


article span {
  display: inline-block;
  width: 100px
}


#bIContainer{
	background:#201d2e;
	color:white;
	width:1024px;
	margin: 0 auto;
	padding : 70px 0 0 17px;
}
.row {
	padding: 0px 0 15px 0
}
.row p {
	margin-bottom : 10px;
}
#row_p {
	font-size: 22pt;
	font-weight: 760;
}
#row_Explanation {
	font-size :12pt;
}
.center input{ 
 	border:none; 
 	border: 1px solid white;
 	background: none;
 	color:white;
 } 
 .input_value {
 	margin-top:15px;
 }
.center span {
	color : white;
}



/* 성별 아이콘 radio */
 input[name='sex'] {
	 -webkit-appearance: none;
	 -moz-appearance: none;
	 -o-appearance: none;
	 -ms-appearance: none;
	 appearance: none;
	 outline: none;
}
 input[name='sex']:after {
	 font-family: 'FontAwesome';
	 display: inline-block;
	 text-align: center;
	 font-size: 80px;
	 content: attr(data-icon);
	 padding: 20px 20px;
	 border-radius: 15px;
	 color: rgba(0,0,0,0.4);
	 transition: box-shadow 1s, color 1s;
}
 input[name='sex']:checked:after {
	 box-shadow: 2px 2px 14px rgba(0,0,0,0.4);
	 color: rgba(255,255,255,0.6);
}
 
</style>

<script>
//See https://github.com/tamino-martinius/ui-snippets-radiobuttons for Source Files build with webpack
//See https://github.com/tamino-martinius/ui-snippets-template for Snippet Template

const $inputs = document.getElementsByClassName('input');
for (let inputIndex = $inputs.length - 1; inputIndex >= 0; inputIndex--) {
const $input = $inputs[inputIndex];
// ...
}
const $radiobuttons = document.getElementsByClassName('input--radio');
for (let radioIndex = $radiobuttons.length - 1; radioIndex >= 0; radioIndex--) {
const $radio = $radiobuttons[radioIndex];
// ...
}
setTimeout(() => { /* TODO: prevent this timeout */
const $preloadElements = document.getElementsByClassName('preload');
for (let preloadIndex = $preloadElements.length - 1; preloadIndex >= 0; preloadIndex--) {
 const $preload = $preloadElements[preloadIndex];
 $preload.classList.remove('preload');
}
}, 500);

</script>
</head>
<jsp:include page="../gnb/head.jsp" flush="true" />
<body>

<div id="bIContainer">
	<form action="basicInformation" method="post">
		<article class="theme-light preload">
			<div class="center">
				<div class="row">
					<P id="row_p">기초 정보 조사</P>
					<P id="row_Explanation">본 설문서는 TRAINER BOT에서 여러가지 피브백, 원활한 회원관리 운영에 대한 중요한<br /> 자료이오니 성심껏 작성해 주시기 바랍니다. </P>
				</div>
				<div class="row">
					<p>나 이</p>
					<div>	
						<input type="number" name="age" min="0" class="input_value">
					</div>
				</div>
				<div class="row">
					<p>성 별</p>
<!-- 					<div  class="input input--radio"> -->
<!-- 						<label> -->
<!-- 							<input type="radio" name="sex" value="남" checked> -->
<!-- 							<span class="input__box"></span> -->
<!-- 			          		<span>남</span> -->
<!-- 		          		</label> -->
<!-- 					</div> -->
<!-- 					<div  class="input input--radio"> -->
<!-- 						<label> -->
<!-- 							<input type="radio" name="sex" value="여"> -->
<!-- 							<span class="input__box"></span> -->
<!-- 			          		<span>여</span> -->
<!-- 		          		</label> -->
<!-- 					</div> -->
					<input type="radio" name="sex" value="f" data-icon='' />
					<input type="radio" name="sex" value="m" data-icon='' />
				</div>
				<div class="row">
					<p>키</p>
					<input type="number" name="height" min="0"  class="input_value">
				</div>
				<div class="row">
					<p>몸무게</p>
					<input type="number" name="weight" min="0"  class="input_value">
				</div>
				<div class="row">
					<p>일주일에 술을 얼마나 드시나요?</p>
					<div class="input input--radio input--primary">
						<label>
							<input type="radio" name="drinking" value="거의 마시지 않는다." checked>
							<span class="input__box"></span>
			          		<span>거의 마시지 않는다.</span>
						</label>
					</div>
					<div class="input input--radio input--primary">
						<label>
							<input type="radio" name="drinking" value="1~3회">
							<span class="input__box"></span>
			          		<span>1~3회</span>
						</label>
					</div>
					<div class="input input--radio input--primary">
						<label>
							<input type="radio" name="drinking" value="4~6회">
							<span class="input__box"></span>
			          		<span>4~6회</span>
						</label>
					</div>
					<div class="input input--radio input--primary">
						<label>
							<input type="radio" name="drinking" value="그 이상">
							<span class="input__box"></span>
			          		<span>그 이상</span>
						</label>
					</div>
				</div>
				<div class="row">
					<p>일주일에 몇 번 운동을 하시나요?</p>
					<div class="input input--radio input--secondary">
				       <label>
						  <input type="radio" name="frequency" value="거의 하지 않는다." checked>
				          <span class="input__box"></span>
				          <span>거의 하지 않는다.</span>
				        </label>
				      </div>
					<div class="input input--radio input--secondary">
				       <label>
						 <input type="radio" name="frequency" value="1~3회">
				          <span class="input__box"></span>
				          <span>1~3회</span>
				        </label>
				      </div>
					<div class="input input--radio input--secondary">
				       <label>
						  <input type="radio" name="frequency" value="4~6회">
				          <span class="input__box"></span>
				          <span>4~6회</span>
				        </label>
				      </div>
					<div class="input input--radio input--secondary">
				       <label>
						  <input type="radio" name="frequency" value="그 이상">
				          <span class="input__box"></span>
				          <span>그 이상</span>
				        </label>
				      </div>
				</div>
				<div class="row">
					<p>운동을 통하여 얻고싶은 것이 무엇인가요?</p>
					 <div class="input input--radio input--success">
				        <label>
				          <input type="radio" name="purpose" value="다이어트" checked>
				          <span class="input__box"></span>
				          <span>다이어트</span>
				        </label>
				      </div>
					 <div class="input input--radio input--success">
				        <label>
				          <input type="radio" name="purpose" value="근력증가">
				          <span class="input__box"></span>
				          <span>근력증가</span>
				        </label>
				      </div>
				       <div class="input input--radio input--success">
				        <label>
				          <input type="radio" name="purpose" value="근육량증가">
				          <span class="input__box"></span>
				          <span>근육량증가</span>
				        </label>
				      </div>
				       <div class="input input--radio input--success">
				        <label>
				          <input type="radio" name="purpose" value="건강">
				          <span class="input__box"></span>
				          <span>건강</span>
				        </label>
				      </div>	
				</div>
				<div class="row">
					<p>어떤 직종에 종사하시나요?</p>
					<div class="input input--radio input--danger">
				        <label>
				          <input type="radio" name="job" value="활동량이 거의 없는 직업" checked>
				          <span class="input__box"></span>
				          <span>활동량이 거의 없는 직업</span>
				        </label>
			     	 </div>
					<div class="input input--radio input--danger">
				        <label>
				          <input type="radio" name="job" value="활동량이 많은 직업">
				          <span class="input__box"></span>
				          <span>활동량이 많은 직업</span>
				        </label>
			     	 </div>
				</div>
				<div class="row">
					<p>기타 참고사향을 적어주세요</p>
					<span><textarea rows="5" cols="40" name="dictum"></textarea></span>
				</div>
			</div>
		</article>
		<button>작성완료</button>					
	</form>
</div>
</body>
</html>