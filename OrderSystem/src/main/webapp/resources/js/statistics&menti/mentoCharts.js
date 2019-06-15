	var foodPlan = [];
	var exerPlan = [];
	var param = {};
	var plan=[];
	var whatModal;
	var length =0;
	var today = moment().format('l').split('.');
	if (today[1].substr(0,1) == '0') today[1] = today[1].replace('0','');
// 그라디언트 생성기
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
	var duration;
	var foodToday,exerToday,foodStart,exerStart;


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
		var menti = $(this).closest('tr').find('.my-menti .target-username').text();
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

	    	
		       if($active.hasClass('stepactive1') || $active.hasClass('stepactive5')) {	
			    	
			    	var dateSpan = getModalName(this);
			    	var periodBox = $(this).parents('.list-inline').prev().find('.plan-duration');
			    	duration = setDuration(dateSpan.datePlan,dateSpan.planList,periodBox);
			    	foodToday = exerToday = duration.momentS;
			    	foodStart = exerStart = duration.momentS;
			    	foodEnd = exerEnd = duration.momentE;
			    	fixDate = duration.absStart;	

			    	if(duration.start == 'Invalid date' || duration.end == 'Invalid date') {
			    		alert('날짜를 입력해 주세요.')
			    		return false;
			    	}else if(duration.comparison < 0) {
			    		alert('시작일과 종료일이 올바르지 않습니다. 다시 입력해주세요.')
			    		return false;
			    	}
			    	else if(duration.lackToday < 0){
			    		alert('시작일을 오늘보다 이전으로 설정할 수 없습니다.');
			    		return false;
			    	}
			        $active.next().removeClass('disabled');
			        nextTab($active);	
		       }
		       else {
			        $active.next().removeClass('disabled');
			        nextTab($active);	 
		       }
		       
	  

	      
	        $('.wizard .nav-tabs li.active .connecting-line').css({"border-bottom-left-radius": 0, "border-top-left-radius": 0});
	       
	    });
	    $(".prev-step").click(function (e) {

	        var $active = $('.wizard .nav-tabs li.active');
	        prevTab($active);
	        
	        
	    });
	

	    $('.add-food,.add-exer').click(function (e) {
	    	plan = planner(e.target);
	    	console.log(param);
	 
	    	inputClear();
	    	
	    	
	    });
	    $('.next-plan').click(function (e) {
	    	
	    	getPlanList(whatModal);
	    });
		
	    var DateBtnClickEvent = {
	    		'cl_add_food':function() {
	    		
	    			dateClickEvent["food_next"].call();
	    			getPlanList(whatModal);
	    		},
	    		'cl_minus_food':function() {
	    			dateClickEvent["food_prev"].call();
	    			getPlanList(whatModal);
	    		},
	    		'cl_add_exer':function() {
	    		
	    			dateClickEvent["exer_next"].call();
	    			getPlanList(whatModal);
	    		},
	    		'cl_minus_exer':function() {
	    			dateClickEvent["exer_prev"].call();
	    			getPlanList(whatModal);
	    		}
	    		
	    };
	    
	    $('.cl-btn-box').click(function(e) {
	    	var target = e.target || e.srcElement;
	    	
	    	if(DateBtnClickEvent.hasOwnProperty(target.id)) {
	    		DateBtnClickEvent[target.id].call();
	    	
	    	}
	    });
	    
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
		    labels:rankDate,
		    datasets: [{ 
		        data:dailyRank,
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
		
				
		var modalClickEvent = {
				'food-modal-btn':function() {
					foodModal.style.display = "block";
					whatModal = 'F';
				
				},
				'exer-modal-btn':function() {
					exerModal.style.display = "block";
					whatModal = 'E';
					autocomplete(document.getElementById('ename'),typeOfExercise,teImg);
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
						energy:$(this).parents('tr').find('.target-eRequirement').text(),
						sex:$(this).parents('tr').find('.target-sex').text()
				}
		
				
				
				function charToKorean(char) {
					if(char == 'f')
						return '여자';
					else
						return '남자';
				}	
				
				$('.sel__placeholder-day').each(function() {
				 	var limit = 0;
					var odd = ['1','3','5','7','8','10','12'];
					var feb = ['2'];
					
					if(odd.indexOf($(this).closest('.sel-day').prev().prev().find('.sel__placeholder-month').text != 1)) {
						$(this).next().find('.sel__box__options-day').each(function() {
							if(parseInt($(this).text()) > 30) $(this).css('display','none'); 
						})
					}
					else if(feb.indexOf($(this).closest('.sel-day').prev().prev().find('.sel__placeholder-month').text != 1)) {
						$(this).next().find('.sel__box__options-day').each(function() {
							if(parseInt($(this).text()) > 28) $(this).css('display','none'); 
						})
					}
					
				});
				
				$('.sel__placeholder-year').text(today[0]);
				$('.sel__placeholder-month').text(today[1]);
				$('.sel__placeholder-day').text(today[2]);
				$('.menti-name').text(targetData.name);
				$('.menti-weights').text(targetData.weights+'kg');
				$('.menti-height').text(targetData.height+'cm');
				$('.menti-goal').text(targetData.goal);
				$('.menti-age').text(targetData.age+'세');
				$('.menti-emetabolism').text(targetData.energy+'kcal');
				$('.menti-sex').text(charToKorean(targetData.sex));
				
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



		/* 년.월.일 셀렉트 박스 */

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
		$(document).on('mousedown', notModal,closeModal);
		
		function closeModal(e) {
		
				if (foodModal.style.display =='block') {
					if (!$(e.target).parents().hasClass('food-modal') && !$(e.target).hasClass('food-modal')){
						var close = confirm("창을 닫게 되면 입력한 정보가 사라집니다. 정말로 닫으시겠습니까?");
						if(close == true) {
							foodModal.style.display = 'none';
							$('a[title="Step 1"]').click();
							 $('a[title="Step 5"]').click();
								foodPlan =[];
								exerPlan =[];
								param = {};
								count = 0;
								whatModal = '';

							 
						}
					}
				}
				else if (exerModal.style.display =='block') {
					if (!$(e.target).parents().hasClass('exer-modal') && !$(e.target).hasClass('exer-modal')){
						var close = confirm("창을 닫게 되면 입력한 정보가 사라집니다. 정말로 닫으시겠습니까?");
						if(close == true) {
						exerModal.style.display = 'none';
						$('a[title="Step 1"]').click();
						 $('a[title="Step 5"]').click();
							foodPlan =[];
							exerPlan =[];
							whatModal = '';
					
						
						}
					}
				}
				

			
		}
				
		
		/* 모달 contents */

		
		
		/* 프락시 패턴를 이용한 이벤트 관리 */
		var dateClickEvent = {
		
			"exer_prev": function() {
				
				  if($('.schedule-date-exer').text() == fixDate.format('L dddd')) {
						alert("시작일 이전입니다."); 
						
						return false;
				 }else {
				
				 exerYesterDay = exerToday.subtract(1,'day'); 
				 exerToday = exerYesterDay;
	
				$('#exer_prev').next().html(exerToday.format('L dddd'));
				$('.cl_copy_exer').html(exerToday.format('L dddd'));
				inputClear();
				 }
				  
			},
			"exer_next": function() {
		
			exerTomorrow = exerToday.add(1,'day'); 
	
				 if(exerEnd.diff(exerTomorrow,'days') >= 0) {
					
					 exerToday = exerTomorrow;
						$('#exer_next').prev().html(exerToday.format('L dddd'));
						$('.cl_copy_exer').html(exerToday.format('L dddd'));
						 inputClear();
					// 값 초기화 및 리스트 호출 함수
					}else if(exerEnd.diff(exerTomorrow,'days') < 0) {
						alert("종료일을 초과할 수 없습니다."); 
						return false;
					}
				


			
					
				
			},
			"food_prev": function() {
				
				
				
				  if($('.schedule-date-food').text() == fixDate.format('L dddd')) {
						alert("시작일 이전입니다."); 
						
						return false;
				 }
				  else{					
					 foodYesterDay = foodToday.subtract(1,'day'); 
					 foodToday = foodYesterDay;
				 }
					 
				$('#food_prev').next().html(foodToday.format('L dddd'));
				$('.cl_copy_food').html(foodToday.format('L dddd'));
// }

			},
			"food_next": function() {
				var foodTomorrow;
				
				 foodTomorrow = foodToday.add(1,'day');

				 if(foodEnd.diff(foodTomorrow,'days') >= 0) {
	
				 foodToday = foodTomorrow;
				$('#food_next').prev().html(foodToday.format('L dddd'));
				$('.cl_copy_food').html(foodToday.format('L dddd'));
				// 값 초기화 및 리스트 호출 함수
				}else if(foodEnd.diff(foodTomorrow,'days') < 0) {
					 foodTomorrow = foodToday.add(-1,'day');
					alert("종료일을 초과할 수 없습니다."); 
					return false;
				}
					
			}
		}
		
		document.getElementById('modals').addEventListener('click',function(e) {
			var target = e.target || e.srcElement;
			
			
			if(dateClickEvent.hasOwnProperty(target.id)) {

				dateClickEvent[target.id].call();
			
			}
		});
		
		$('.chart-menti').on('click',function(e) {
		
			location.href="statistics?name="+ $(this).parents('tr').find('.target-username').text();
		})
		
		$('.save-submit').click(function() {
			console.log(Object.keys(param).length);
			console.log(param);
			if(Object.keys(param).length == 0) {
				alert('전송할 플랜이 없습니다.');
				
				return false;
			}
			$.ajax({
// contentType:"application/json; charset=UTF-8",
				url:'/kopo/member/writePlan',
				type:'POST',
				traditional:true,
				data:param
					
				,
// data:JSON.stringify({
// "plan":plan
// }),
				success:function(data) {
					alert('플랜이 저장되었습니다.');
					count = 0;
					length = 0;
					exerModal.style.display = 'none';
					foodModal.style.display = 'none';
					$('a[title="Step 1"]').click();
					 $('a[title="Step 5"]').click();
						foodPlan =[];
						exerPlan =[];
						param = {};
						count = 0;
						whatModal = '';
				}
				
			});
		})
		
		// 프로그레스바 애니메이션
		progressAnime();

		
		//문서 온로드시 날짜 초기값을 오늘로 설정
	$('.start-date .select-year').val(today[0]);
	$('.start-date .select-month').val(today[1]);
	$('.start-date .select-day').val(today[2]);
	$('.end-date .select-year').val(today[0]);
	$('.end-date .select-month').val(today[1]);
	$('.end-date .select-day').val(today[2]);
	
});





function autocomplete(inp,arr,imgArr) {
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
				b.className = 'autocomplete-item-box';
				b.innerHTML = '<div class="auto-text-box"><span class="cur-char">' + arr[i].substr(0,val.length) + "</span>";
				b.innerHTML += '<span class="left-char">'+ arr[i].substr(val.length) + '</span></div>';
				b.innerHTML += '<img src="' + contextPath + '/upload'+ imgArr[i] + '">';
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
var startDate;
var endDate;

function setDuration(dateBox,planList,obj) {
	

	
	startDate = {
			year:$(obj).find('.start-date .select-year').val(),
			month:$(obj).find('.start-date .select-month').val(),
			day:$(obj).find('.start-date .sel__placeholder-day').text()
	};
	endDate= {
			year:$(obj).find('.end-date .select-year').val(),
			month:$(obj).find('.end-date .select-month').val(),
			day:$(obj).find('.end-date .sel__placeholder-day').text()
	};
	

		const staticDate = startDate.year + '-' +startDate.month + '-' + startDate.day;
//	const staticDate = moment();
//	console.log(staticDate);
	
	var momentStart = startDate.year + '-' +startDate.month + '-' + startDate.day,
		momentEnd = endDate.year + '-' +endDate.month + '-' + endDate.day,
	
	 	sDate = moment(momentStart).format('L dddd'),
	 	sCompare = moment(momentStart),
	 	eCompare = moment(momentEnd), 
	 	eDate = moment(momentEnd).format('L dddd');
	
	const fixStart = moment(staticDate);
	dateBox.html(sDate);
	planList.html(sDate);

	
	return {
		absStart:fixStart,
		momentS:sCompare,
		momentE:eCompare,
		start:sDate,
		end:eDate,
		comparison:eCompare.diff(sCompare,'days'),
		lackToday:sCompare.diff(moment(),'days')
	}

}

function getModalName(name) {
	if(name.classList.contains('next-food'))
		return {datePlan:$('.schedule-date-food'),planList:$('.cl_copy_food')}
	else if(name.classList.contains('next-exer'))
		return {datePlan:$('.schedule-date-exer'),planList:$('.cl_copy_exer')}
	else
		return '';
}

function planner(obj) {

	var list;
	

	if($(obj).closest('button').hasClass('add-food') == true) {
		kcal = parseFloat($('.fkcal').val()).toFixed(1) || 0;
		if(isNaN(kcal)) kcal = 0;
		
		list = {
			code:1,
			date:$('.schedule-date-food').text(),	
			name:$('.fname').val(),
			gram:$('.fgram').val(),
			count:$('.fcount').val(),
			kcal:kcal,
			etc:$('.fetc').val(),
			nutrient:$('input[name="nutrient"]:checked').val() || '',
			time:$('input[name=radio]:checked').val(),
			menti:$('.food-modal .menti-name').text(),
			mento:trainer
		
		};
	

				
		foodPlan.push(list);
		length++;
		makeList(list,length);
		alert('식단이 추가되었습니다.');
		return foodPlan;
	}
	else if ($(obj).closest('button').hasClass('add-exer') == true) {
		goal = parseFloat($('.lb-goal').val()).toFixed(1) || 0;
		if(isNaN(goal)) goal = 0;
		list = {
			code:2,
			name:$('.ename').val(),
			set:$('.eset').val(),
			reps:$('.ereps').val(),
			lb:$('.elb').val(),
			goal:goal,
			part:$('.parts').val(),
			etc:$('.details').val(),
			date:$('.schedule-date-exer').text(),
			menti:$('.exer-modal .menti-name').text(),
			mento:trainer
		};
		exerPlan.push(list);
		length++;
		makeList(list,length);
		alert('운동이 추가되었습니다.');
		return exerPlan;
	}
	list = "";

	
}
function getPlanList(whatModal) {
	
	var eventItem=document.createElement('div');
	eventItem.className = 'event_item';	
	var union= document.createElement('div');
	union.id = "cl_id";
	
	if(	whatModal == 'F') {
		$(union).empty();
		eventItem.innerHTML +='<p class="ce_title">To Eat List</p>';
		for(var i in plan) {
		
		
			if(plan[i].date == $('.cl_copy_food').text()) {

				eventItem.innerHTML += '<div class="ei_Dot"></div>';
				eventItem.innerHTML += '<div class="ei_Title">' + plan[i].time + '<span class="ei_etc">'+plan[i].etc+'</span></div>';
				eventItem.innerHTML += '<div class="ei_Copy">' + plan[i].name + ' ' + plan[i].gram + 'gram' + ' ' + plan[i].count + '개    ' + plan[i].kcal + 'kcal</div>';
				
			
			union.appendChild(eventItem);
			
		
			}
	
		
		}

		$('.event_eat').html(union);
	}
	else if (whatModal == 'E') {
		$(union).empty();
		eventItem.innerHTML +='<p class="ce_title">To Do List</p>';
		for(var i in plan) {
			
			if(plan[i].date == $('.cl_copy_exer').text()) {
				
				eventItem.innerHTML += '<div class="ei_Dot"></div>';
				eventItem.innerHTML += '<div class="ei_Title">' + plan[i].name + '<span class="ei_part">'+plan[i].part+'</span><span class="ei_goal">' + plan[i].goal + 'kg</span></div>';
				eventItem.innerHTML += '<div class="ei_Copy">' + plan[i].set + ' ' + plan[i].reps + '회' + ' ' + plan[i].lb + 'kg    ' + plan[i].etc + 'kcal</div>';
			
				
		
				union.appendChild(eventItem);
			}
	
		}
		$('.event_do').html(union);
	}
}
var count =0;
function makeList(list,length) {
	
var codeVal;
if(list.code == 1) {
	codeVal = 'eat';

//	for(var i=0;i<length;i++) {
		
		param[codeVal+'List['+ count + '].code'] = list.code;
		param[codeVal+'List['+ count + '].eatDate'] = list.date;
		param[codeVal+'List['+ count + '].eatName'] = list.name;
		param[codeVal+'List['+ count + '].eatGram'] = list.gram;
		param[codeVal+'List['+ count + '].eatCount'] = list.count;
		param[codeVal+'List['+ count + '].eatKcal'] = list.kcal;
		param[codeVal+'List['+ count + '].eatEtc'] = list.etc;
		param[codeVal+'List['+ count + '].eatNutrient'] = list.nutrient;
		param[codeVal+'List['+ count + '].eatTime'] = list.time;
		param[codeVal+'List['+ count + '].username'] = list.menti;
		param[codeVal+'List['+ count + '].manager'] = list.mento;

//	}
		count++;
}
else if(list.code == 2) {
	codeVal = 'do';
//	for(var i=0;i<length;i++) {
	
		param[codeVal+'List['+ count + '].code'] = list.code;
		param[codeVal+'List['+ count + '].doDate'] = list.date;
		param[codeVal+'List['+ count + '].doName'] = list.name;
		param[codeVal+'List['+ count + '].doSet'] = list.set;
		param[codeVal+'List['+ count + '].doReps'] = list.reps;
		param[codeVal+'List['+ count + '].doLb'] = list.lb;
		param[codeVal+'List['+ count + '].doGoal'] = list.goal;
		param[codeVal+'List['+ count + '].doPart'] = list.part;
		param[codeVal+'List['+ count + '].doEtc'] = list.etc;
		param[codeVal+'List['+ count + '].username'] = list.menti;
		param[codeVal+'List['+ count + '].manager'] = list.mento;
		count ++;
//}
}

}
function inputClear() {
	$('.textInput').val('');
	$('.eset').val(1);
	$('.ereps').val(10);
	$('.elb').val(20);
	$('.fgram').val(10);
	$('.fcount').val(1);
	$('.ks-cboxtags>li>input[type="radio"]').prop("checked",false);
	$('.ks-cboxtags>li>input[type="checkbox"]').prop("checked",false);
}