function getDoList(date) {
	console.log(date);
	$.ajax({
		url:contextPath + '/member/getDoList',
		type:'GET',
		data:{
			date:date
		},
		success:function(res) {
			console.log(res);
			var tr = '';
			
			$.each(res,function(key,value) {
				tr +='<tr><td><div class="checkboxes"><input id="a" type="checkbox" tabindex="1" /><label class="green-background" for="a"></label></div></td>'; 
				tr +='<td><div class="item_box"><div class="to_item">' + value.doName + '</div>';
				tr +='<p class="to_item_cotents">' + value.doName + ' ' + value.doLb + '중량으로 ' + value.doReps + '회씩' + value.deSet+ '세트 </p></div></td>';
				tr += '<td class="parts">' + value.doPart + '</td>';
				tr += '<td><div class="progress-container-t"><span id="value" class="progress-value-t" style="background-color: #272a3d">1%</span>';
				tr += '<div class="progress-bar-t"><div id="bar" class="progress-value-t multi" data-code="dbVal" style="width: 1%;"></div></div></div></td>';
				tr += '<td><i class="fas fa-edit"></i></td>';
				tr += '</tr>';
			});
			
			$('.to-do-body').html(tr);
			$('.multi').each(progressAnime);
		}
	})
}

function getEatList(date) {
	console.log(date);
	$.ajax({
		url:contextPath + '/member/getEatList',
		type:'GET',
		data:{
			date:date
		},
		success:function(res) {
			console.log(res);
			var tr = '';

			$.each(res,function(key,value) {
				tr +='<tr><td><div class="checkboxes"><input id="b" type="checkbox" tabindex="2" /><label class="green-background" for="b"></label></div></td>'; 
				tr +='<td><div class="item_box"><div class="to_item">' + value.eatName + '</div>';
				tr +='<p class="to_item_cotents">' + value.eatName + ' ' + value.eatCount + '개 ' + value.eatGram + 'gram </p><p>' + value.etc + '</p</div></td>';
				tr += '<td class="nutrient">' + value.eatNutrient + '</td>';
				tr += '<td class="kcal>' + value.eatKcal + '</td>';
				tr += '<td><div class="progress-container-t"><span id="value" class="progress-value-t" style="background-color: #272a3d">1%</span>';
				tr += '<div class="progress-bar-t"><div id="bar" class="progress-value-t multi" data-code="dbVal" style="width: 1%;"></div></div></div></td>';
				tr += '<td><i class="fas fa-edit"></i></td>';
				tr += '</tr>';
			});
			
			$('.to-eat-body').html(tr);
			$('.multi').each(progressAnime);
		}
	})
}


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
			getDoList(doToday.format('L dddd'));
		},
		"do_next" : function() {
			doTomorrow = moment(doToday).add(1, 'day');
			doToday = doTomorrow;

			$('#do_next').prev().html(doToday.format('L dddd'));
			getDoList(doToday.format('L dddd'));

		},
		"eat_prev" : function() {
			eatYesterday = moment(eatToday).add(-1, 'day');
			eatToday = eatYesterday;

			$('#eat_prev').next().html(eatToday.format('L dddd'));
			getEatList(eatToday.format('L dddd'));
		},
		"eat_next" : function() {
			eatTomorrow = moment(eatToday).add(1, 'day');
			eatToday = eatTomorrow;

			$('#eat_next').prev().html(eatToday.format('L dddd'));
			getEatList(eatToday.format('L dddd'));
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
		
			var isChecked = $(item).is(':checked');
		
			if(item.parentNode.classList.contains('checkboxes')){ 
				var doneCheck  = confirm(doneContent + '를 수행하셨습니까?');
		
			}
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
