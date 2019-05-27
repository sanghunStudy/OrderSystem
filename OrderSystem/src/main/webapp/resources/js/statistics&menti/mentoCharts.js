
//그라디언트 생성기
function gradientGenerator(color,ctx) {
		if(ctx.canvas.id == 'line-chart-weight')
			var gradient = ctx.createLinearGradient(0, 0, 50, 275);
		else 	
			var gradient = ctx.createLinearGradient(0, 0, 25, 165);
		
	 var half = color.replace(color.substring(color.lastIndexOf(',')),',0.5)');
	 var quarter = color.replace(color.substring(color.lastIndexOf(',')),',0.25)');
	 var one_eights = color.replace(color.substring(color.lastIndexOf(',')),',0.125)');
	 var zero = color.replace(color.substring(color.lastIndexOf(',')),',0)');
	 
	 gradient.addColorStop(0, half);
	 gradient.addColorStop(0.3, quarter);
	 gradient.addColorStop(0.75, one_eights);
	 gradient.addColorStop(1, zero);

	 
	 return gradient;
	 
}


$(function() {
	
	var exerToday = moment().add(0,'day'),exerYesterday,exerTomorrow,
		foodToday = moment().add(0,'day'),foodYesterday,foodTomorrow;
	

//	var ctxDead = document.getElementById('line-chart-daed').getContext("2d");
//	var ctxSquat = document.getElementById('line-chart-squat').getContext("2d");
//	var ctxBench = document.getElementById('line-chart-bench').getContext("2d");
//	var ctxWeight = document.getElementById('line-chart-weight').getContext("2d");
	
	/* sass 느낌의 색상변수*/
	var skyblue = 'rgba(27,138,248,1)';
	var brightPink = 'rgba(225,78,202,1)';
	var emerald = 'rgba(0,242,195,1)';
	var purple = 'rgba(139,103,224,1)';	
//	var skyblueGrd = gradientGenerator(skyblue,ctxDead);
//	var brightPinkGrd = gradientGenerator(brightPink,ctxSquat);
//	var emeraldGrd = gradientGenerator(emerald,ctxBench);
//	var purpleGrd = gradientGenerator(purple,ctxWeight);
	
	


	var ranking = new Chart(document.getElementById("line-chart-ranking"), {
		  type: 'line',
		  data: {
		    labels: ["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"],
		    datasets: [{ 
		        data:[23,20,35,34,27,19,14,15,16,20],
		        lineTension:0,
		        label: "순위",
		        borderColor: '#f99204',
		        pointBackgroundColor:  "#f99204",
//		        pointBackgroundColor:  "#3e95cd",
//		        backgroundColor:"#3e95cd",
		        fill: true
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '나의 순위 변화',
		      fontColor:'#fff',
		      fontSize:16,
		      fontStyle: 'Noto Sans KR'
		     
		    },
		    hover: {
			      mode:'nearest',
			      intersect:true
		    },
			 tooltips: {
			          mode: 'index',
			          intersect: false,
			}
		  }
		   
		});
	

	
	new Chart(document.getElementById("line-chart-mentiWegiht"), {
		  type: 'line',
		  data: {
		    labels: ["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"],
		    datasets: [{ 
		        data: [72,73,73,75,78,70,85,85,94,97],
		        label: "상의준",
		        borderColor: brightPink,
		        pointBackgroundColor:  "#e14eca",
//		        backgroundColor:brightPink,
		        fill: false
		      },
		      {
		    	  data:[62,64.68,66,69,70,68,64,62,61,63],
		    	  label:'윤성운',
		    	  borderColor:emerald,
		    	  pointBackgroundColor:  emerald,
		    	  fill: false
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '멘티 체중 변화 (in Kg)',
		      fontColor:'#fff',
		      fontSize:16,
		      fontStyle: 'Noto Sans KR'
		    }
		  }
		});
	
	

	
	
		$('.multi').each(function() {
			var elem = $(this);
			var width = 1;
			var id = setInterval(frame, 50);
			var end = $(this).attr('data-code');
			var kcal = elem.parent().prev().prev();
			
			console.log(end);

			function frame() {
				if (width >= 35) {
					clearInterval(id);
				} else {
					width++;
					elem.css('width',width + '%');
					elem.parent().prev().html(width + '%');
				}
			}
		});
		
		/*운동관리,식단관리 모달창 이벤트*/
		
		var foodModal = document.getElementById('food-modal');
		var exerModal = document.getElementById('exer-modal');
		var todayInfo = [];
		var arr= ['풀업','데드리프트','플랫벤치프레스','스쿼트','인클라인벤치프레스'];
				
		var modalClickEvent = {
				'food-modal-btn':function() {
					foodModal.style.display = "block";
				},
				'exer-modal-btn':function() {
					exerModal.style.display = "block";
					autocomplete(document.getElementById('ename'),arr);
				}
		}
			
		
		
		$('.performance').click(function(e) {
			var target = e.target || e.srcElement;

			if(modalClickEvent.hasOwnProperty(target.id)) {
				modalClickEvent[target.id].call();
			}			
			
		});
		
		
		$('.input-number-increment').click(function() {
			  var $input = $(this).parents('.input-number-group').find('.input-number');
			  var val = parseInt($input.val(), 10);
			  $input.val(val + 1);
			});

			$('.input-number-decrement').click(function() {
			  var $input = $(this).parents('.input-number-group').find('.input-number');
			  var val = parseInt($input.val(), 10);
			  $input.val(val - 1);
			})


		    
		
			
		
		var notModal = function () {			
			if(foodModal.style.display == 'block')
				return $('div').not('div.food-management');
			else if(exerModal.style.display == 'block')
				return $('div').not('div.exer-management');
		}
	

		// 모달창 닫기
		$(document).on('mousedown', notModal,
				function(e) {
					if (foodModal.style.display =='block') {
						if (!$(e.target).parents().hasClass('food-modal') && !$(e.target).hasClass('food-modal'))
							foodModal.style.display = 'none';
					}
					else if (exerModal.style.display =='block') {
						if (!$(e.target).parents().hasClass('exer-modal') && !$(e.target).hasClass('exer-modal'))
							exerModal.style.display = 'none';
					}


				});
				
		
		/*모달 contents*/
		$('.schedule-date').html(moment().format('L dddd'));
		
		/* 프락시 패턴를 이용한 이벤트 관리 */
		var dateClickEvent = {
		
			"exer_prev": function() {
				exerYesterday = moment(exerToday).add(-1, 'day');
				exerToday = exerYesterday;

				$('#exer_prev').next().html(exerToday.format('L dddd'));
			},
			"exer_next": function() {
			
				
				exerTomorrow = moment(exerToday).add(1, 'day');
				exerToday = exerTomorrow;

				$('#exer_next').prev().html(exerToday.format('L dddd'));
			
					for(var i in todayInfo) {
						if(todayInfo[i].date == exerToday.format('L dddd')) {
							alert(todayInfo[i].date == exerToday.format('L dddd'));
//							console.log("속성들  " + todayInfo[i].ename);
//							$('.ename').val(todayInfo[i].ename);
//							$('.details').val(todayInfo[i].details);
//							$('.parts').val(todayInfo[i].parts);
						}
					}
				
			
				var item = {
						'date':exerToday.format('L dddd'),
						'ename':$('.ename').val(),
						'details':$('.details').val(),
						'parts':$('.parts').val()
				}
				if(item.ename != '' && item.details != '' && item.parts !='' ) {
					todayInfo.push(item);
					alert(todayInfo[0].date == exerToday.format('L dddd'));
				}
				else
					alert('값이 비었어요.');
				console.log(todayInfo);
				$('form :input').val('');
			},
			"food_prev": function() {
				foodYesterday = moment(foodToday).add(-1, 'day');
				foodToday = foodYesterday;

				$('#food_prev').next().html(foodToday.format('L dddd'));
			},
			"food_next": function() {
				foodTomorrow = moment(foodToday).add(1, 'day');
				foodToday = foodTomorrow;

				$('#food_next').prev().html(foodToday.format('L dddd'));
			}
		}
		
		document.getElementById('modals').addEventListener('click',function(e) {
			var target = e.target || e.srcElement;
			
			
			if(dateClickEvent.hasOwnProperty(target.id)) {
				dateClickEvent[target.id].call();
			
			}
		});
		
				

});







function autocomplete(inp,arr) {
	inp.onclick = function(e) {}
	inp.addEventListener('click',function(e) {})
	var currentFocus;
	
	inp.addEventListener('input', function(e) {
		var a, b, i, val = this.value;
		
		
		closeAllLists();
		
		if(!val) {return false;}
		currentFocus = -1;
		
		a= document.createElement('div');
		a.id = this.id + "autocomplete-list";
		a.className = "autocomplete-items";
		
		this.parentNode.appendChild(a);
		
		for(i=0; i<arr.length; i++) {
			if(arr[i].substr(0,val.length).toUpperCase() == val.toUpperCase()) {
				b = document.createElement('div');
				b.innerHTML = "<strong>" + arr[i].substr(0,val.length) + "</strong>";
				b.innerHTML += arr[i].substr(val.length);
				b.innerHTML += '<img src="' + contextPath + '/resources/images/ExIntroduction/back/pull_up.jpg" width="50px" height="80px">';
				b.innerHTML += '<input type="hidden" value="' + arr[i] + '">';
				
					b.addEventListener('click',function (e) {
						inp.value = this.getElementsByTagName('input')[0].value;
						closeAllLists();
					});
				a.appendChild(b);	
			}
		}
	});
	
	inp.addEventListener('keydown',function(e) {
		var x = document.getElementById(this.id + "autocomplete-list");
		if (x) x = x.getElementsByTagName('div');
		if (e.keyCode == 40) {
			currentFocus++;
			addActive(x);
		}
		else if(e.keyCode == 38) {
			currentFocus--;
			addActive(x);
		}
		else if(e.keyCode == 13) {
			e.preventDefault;
			if(currentFocus > -1) {
				if (x) x[currentFocus].click();
			}
			
		}
		
	})
	function addActive(x) {
		if (!x) return false;
		removeActive(x);
		if( currentFocus >= x.length ) currentFocus = 0;
		if (currentFocus < 0 ) currentFocus = (x.length -1);
		x[currentFocus].classList.add('autocomplete-active');
	}
	function removeActive(x) {
		for(var i = 0; i < x.length; i++) {
			x[i].classList.remove('automoplete-active');
		}
	}
	function closeAllLists(element) {
		var x = document.getElementsByClassName('autocomplete-items');
		for ( var i = 0 ; i < x.length; i++) {
			if (element != x[i] && element != inp) {
				x[i].parentNode.removeChild(x[i]);
			}
		}
	}
	document.addEventListener("click", function (e) {
	    closeAllLists(e.target);
	});
}



