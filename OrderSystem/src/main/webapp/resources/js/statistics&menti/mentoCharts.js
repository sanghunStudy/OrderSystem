
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

/* 신청회원 list */
function applicantList() 
{
	$.ajax({
		type:'get',
		url:'/kopo/member/applicant',
		success:function(res) {

			var tr = '';
			if(res.length == 0) {
				tr +='<tr><td colspan="7">승인 대기중인 회원이 없습니다.</td></tr>';
			}
			else{
			$.each(res,function(key,value) {
				tr +='<tr><td class="applicant">' + value.username + '</td>';
				tr +='<td class="apply-date">' + value.applyDate + '</td>';
				tr +='<td>' + value.height + 'cm   ' + value.weights + 'kg</td>';
				tr += '<td>' + value.goal + '</td>';
				tr += '<td colspan="2" class="action"><div class="agree btn-t" id="agree">Agree</div>';
				tr += '<div class="disagree btn-t" id="disagree">disagree</div></td>';
				tr += '</tr>'
			});
			}
			$('.applicant-list').html(tr);
		}
	})
}

/* 내 멘티 리스트 */
 function mentiList() {
	 $.ajax({ 
		 url:'/kopo/member/myMenti',
		 type:'GET',
	 	 success:function(res) {
	 		var tr = '';
	 		if(res.length > 0){
	 		for (var value of res) {
	 			tr += '<tr>';
	 			tr += '<td class="my-menti">';
	 			tr += '<span class="target-username">'+ value.username + '</span>';
	 			tr += '<span class="hidden target-weights">'+value.weights+'</span>';
	 			tr += '<span class="hidden target-height">'+ value.height +'</span>';
	 			tr += '<span class="hidden target-goal">' + value.goal +'</span>';
	 			tr += '<span class="hidden target-etc">' + value.etc + '</span>';
	 			tr += '<span class="hidden target-eRequirement">' + value.eRequirement + '</span>';
	 			tr += '<span class="hidden target-eRequirement">'+ value.age +'</span>'
	 			tr +='</td>';
	 			tr += '<td><div class="progress-container-t">';
	 			tr += '<span id="value" class="progress-value-t" style="background-color: #272a3d">1%</span>';
	 			tr += '<div class="progress-bar-t"><div id="bar" class="progress-value-t multi" data-code="dbVal" style="width: 1%;"></div>'
	 			tr += '</div>';	
				tr += '</td>';
				tr += '<td><div class="planModal" id="exer-modal-btn">운동관리</div></td>';
				tr += '<td><div class="planModal" id="food-modal-btn">식단관리</div></td>';
				tr += '<td>2019.05.07</td>';
				tr += '<td><button class="chart-menti btn-collection menti-btn">';
				tr += '<span class="fas fa-chart-bar"></span><span>차트</span>';
				tr += '</button></td>';
				tr += '<td><button class="cancel-menti btn-collection menti-btn">';
				tr += '<span class="icon-cross"></span><span>해지</span>';
				tr += '</button></td>';		
				tr += '</tr>';
	 		}
	 		}
	 		else
	 			tr += '<tr><td colspan="7" style="text-align:center">멘토링중인 멘티가 없습니다.</td></tr>';
	 		
	 		$('.myMenti-list').html(tr);
	 		progressAnime();
	 	}
	 });
 }

 



$(function() {

	/* 멘티 승인or허가 버튼 이벤트 */
	var applicant;
	var targetWeights;
	var targetHeight;
	var targetGoal;
	var requiredEnergy;
	var agreeBtnEvent = {
			'agree':function(e) {
					
						$.ajax({
							/*
							 * data를 json 형태 그대로 넘기고 싶을때 아래 contentType 속성설정 후
							 * JSON.stringify해준 후 보내면 서버단에서 json형태 그대로 받음
							 */
						 // contentType:"application/json;charset=UTF-8",
							type:'post',
							url:'/kopo/member/permission',
							dataType:'json',
							data: {
								// "와 '를 서버단에서는 구분하여서 '로 설정하여 보내면 서버단에서는 인식을 하지
								// 못해 파라메터가 null값으로 나타남
								"username":applicant
							},
					
							success:function(data) {
								if(data == 1){
									alert('승인되었습니다.');
									applicantList();
									mentiList();
								}
								else
									alert('승인이 실패되었습니다. 나중에 다시 시도해 주세요.');
							}
						});
				},
			'disagree':function(e) {
								
							$.ajax({
								type:'POST',
								url:'/kopo/member/applicantDeny',
								dataType:"JSON",
								data:{
									"username":applicant
								},
								success:function(data) {
									if(data == 1) {
										alert(applicant + '님의 신청을 거부하였습니다.');
										applicantList();
									}
									else
										alert('오류가 발생하였습니다. 나중에 다시 시도해주세요.');
								}
						});
				}
	}
	
	
	$('.apply-list .applicant-list').on('click','.action',function(e) {
		var target = e.target || e.srcElement;
		
		if(agreeBtnEvent.hasOwnProperty(target.id)) {
			applicant = $(this).parents('tr').children('.applicant').text();
			agreeBtnEvent[target.id].call();
		}			
		
	});
	
	$('.performance').on('click','.cancel-menti',function(e) {
		e.preventDefault();
		var menti = $(this).parents('tr').children('.my-menti').text();
		var terminationCheck = confirm("정말로 " + menti + " 님과의 멘토링 관계를 해지하시겠습니까?");
		if(terminationCheck == true) {
		$.ajax({
			type:'POST',
			url:'/kopo/member/applicantDeny',
			dataType:"JSON",
			data:{
				"username":menti
			},
			success:function(data) {
				if(data == 1) {
					alert(menti + '님과 의 멘토링 관계를 해지하였습니다.');
					mentiList();
				}
				else
					alert('오류가 발생하였습니다. 나중에 다시 시도해주세요.');
			}
	});
		}
	})

	 /* modal 창 tab 이벤트 */
	    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
	        
	        var $target = $(e.target);
	        if ($target.parent().hasClass('disabled')) {
	        	alert('하단에 버튼을 이용해 주세요.');
	            return false;
	        }
	    });
	      
	    $(".next-step").click(function (e) {
	      
	        var $active = $('.wizard .nav-tabs li.active');
	    
	        $active.next().removeClass('disabled');
	        nextTab($active);
	  
	       if($active.hasClass('stepactive1')) {
	    	   setDuration();
	       }
	      
	        $('.wizard .nav-tabs li.active .connecting-line').css({"border-bottom-left-radius": 0, "border-top-left-radius": 0});
	       
	    });
	    $(".prev-step").click(function (e) {

	        var $active = $('.wizard .nav-tabs li.active');
	        prevTab($active);
	        
	        
	    });
	

	    $('.add-food').click(function (e) {
	    	$('form :input').val('');
	    	$('.ks-cboxtags>li>input[type="radio"]').prop("checked",false);
	    	$('.ks-cboxtags>li>input[type="checkbox"]').prop("checked",false);
	    	
	    	
	    });
	
	
	var exerToday = moment().add(0,'day'),exerYesterday,exerTomorrow,
		foodToday = moment().add(0,'day'),foodYesterday,foodTomorrow;
	

// var ctxDead = document.getElementById('line-chart-daed').getContext("2d");
// var ctxSquat = document.getElementById('line-chart-squat').getContext("2d");
// var ctxBench = document.getElementById('line-chart-bench').getContext("2d");
// var ctxWeight =
// document.getElementById('line-chart-weight').getContext("2d");
	
	/* sass 느낌의 색상변수 */
	var skyblue = 'rgba(27,138,248,1)';
	var brightPink = 'rgba(225,78,202,1)';
	var emerald = 'rgba(0,242,195,1)';
	var purple = 'rgba(139,103,224,1)';	
// var skyblueGrd = gradientGenerator(skyblue,ctxDead);
// var brightPinkGrd = gradientGenerator(brightPink,ctxSquat);
// var emeraldGrd = gradientGenerator(emerald,ctxBench);
// var purpleGrd = gradientGenerator(purple,ctxWeight);
	
	


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
// pointBackgroundColor: "#3e95cd",
// backgroundColor:"#3e95cd",
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
// backgroundColor:brightPink,
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
	
	

	

		
		/* 운동관리,식단관리 모달창 이벤트 */
		
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
			
		
		
		$('.performance .myMenti-list').on('click','td',function(e) {
			var target = e.target || e.srcElement;
	
			
			if(modalClickEvent.hasOwnProperty(target.id)) {
				modalClickEvent[target.id].call();
				var targetData = {
						name:$(this).parents('tr').find('.target-username').text(),
						weights:$(this).parents('tr').find('.target-weights').text(),
						height:$(this).parents('tr').find('.target-height').text(),
						goal:$(this).parents('tr').find('.target-goal').text(),
						age:$(this).parents('tr').find('.target-age').text(),
						energy:$(this).parents('tr').find('.target-eRequirement').text()					
				}
		
				
				$('.menti-name').text(targetData.name);
				$('.menti-weights').text(targetData.weights+'kg');
				$('.menti-height').text(targetData.height+'cm');
				$('.menti-goal').text(targetData.goal);
				$('.menti-age').text(targetData.age+'세');
				$('.menti-emetabolism').text(targetData.energy+'kcal');
				
			}			
			
		});
		
		/* 모달창 spinner 이벤트 */
		$('.input-number-increment').click(function(e) {
			
			  var $input = $(this).parents('.input-number-group').find('.input-number');
			  var val = parseInt($input.val(), 10);
			  if($(e.target).parents('.gram-spinner').attr('class') == 'gram-spinner')
				  $input.val(val + 10);
			  else{
			  $input.val(val + 1);
			  }
			});

			$('.input-number-decrement').click(function(e) {
			  var $input = $(this).parents('.input-number-group').find('.input-number');
			  var val = parseInt($input.val(), 10);
			  if($(e.target).parents('.gram-spinner').attr('class') == 'gram-spinner')
				  $input.val(val - 10);
			  else{
			  $input.val(val - 1);
			  }
			})



		/* 년.월.일 셀렉트 박스  */
$('.sel').each(function() {
  $(this).children('select').css('display', 'none');
  
  var $current = $(this);
  
  $(this).find('option').each(function(i) {
    if (i == 0) {
      $current.prepend($('<div>', {
        class: $current.attr('class').replace(/sel/g, 'sel__box')
      }));
      
      var placeholder = $(this).text();
      $current.prepend($('<span>', {
        class: $current.attr('class').replace(/sel/g, 'sel__placeholder'),
        text: placeholder,
        'data-placeholder': placeholder
      }));
      
      
      return;
    }
    
    $current.children('div').append($('<span>', {
      class: $current.attr('class').replace(/sel/g, 'sel__box__options'),
      text: $(this).text()
    }));
    
  });
});

// 가짜 셀렉트 박스 선택시 active 클래스 추가
$('.sel').click(function(e) {
	
  $(this).toggleClass('active');
  if($(this).hasClass('sel-day') && !$(e.target).hasClass('sel__box__options-day') && !$(e.target).hasClass('sel__placeholder-day') ) {
	  var monthVal = $(e.target).prev().prev().find('.sel__placeholder-month').text();

	  if(isNaN(parseInt(monthVal)) == true)  {
		  alert('월을 선택해주세요.');
	  }
  }
});


// 선택박스 값선택
$(document).on('click','.sel__box__options',function() {
  var txt = $(this).text();
  var index = $(this).index();

  $(this).siblings('.sel__box__options').removeClass('selected');
  $(this).addClass('selected');
  
  var $currentSel = $(this).closest('.sel');
  $currentSel.children('.sel__placeholder').text(txt);
  $currentSel.children('select').prop('selectedIndex', index + 1);

 
  
  
 if($(this).parents().hasClass('sel-month')) {
	 $(this).parents('.sel-month').next().next().children('div').empty();
	 	var limit = 0;
		var odd = ['1','3','5','7','8','10','12'];
		var feb = ['2'];
		
		if( odd.indexOf(txt) >= 0) 
			limit = 31;	
		else if(feb.indexOf(txt) >= 0) 
			limit = 28;
		else 
			limit = 30;
		
		for(var i =1 ; i <= limit ; i++) {
// $('.select-day').parent().children('div').append($('<span>',{
// class: 'sel__box__options sel__box__options-day',
// value: i,
// text: i
// }));
			$(this).parents('.sel-month').next().next().children('div').append($('<span>',{
	              class: 'sel__box__options sel__box__options-day',
	              value: i,
	              text: i
			}));
		}
	
 } 

});

			
		
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
						if (!$(e.target).parents().hasClass('food-modal') && !$(e.target).hasClass('food-modal')){
							var close = confirm("창을 닫게 되면 입력한 정보가 사라집니다. 정말로 닫으시겠습니까?");
							if(close == true) {
								foodModal.style.display = 'none';
								 $('a[title="Step 5"]').click();

								 
							}
						}
					}
					else if (exerModal.style.display =='block') {
						if (!$(e.target).parents().hasClass('exer-modal') && !$(e.target).hasClass('exer-modal')){
							var close = confirm("창을 닫게 되면 입력한 정보가 사라집니다. 정말로 닫으시겠습니까?");
							if(close == true) {
							exerModal.style.display = 'none';
							$('a[title="Step 1"]').click();
						
							
							}
						}
					}


				});
				
		
		/* 모달 contents */
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
// console.log("속성들 " + todayInfo[i].ename);
// $('.ename').val(todayInfo[i].ename);
// $('.details').val(todayInfo[i].details);
// $('.parts').val(todayInfo[i].parts);
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
		

		// 프로그레스바 애니메이션
		progressAnime();

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

function nextTab(elem) {

    $(elem).next().find('a[data-toggle="tab"]').click();
    
   
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
    
}

function controlDay(val) {

	var odd = ['1','3','5','7','8','10','12'];
	var feb = ['2'];
	if( odd.indexOf(val) == '1') {
		for (var i =1; i<= 31; i++ ){
		var option = document.createElement('option');
		option.value = i;
		option.innerHTML = i;
		
		$('.select-day').each(function() {
			$('.select-day').append(option);
		});
		}
		
	}
	else if(feb.indexOf(val) == '2') {
		for (var i =1; i<= 28; i++ ){
			var option = document.createElement('option');
			option.value = i;
			option.innerHTML = i;
			
			$('.select-day').each(function() {
				$('.select-day').append(option);
			});
			}
	}
	else {
		for (var i =1; i<= 30; i++ ){
			var option = document.createElement('option');
			option.value = i;
			option.innerHTML = i;
			
			$('.select-day').each(function() {
				$('.select-day').append(option);
			});
			}
	}
}

/* progress 바 애니메이션 효과 */
function progressAnime() {

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
}

function setDuration() {
	var startDate;
	var endDate;
	console.log($('.start-date .sel__placeholder').text());
	console.log($('.sel__placeholder-year').text());
	console.log($('.sel__placeholder-month').text());
	console.log($('.sel__placeholder-day').text());
}



