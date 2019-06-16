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

//previous.addEventListener('click', function(){
//  changePosition("previous");
//});

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
    $("#questionnaire-form").submit();
//    var jqxhr = $.ajax({
//      url: url,
//      method: "GET",
//      dataType: "json",
//      data: $form.serializeArray(),
//      success: function(){
//        var container = document.querySelector('.form-container');
//        
//        container.style.top = "0px";
//        container.innerHTML = "<h2>Thank you! We have received your entry and we'll get back to you on the email you entered.";
//        
//      }
//    })
  })
}