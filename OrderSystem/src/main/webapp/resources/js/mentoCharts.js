



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
	


//	var ctxDead = document.getElementById('line-chart-daed').getContext("2d");
//	var ctxSquat = document.getElementById('line-chart-squat').getContext("2d");
//	var ctxBench = document.getElementById('line-chart-bench').getContext("2d");
//	var ctxWeight = document.getElementById('line-chart-weight').getContext("2d");
	
	/* scss 느낌의 색상변수*/
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
		        label: "RANKING CHANGE",
		        borderColor: skyblue,
	
//		        pointBackgroundColor:  "#3e95cd",
//		        backgroundColor:"#3e95cd",
		        fill: false
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
		      text: 'WEIGHT CHANGE OF Menti (in Kg)',
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
			
		var foodModal = document.getElementById('food-modal');
		
		$('.planModal').click(function() {
			
			foodModal.style.display = "block";
		});
		
		var notModal = $('div').not('div.food-modal');

		// 모달창 닫기
		$(document).on('mousedown', notModal,
				function(e) {
				
					if (foodModal) {
						if (!$(e.target).parents().hasClass('food-modal'))
							foodModal.style.display = 'none';
					}
				});
				
		
	

});



