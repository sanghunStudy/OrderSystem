


$(function() {
	
	var doToday = moment().add(0, 'day'), doYesterday, eatToday = moment().add(0,
	'day'), eatYesterday;
	
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
			console.log($(item).is(':checked'));
			console.log($(item).val());
		});
	});

})
