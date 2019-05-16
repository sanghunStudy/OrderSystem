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
	copyArray = [];
	overallAvg = [];
	myAvg =[];






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


$(function() {
	


	


	var ctx = document.getElementById('line-chart-daed').getContext("2d");

	var grd = ctx.createLinearGradient(0, 0, 0, 120.5);
	grd.addColorStop(0, "hsla(210, 94%, 54%, 1)");
	grd.addColorStop(1, "hsla(210, 94%, 54%, 0)");

	new Chart(document.getElementById("line-chart-daed"), {
		  type: 'line',
		  data: {
		    labels: deadDate/*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/,
		    datasets: [{ 
		        data:dead/*[60,66,68,72,74,76,80,88,94,102]*/,
		        label: "데드리프트",
		        borderColor: "hsla(210, 94%, 54%, 1)",
		        pointBackgroundColor:  "#3e95cd",
		   
		        fill: false
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
		        borderColor: "#e14eca",
		        pointBackgroundColor:  "#e14eca",
		        fill: false
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
		        borderColor: "#00f2c3",
		        pointBackgroundColor:  "#00f2c3",
		        fill: false
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
	    	mode:'single',
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
		        borderColor: "hsla(258, 66%, 64%, 1)",
		        pointBackgroundColor:  "#8965e0",
		    
		        fill: false
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
});
