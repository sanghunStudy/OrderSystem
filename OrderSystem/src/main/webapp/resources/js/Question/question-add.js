$(document).ready(function() {
		
		var pointBottons = document.getElementById('point_buttons');
		$('#point-set').click(function(){
			if($('#point_buttons').css("display") == 'none'){
				pointBottons.style.display="block";
				$('.point_buttons').animate({
					width:900,
					height:50
				});
			}
			else {
				pointboxClose();
			}
			
		});
		
		function pointboxClose(){
			
			$('#point_buttons').animate({
				width:10,
				height:10
			});
			pointBottons.style.display="none";
		}
		
		function pointSetAndClose(point,pointVal){
			
			$('#pointSet').val(point);
			$('#point-set span').text(pointVal);
			
			pointboxClose();
		}
		
		$('.point-set').click(function(){
			var point = $(this).val();
			var pointVal = $(this).text();
			
			if(point == null){
				pointboxClose();
				
			} else if(point == 0){
				alert("포인트설정 없이 채택하면 본인의 포인트차감없이\n채택자에게 10포인트를 드립니다");
				pointSetAndClose(point,pointVal);
				
			} else {
				alert("설정한 포인트는 질문 등록시 본인의 포인트에서 차감됩니다.\n그리고 답변 채택시 채택된 사람에게 지급됩니다.");
				pointSetAndClose(point,pointVal);
			}
		});
		
});

	