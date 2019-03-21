<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동일지</title>
<link href='${pageContext.request.contextPath}/resources/js/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/js/packages/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/js/packages/timegrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/packages/timegrid/main.js'></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script>






  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      defaultDate: '2019-03-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        	//prompt에 제목을 짓고 확인을 누르면 운동일지에 관한 내용을 작성하는 모달창 생성.
          modalPop();
        }
        calendar.unselect()
      },
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
//         {
//           title: 'All Day Event',
//           start: '2019-03-01'
//         },
//         {
//           title: 'Long Event',
//           start: '2019-03-07',
//           end: '2019-03-10'
//         },
//         {
//           groupId: 999,
//           title: 'Repeating Event',
//           start: '2019-03-09T16:00:00'
//         },
//         {
//           groupId: 999,
//           title: 'Repeating Event',
//           start: '2019-03-16T16:00:00'
//         },
//         {
//           title: 'Conference',
//           start: '2019-03-11',
//           end: '2019-03-13'
//         },
//         {
//           title: 'Meeting',
//           start: '2019-03-12T10:30:00',
//           end: '2019-03-12T12:30:00'
//         },
//         {
//           title: 'Lunch',
//           start: '2019-03-12T12:00:00'
//         },
//         {
//           title: 'Meeting',
//           start: '2019-03-12T14:30:00'
//         },
//         {
//           title: 'Happy Hour',
//           start: '2019-03-12T17:30:00'
//         },
//         {
//           title: 'Dinner',
//           start: '2019-03-12T20:00:00'
//         },
//         {
//           title: 'Birthday Party',
//           start: '2019-03-13T07:00:00'
//         },
//         {
//           title: 'Click for Google',
//           url: 'http://google.com/',
//           start: '2019-03-28'
//         }
      ]
    });

    calendar.render();
  });

//   document.querySelector('.fc-content') = function deleteItem(e){
// 	 alert(e);
// 	 console.log(e);	 
// // 	  var target = e.parentNode.getAttribute('target');
// // 	  var field = document.getElementById(target);
// // 	  document.getElementById('field').removeChild(field);
	  
//   }
  
  var sungwoon = document.getElementsByClassName('fc-content');
	
  
  
  function modalPop(){
	  
		//Get the modal
		  var modal = document.getElementById('myModal');
	
		  // Get the <span> element that closes the modal
		  var span = document.getElementsByClassName("close")[0];                                          
	
		  // When the user clicks on the button, open the modal 
		      modal.style.display = "block";

	
		  // When the user clicks on <span> (x), close the modal
 		  span.onclick = function() {
		      modal.style.display = "none";
 		  }
	
		  // When the user clicks anywhere outside of the modal, close it
		  window.onclick = function(event) {
		      if (event.target == modal) {
		          modal.style.display = "none";
		      }
		  }

}

//팝업
  
  
window.onload = function() {  
	//제목을 클릭하면 해당 태그의 클래스를 가져옴 
	//이거 클래스를 통해서 지워야됨.
	  document.body.addEventListener('click', function (e) {
		
		  if (e.target.classList.contains('fc-title')) {
			  e.target.className = 'fc-title selected';  
			  console.log(e.target.className);
			  
			  tagetDelete(e.target.className);
			  }
	},false);
	  
	  
	  
	 
}//window.onload

  
  function tagetDelete(el){

// 	  alert(el);
// 	  var target = el.parentNode.getAttribute('target');
// 	  alert(target);
	  
// 	  var field = document.getElementById(target);
// 	  document.getElementById('field').removeChild(field);
  }
  
  
  
</script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }


 /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto;  /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
         /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

</style>
</head>
<body>
	<div id='calendar'></div>
	
	 <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
       <form>
     <div>
       	<label>
       	운동종류
       	</label>
       		<input type="text">
	</div>
	<div>
		<label>
		횟수
		</label>
       		<input type="text">
    </div>
    <div>  
       	<label>
       	무게
       	</label>
       		<input type="text">
     </div>
       </form>
      </div>
 
    </div>
</body>
</html>