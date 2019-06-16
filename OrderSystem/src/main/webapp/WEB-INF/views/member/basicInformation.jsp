<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 기초정보 조사</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
@import url('//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
*{
  box-sizing:border-box;
}
body{
  background: #000;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form-container{
  background: white;
  max-width: 700px;
  width: 100%;
  padding: 100px;
  border-radius: 3px;
}
.buttons-container{
  margin-top: 3em;
}

button{
  -webkit-appearance: none;
  padding: 1em 2em;
  width: 140px;
  text-align: center;
}
.btn-white{
    background: white;
}
.btn-submit{
    background: black;
    color: white;
}

.float-right{
  float: right;
}

.radio-container{
  display: inline-block;
}
input[type="radio"]{
opacity: 0;
  height: 0;
  width: 0;
}

input[type="radio"] ~ label {
  opacity: 1;
  border: 1px solid grey;
  padding: 10px 20px;
  background: white;
  color: black;
}

input[type="radio"]:active + label {
  opacity: 1;
  border: 1px solid grey;
  background: black;
  color: white;
}

input[type="radio"]:checked + label {
  opacity: 1;
  border: 1px solid grey;
  background: black;
  color: white;
}
.error-message{
  color: red;
  margin-top: 20px;
  display: none;
}
input[type='text'],input[type="email"]{
  border: 1px solid black;
  padding: 10px;
  width: 100%;
}
.btn-submit{
  display: none;
}
.btn-submit:disabled{
  background: #333;
  color: #777;
}
.slide-container{
  transition: ease-in .3s all;
  position: relative;
  top: 0;
}

form#questionnaire-form{
  height: 200px;
  width: 100%;
  overflow: hidden;
}
.slide{
  height: 200px;
  width: 100%;
}
.slide h2{
  margin-top: 0;
}
}
.form-container button,.form-container label{
  cursor: pointer;
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
window.onload = function(){
var next = document.querySelector('.btn-next');
var previous = document.querySelector('.btn-previous');
var form = document.querySelector('.slide-container');
var slides = document.querySelectorAll(".slide");
var slideNumber = 0;
var url = "ENTER GOOGLE SHEET URL HERE";
var $form = $('form');

next.addEventListener('click', function(){
  changePosition("next");
});

previous.addEventListener('click', function(){
  changePosition("previous");
});

function changePosition(type){
  if(type=="next"){
    var form_valid = false;
    form_valid = validateForm(slideNumber);
    if(form_valid){
      hideError(slideNumber);
      slideNumber += 1;  
    }else{
      showError(slideNumber);
    }
  }else{
    if(slideNumber == 0){
    }else{
      slideNumber -= 1;
    }
  }
  if(slideNumber < slides.length){
    pos = slideNumber * -200;  
    form.style.top = pos +"px";
    document.querySelector('.btn-submit').style.display = "none";
    document.querySelector('.btn-next').style.display = "inline-block";
  }
  if(slideNumber == slides.length-1){
    document.querySelector('.btn-next').style.display = "none";
    document.querySelector('.btn-submit').style.display = "inline-block";
  }
}

function validateForm(slideNumber){
  var form_valid = false;
  var inputs = slides[slideNumber].querySelectorAll("input");
  console.log(inputs);
  if(inputs.length !== 0){
    if(inputs[0].type === "radio"){
      inputs.forEach(function(input){
        if(input.checked){
          form_valid = true;
        }
      });
    }
    if(inputs[0].type === "number" && inputs[0].value !== ""){
        form_valid = true;
    }
    
    if(inputs[0].type === "text" && inputs[0].value !== ""){
      form_valid = true;
    }
    
    if(inputs[0].type === "email" && inputs[0].value !== ""){
      form_valid = validateEmail(inputs[0].value);
    }
    
  }else{
    form_valid = true;
  }
    
  return form_valid;
}

function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function showError(slideNumber){
  var error = slides[slideNumber].querySelector(".error-message");
  if(error) error.style.display = "block";
}

function hideError(slideNumber){
  var error = slides[slideNumber].querySelector(".error-message");
  if(error) error.style.display = "none";
}

var last_input = document.getElementById('last_input');
last_input.onkeyup = () =>{
  console.log(last_input.value);
  console.log(document.querySelector('.btn-submit'));
  if(last_input.value !== ""){
    document.querySelector('.btn-submit').disabled = false;  
  }else{
    document.querySelector('.btn-submit').disabled = true;  
  }  
}

  var submit = document.querySelector('.btn-submit');
  submit.addEventListener('click', function(e){
    e.preventDefault();
    var jqxhr = $.ajax({
      url: url,
      method: "GET",
      dataType: "json",
      data: $form.serializeArray(),
      success: function(){
        var container = document.querySelector('.form-container');
        
        container.style.top = "0px";
        container.innerHTML = "<h2>Thank you! We have received your entry and we'll get back to you on the email you entered.";
        
      }
    })
  })
}
</script>
</head>
<%-- <jsp:include page="../gnb/head.jsp" flush="true" /> --%>
<%-- <%@ include file="../gnb/sidebar.jsp"%> --%>
<body>
<div class="form-container cf-form">
  <form id="questionnaire-form">
    <div class="slide-container">
      <div class="slide">
        <h2> 당신의 나이를 입력해주세요...! </h2>
        <div class="radio-container">
        	<input type="number" id="match_1" name="age" min="0">
        </div>
<!--         <div class="radio-container"> -->
<!--           <input type="radio" id="match_1" name="num_students" value="yes"> -->
<!--           <label for="match_1"> Yes</label> -->
<!--         </div> -->
<!--         <div class="radio-container"> -->
<!--           <input type="radio" id="match_2" name="num_students" value="no">  -->
<!--           <label for="match_2"> No</label> -->
<!--         </div> -->
        <div class="error-message"> Please Select an Answer </div>
      </div>
      <div class="slide">
        <h2>당신의 성별을 선택 해주세요..!</h2>
<!--         <div class="radio-container"> -->
<!-- 			<input type="radio" name="sex" id="q2_match_1" value="f" data-icon='' /> -->
<!-- 		</div> -->
<!-- 		<div class="radio-container"> -->
<!-- 			<input type="radio" name="sex" id="q2_match_2" value="m" data-icon='' /> -->
<!--         </div> -->
        <div class="radio-container">
          <input type="radio" id="q2_match_1" name="recital_year" value="yes">
          <label for="q2_match_1"> Yes</label>
        </div>
        <div class="radio-container">
          <input type="radio" id="q2_match_2" name="recital_year" value="no"> 
          <label for="q2_match_2"> No</label>
        </div>
        <div class="error-message"> Please Select an Answer </div>
      </div>
      <div class="slide">
        <h2>당신의 신장을 입력해주세요..! </h2>
			<div class="radio-container">
				<input type="number" id="q3_match_1" name="height" min="0"  class="input_value">
			</div>
<!--         <div class="radio-container"> -->
<!--           <input type="radio" id="q3_match_1" name="recorded" value="yes"> -->
<!--           <label for="q3_match_1"> Yes</label> -->
<!--         </div> -->
<!--         <div class="radio-container"> -->
<!--           <input type="radio" id="q3_match_2" name="recorded" value="no">  -->
<!--           <label for="q3_match_2"> No</label> -->
<!--         </div> -->
        <div class="error-message"> Please Select an Answer </div>
      </div>
      <div class="slide">
        <h2>당신의 체중을 입력해주세요..!</h2>
        	<div class="radio-container">
        		<input type="number" name="weight" min="0"  class="input_value">
      		</div>
      	<div class="error-message"> Please Select an Answer </div>
      </div>
      <div class="slide">
        <h2>일주일에 술을 얼마나 드시나요? </h2>
        <div class="radio-container">
        	<input type="radio" id="drinkingMatch" name="drinking" value="거의 마시지 않는다." checked>
        	<label for="drinkingMatch">거의 마시지 않는다.</label>
        </div>
        <div class="radio-container">
        	<input type="radio" id="drinkingMatch1" name="drinking" value="1~3회">
        	<label for="drinkingMatch1">1~3회</label>
        </div>
        <div class="radio-container">
     		<input type="radio" id="drinkingMatch2" name="drinking" value="4~6회">
        	<label for="drinkingMatch2">4~6회</label>
        </div>
        <div class="radio-container">
     		<input type="radio" id="drinkingMatch3" name="drinking" value="그 이상">
        	<label for="drinkingMatch3">그 이상</label>
        </div>
<!--         <input type="text" name="lead_name" placeholder="Ryan" id="last_input"> -->
        <div class="error-message"> Please fill in your name </div>
      </div>
      <div class="slide">
        <h2>일주일에 몇 번 운동을 하시나요?</h2>
        <div class="radio-container">
			<input type="radio" id="frequency" name="frequency" value="거의 하지 않는다." checked>
        	<label for="frequency">거의 하지 않는다.</label>
        </div>
        <div class="radio-container">
			<input type="radio" id="frequency" name="frequency" value="거의 하지 않는다." checked>
        	<label for="frequency">거의 하지 않는다.</label>
        </div>
<!--         <input type="email" name="lead_email" placeholder="ryan@envoypictures.com" id="last_input"> -->
        <div class="error-message"> Please fill in your email </div>
      </div>
      <div class="slide">
        <h2>What is your cell phone number? </h2>
        <input type="text" name="phone" placeholder="+000000000" id="last_input">
        <div class="error-message"> Please fill in your phone number </div>
      </div>
      <div class="slide">
        <h2>What is the best day and time to call? </h2>
        <input type="text" name="time_day" placeholder="9:00am MWF" id="last_input">
        <div class="error-message"> Please fill in the best time and day to contact you </div>
      </div>
    </div>
  </form>
  <div class="buttons-container">
    <button class="btn-white btn-previous">Previous</button>
    <button class="btn-white btn-next">Next</button>
    <button class="float-right btn-submit" disabled>Submit</button>
  </div>
</div>

</body>
</html>