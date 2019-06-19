var targetChk;
$(function() {

	var doToday = moment().add(0, 'day'), doYesterday, eatToday = moment().add(
			0, 'day'), eatYesterday, exerToday = moment().add(0, 'day'), exerYesterday, exerTomorrow, foodToday = moment()
			.add(0, 'day'), foodYesterday, foodTomorrow;

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
		// 크로스브라우징을 고려한 srcElement(IE8이하버전에선 srcElement로 이벤트객체를반환)
		var target = e.target || e.srcElement;

		if (dateClickEvent.hasOwnProperty(target.id)) {
			dateClickEvent[target.id].call();
		}
	}, true)

	/* 여러개의 체크박스를 가져와 개별 클릭 이벤트 체크 */
	var subject = $('.check-list');

//	$(subject).each(isDone);

//	function isDone(index, item) {
		
		$(document).on('click','.check-list',function() {
				 	targetChk = $(this);
					var doneSubject = $(this).parents('tr').find('.item_box .to_item')
							.text();
					var doneContent = $(this).closest('tr').find('.to_item_contents').text();
//					var doneContent = $(this).closest('tr').find('.item_box .to_item_contents').text();
					var kind = $(this).parents('table').attr('class');
					
					var isChecked = $(this).is(':checked');
					
					var doneCheck = confirm(doneContent + '를 수행하셨습니까? 한번 체크시 수정이 불가능합니다.');

					if (doneCheck == true && $(this).is(':checked') == true) {

						$.ajax({
							url : '/kopo/member/done',
							type : 'POST',
							data : {
								"manager" : myManager,
								"subject" : doneSubject,
								"contents" : doneContent,
								"kind" : kind
							},
							success : function(data) {
//								alert(data);
								if (data == 1) {
									alert('완료되었습니다.');
									msg = myManager;
									wsocket.send(msg);
									targetChk.attr('disabled',true);
									targetChk = {};
								} else {
									alert('오류가 발생했습니다. 다시 시도해주세요.');
								}
							}

						})

					}
					else if(doneCheck == false) {
						$(this).prop("checked",false);
					}

				});

//	}
	$('input[name="rate"]').click(function() {
		var score = this.value;
		$.ajax({
			url:contextPath +'/member/countScore',
			type:'POST',
			data:{
				mento:myManager
			},
			success:function(res){
				if(res == 0){
					saveScore();
				}else{
				alert("트레이너 평가는 한번만 가능합니다.");
				}
			}
		});
		
		function saveScore(){
			
			
			var answer = confirm('정말 트레이너에게' + score + '점을 주시겠습니까?');
			if (answer == true) {
			$.ajax({
				url:contextPath +'/member/submitRate',
				type:'POST',
				data:{
					score:score,
					mento:myManager
				},
				success:function(result) {
					alert('트레이너 평가가 완료되었습니다.');
					$('input[name="rate"]').attr('disabled',true);
					
				}
			})
			}
			else 
				return false;
		}
	});
	
	function getDoList(date) {
		var i = 0;
		$.ajax({
					url : contextPath + '/member/getDoList',
					type : 'GET',
					data : {
						date : date
					},
					success : function(res) {

						var tr = '';

						$.each(res,function(key, value) {
							var progressEnd = (Math.floor((value.doLb/value.doGoal) * 100) == 'Infinity')?'0':Math.round((value.doLb/value.doGoal) * 100);
							
											tr += '<tr><td><div class="checkboxes"><input id="dChk'
													+ i
													+ '" type="checkbox" tabindex="1" class="check-list" /><label class="green-background" for="dChk'
													+ i
													+ '"></label></div></td>';
											tr += '<td><div class="item_box"><div class="to_item">'
													+ value.doName + '</div>';
											tr += '<p class="to_item_contents">'
													+ value.doName + ' '
													+ value.doLb + 'kg중량으로 '
													+ value.doReps + '회씩'
													+ value.doSet
													+ '세트 </p></div></td>';
											tr += '<td class="parts">'
													+ value.doPart + '</td>';
											tr += '<td><div class="progress-container-t"><span id="value" class="progress-value-t" style="background-color: #272a3d">1%</span>';
											tr += '<div class="progress-bar-t"><div id="bar" class="progress-value-t multi" data-code="' + progressEnd  + '" style="width: 1%;"></div></div></div></td>';
											tr += '<td><i class="fas fa-edit"></i></td>';
											tr += '</tr>';
											i++;
										});

						$('.to-do-body').html(tr);
						$('.multi').each(progressAnime);
						
					}
				})
	}

	function getEatList(date) {
		var i = 0;
		$.ajax({
					url : contextPath + '/member/getEatList',
					type : 'GET',
					data : {
						date : date
					},
					success : function(res) {

						var tr = '';

						$.each(res,function(key, value) {
											tr += '<tr><td><div class="checkboxes"><input id="eChk'
													+ i
													+ '" type="checkbox" tabindex="2" class="check-list" /><label class="green-background" for="eChk'
													+ i
													+ '"></label></div></td>';
											tr += '<td><div class="item_box"><div class="to_item">'
													+ value.eatName + '</div>';
											tr += '<p class="to_item_contents">'
													+ value.eatName + ' '
													+ value.eatCount + '개 '
													+ value.eatGram
													+ 'gram </p><p>'
													+ value.etc
													+ '</p</div></td>';
											tr += '<td class="nutrient">'
													+ value.eatNutrient
													+ '</td>';
											tr += '<td class="kcal">'
													+ value.eatKcal
													+ 'kcal</td>';
											tr += '<td><div class="progress-container-t"><span id="value" class="progress-value-t" style="background-color: #272a3d">1%</span>';
											tr += '<div class="progress-bar-t"><div id="bar" class="progress-value-t multi" data-code="' + Math.ceil((value.eatKcal / value.needKcal) * 100) + '" style="width: 1%;"></div></div></div></td>';
											tr += '<td><i class="fas fa-edit"></i></td>';
											tr += '</tr>';
											i++;
										});

						$('.to-eat-body').html(tr);
						$('.multi').each(progressAnime);
						
					}
				})
	}
})
