


$(function() {
	
	var doToday = moment().add(0, 'day'), doYesterday, eatToday = moment().add(0,
	'day'), eatYesterday,exerToday = moment().add(0,'day'),exerYesterday,exerTomorrow,foodToday = moment().add(0,'day'),foodYesterday,foodTomorrow;
	
	/* moment.js를 이용해 날짜 변경이벤트 처리 */
	$('.moment').html(moment().format('L dddd'));
	
/* 프락시 패턴를 이용한 이벤트 관리 */
	var dateClickEvent = {
		"do_prev" : function(e) {
			doYesterday = moment(doToday).add(-1, 'day');
			doToday = doYesterday;

			$('#do_prev').next().html(doToday.format('L dddd'));
		},
		"do_next" : function() {
			doTomorrow = moment(doToday).add(1, 'day');
			doToday = doTomorrow;

			$('#do_next').prev().html(doToday.format('L dddd'));

		},
		"eat_prev" : function() {
			eatYesterday = moment(eatToday).add(-1, 'day');
			eatToday = eatYesterday;

			$('#eat_prev').next().html(eatToday.format('L dddd'));
		},
		"eat_next" : function() {
			eatTomorrow = moment(eatToday).add(1, 'day');
			eatToday = eatTomorrow;

			$('#eat_next').prev().html(eatToday.format('L dddd'));
		},
		"exer_prev": function() {
			exerYesterday = moment(exerToday).add(-1, 'day');
			exerToday = exerYesterday;

			$('#exer_prev').next().html(exerToday.format('L dddd'));
		},
		"exer_next": function() {
			exerTomorrow = moment(exerToday).add(1, 'day');
			exerToday = exerTomorrow;

			$('#exer_next').prev().html(exerToday.format('L dddd'));
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

	document.getElementById('toWrapper').addEventListener('click', function(e) {
		//크로스브라우징을 고려한 srcElement(IE8이하버전에선 srcElement로 이벤트객체를반환)
		var target = e.target || e.srcElement;

		if (dateClickEvent.hasOwnProperty(target.id)) {
			dateClickEvent[target.id].call();
		}
	}, true)

	/* 여러개의 체크박스를 가져와 개별 클릭 이벤트 체크 */
	var subject = $('input[type=checkbox]');
	$(subject).each(function(index, item) {
		$(item).click(function() {
			var doneSubject = $(this).parents('tr').find('.to_item').text();
			var doneContent= $(this).parents('tr').find('.to_item_cotents').text();
			var kind = $(this).parents('table').attr('class');
			console.log($(item));
			var isChecked = $(item).is(':checked');
			console.log($(item).val());
			if($(item).closest().hasClass() == 'checkboxes' ) 
			var doneCheck  = confirm(doneContent + '를 수행하셨습니까?');
		
			if(doneCheck == true && $(item).is(':checked') == true) {
			
				$.ajax({
					url:'/kopo/member/done',
					type:'POST',
					data: {
						"manager":myManager,
						"subject":doneSubject,
						"contents":doneContent,
						"kind":kind
					},
					success:function(data) {
						alert(data);
						if(data == 1) {
							alert('완료되었습니다.');
							msg = myManager;
							wsocket.send(msg);
							console.log("웹소켓 성공 완료?");
						}
						else {
							alert('오류가 발생했습니다. 다시 시도해주세요.');
						}
					}	
						
						
					
					
				})
				
				
			}

			

		});
	});

})
