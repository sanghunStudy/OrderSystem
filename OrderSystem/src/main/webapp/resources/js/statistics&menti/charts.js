var squat = [],
	squatDate=[],
	dead = [],
	deadDate=[],
	benchDate=[],
	bench = [],
	inputWeight=[],
	inputDate=[],
    metabolism={b:'',e:''},
	data={},
	copyArray = [],
	overallAvg = [],
	myAvg =[];




//이전 운동값과 비교한 %값 계산기
function rateCal(comparison,curVal) {
	var rate;
	
	if(parseInt(curVal) >= parseInt(comparison))
		rate =	Math.round((curVal / comparison * 100)-100);
	else if(parseInt(curVal) < parseInt(comparison)) {
		rate =	100 -Math.round((curVal / comparison * 100));
		rate = -rate
	}
	return rate;

	
}
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
	


	var ctxDead = document.getElementById('line-chart-daed').getContext("2d");
	var ctxSquat = document.getElementById('line-chart-squat').getContext("2d");
	var ctxBench = document.getElementById('line-chart-bench').getContext("2d");
	var ctxWeight = document.getElementById('line-chart-weight').getContext("2d");
	
	/* scss 느낌의 색상변수*/
	var skyblue = 'rgba(27,138,248,1)';
	var brightPink = 'rgba(225,78,202,1)';
	var emerald = 'rgba(0,242,195,1)';
	var purple = 'rgba(139,103,224,1)';	
	var skyblueGrd = gradientGenerator(skyblue,ctxDead);
	var brightPinkGrd = gradientGenerator(brightPink,ctxSquat);
	var emeraldGrd = gradientGenerator(emerald,ctxBench);
	var purpleGrd = gradientGenerator(purple,ctxWeight);
	
	


	var deadChart = new Chart(document.getElementById("line-chart-daed"), {
		  type: 'line',
		  data: {
		    labels: deadDate/*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/,
		    datasets: [{ 
		        data:dead/*[60,66,68,72,74,76,80,88,94,102]*/,
		        label: "데드리프트",
		        borderColor: skyblue,
		        pointBackgroundColor:  "#3e95cd",
		        backgroundColor:skyblueGrd,
		        fill: true
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '데드리프트 중량 변화 (in Kg)',
		      fontColor:'#fff',
		      fontSize:16,
		      fontStyle: 'Noto Sans KR'
		     
		    },
			 scales: {
			       xAxes: [
			    	      {
			    	        scaleLabel: {
			    	          display: true,
			    	          labelString: '사이드바의 운동일지 작성 후 이용하실 수 있습니다',
			    	          fontColor: '#C7C7CC',
			    	          fontSize: 11
			    	        }
			    	      }
			    	    ]
			    	  }
		  }
		});
	

	
	new Chart(document.getElementById("line-chart-squat"), {
		  type: 'line',
		  data: {
		    labels: squatDate/*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/,
		    datasets: [{ 
		        data: squat/*[72,73,73,75,78,70,85,85,94,97]*/,
		        label: "스쿼트",
		        borderColor: brightPink,
		        pointBackgroundColor:  "#e14eca",
		        backgroundColor:brightPinkGrd,
		        fill: true
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '스쿼트 중량 변화 (in Kg)',
		      fontColor:'#fff',
		      fontSize:16,
		      fontStyle: 'Noto Sans KR'
		    },
			 scales: {
			       xAxes: [
			    	      {
			    	        scaleLabel: {
			    	          display: true,
			    	          labelString: '사이드바의 운동일지 작성 후 이용하실 수 있습니다',
			    	          fontColor: '#C7C7CC',
			    	          fontSize: 11
			    	        }
			    	      }
			    	    ]
			    	  }
		  }
		});
	
	
	new Chart(document.getElementById("line-chart-bench"), {
		  type: 'line',
		  data: {
		    labels: benchDate/*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/,
		    datasets: [{ 
		        data: bench/*[120,120,125,125,125,130,130,120,115,110]*/,
		        label: "벤치",
		        borderColor: emerald,
		        pointBackgroundColor:  "#00f2c3",
		        backgroundColor:emeraldGrd,
		        fill: true
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '벤치 프레스 중량 변화 (in Kg)',
		      fontColor:'#fff',
		      fontSize:16,
		      fontStyle: 'Noto Sans KR'
		     
		    	  
		    },
			 scales: {
			       xAxes: [
			    	      {
			    	        scaleLabel: {
			    	          display: true,
			    	          labelString: '사이드바의 운동일지 작성 후 이용하실 수 있습니다',
			    	          fontColor: '#C7C7CC',
			    	          fontSize: 11
			    	        }
			    	      }
			    	    ]
			    	  }
		  }
		});
	
	
	

	Chart.pluginService.register({
		beforeDraw: function (chart) {
			if (chart.config.options.elements.center) {
        // ctx 변수선언
        var ctx = chart.chart.ctx;
        
				// options의 center오브젝트로부터 옵션값 추출
        var centerConfig = chart.config.options.elements.center;
      	var fontStyle = centerConfig.fontStyle || 'Arial';
		var txt = centerConfig.text;
        var color = centerConfig.color || '#000';
        var sidePadding = centerConfig.sidePadding || 20;
        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
        // default 폰트 크기와 서체 설정
        ctx.font = "30px " + fontStyle;
        
				//문자열의 넓이값을 구하고 요소넓이 -10만큼의 양쪽 사이드 padding값 부여
        var stringWidth = ctx.measureText(txt).width;
        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

        // width값에서 폰트크기가 최대 얼마나 커질수 있는지 계산
        var widthRatio = elementWidth / stringWidth;
        var newFontSize = Math.floor(30 * widthRatio);
        var elementHeight = (chart.innerRadius * 2);

        // 라벨의 높이보다 높지않은 새로운 폰트사이즈값을 선택
        var fontSizeToUse = Math.min(newFontSize, elementHeight);

		// 정확하게 그리기위해 폰트 값 세팅
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
        ctx.font = fontSizeToUse+"px " + fontStyle;
        ctx.fillStyle = color;
        
        // center값 ctx에 추가
        ctx.fillText(txt, centerX, centerY);
			}
		}
	});


		var config = {
			type: 'doughnut',
			data: {
				labels: [
				  "탄수화물",
				  "단백질",
				  "지방"
				],
				datasets: [{
					data: [parseInt(metabolism.e*0.6), parseInt(metabolism.e*0.2), parseInt(metabolism.e*0.2)],
					backgroundColor: [
					  "#FF6384",
					  "#36A2EB",
					  "#FFCE56"
					],
					hoverBackgroundColor: [
					  "#FF6384",
					  "#36A2EB",
					  "#FFCE56"
					]
				}]
			},
		options: {
			maintainAspectRatio: false,
			title: {
		         display: true,
		         text: '3대 영양소 권장섭취량 (in kcal)',
		         fontColor:'#FFFFFF',
		         fontSize:16,
		         fontStyle: 'Noto Sans KR'
		        	
		       },
			elements: {
				center: {	
					text: metabolism.e + 'kcal',
          color: '#FFFFFF', // 기본값 #000000
          fontStyle: 'Noto Sans KR', // 기본값 Arial
          sidePadding: 15 // 기본값 20 (%단위)
				}
			},
			 scales: {
		       xAxes: [
		    	      {
		    	        scaleLabel: {
		    	          display: true,
		    	          labelString: '페이지 하단의 계산기 아이콘을 통해 이용하실 수 있습니다',
		    	          fontColor: '#C7C7CC',
		    	          fontSize: 11
		    	        }
		    	      }
		    	    ]
		    	  }
		}
	};


		var doghnutCTX = document.getElementById("doughnut-chart").getContext("2d");
		 new Chart(doghnutCTX, config);
	
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["데드리프트", "스쿼트", "벤치프레스", "풀업", "밀리터리프레스"],
	      datasets: [
	       {
	    	  
	          label: "나의 중량",
	          fill: true,
	          backgroundColor: "rgba(255,99,132,0.2)",
	          borderColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          data: myAvg/*[12,10,10]*/
	          
	        },{
	        	
	            label: "동체급 평균중량",
	            fill: true,
	            backgroundColor: "rgba(255,241,86,0.2)",
	            borderColor: "rgba(255,241,86,1)",
	            pointBorderColor: "#fff",
	            pointBackgroundColor: "rgba(255,241,86,1)",
	            data: overallAvg/*[12,10,10]*/
	          
	            
	          }
	      ]
	    },
	    options: {
	    	maintainAspectRatio: false,
	      title: {
	        display: true,
	        text: '5대 운동 비율 ',
	        fontColor:'#fff',
	        fontSize:16,
	        fontStyle: 'Noto Sans KR'
	      },
	    tooltips: {
	    	enabled:true,
	    	mode:'index',
	    	callbacks: {

	    		label: function(tooltipItems, data) { 

	    	          return  data.datasets[tooltipItems.datasetIndex].label + ': '+ tooltipItems.yLabel;
	            }
	 
	    	}
	     }
	    }
	});
	
	new Chart(document.getElementById("line-chart-weight"), {
		  type: 'line',
		  data: {
		    labels: /*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/inputDate,
		    datasets: [{ 
		        data: /*[70,71,72,68,69,70,71,73,74,75.6]*/inputWeight,
		        label: "체중(in Kg)",
		        borderColor: purple/*"hsla(258, 66%, 64%, 1)"*/,
		        pointBackgroundColor:  "#8965e0",
		        backgroundColor:purpleGrd,
		        fill: true
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '체중 변화 그래프',
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
	
	
		$('.multi').each(progressAnime);
			
		

				
		
	

});


function progressAnime() {
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
}
