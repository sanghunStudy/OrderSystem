


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
		        data: deadAvg/*[60,66,68,72,74,76,80,88,94,102]*/,
		        label: "데드 리프트",
		        borderColor: "hsla(210, 94%, 54%, 1)",
		        pointBackgroundColor:  "#3e95cd",
		        backgroundColor:grd,
		        fill: false
		      }
		    ]
		  },
		  options: {
			maintainAspectRatio: false,
		    title: {
		      display: true,
		      text: '데드 리프트 중량 변화 (in Kg)',
		      fontColor:'#fff',
		      fontSize:16
		     
		    }
		  }
		});
	

	
	new Chart(document.getElementById("line-chart-squat"), {
		  type: 'line',
		  data: {
		    labels: squatDate/*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/,
		    datasets: [{ 
		        data: squatAvg/*[72,73,73,75,78,70,85,85,94,97]*/,
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
		      fontSize:16
		    }
		  }
		});
	
	
	new Chart(document.getElementById("line-chart-bench"), {
		  type: 'line',
		  data: {
		    labels: benchDate/*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/,
		    datasets: [{ 
		        data: benchAvg/*[120,120,125,125,125,130,130,120,115,110]*/,
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
		      fontSize:16
		    }
		  }
		});
	
	
	

	Chart.pluginService.register({
		beforeDraw: function (chart) {
			if (chart.config.options.elements.center) {
        //Get ctx from string
        var ctx = chart.chart.ctx;
        
				//Get options from the center object in options
        var centerConfig = chart.config.options.elements.center;
      	var fontStyle = centerConfig.fontStyle || 'Arial';
				var txt = centerConfig.text;
        var color = centerConfig.color || '#000';
        var sidePadding = centerConfig.sidePadding || 20;
        var sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
        //Start with a base font of 30px
        ctx.font = "30px " + fontStyle;
        
				//Get the width of the string and also the width of the element minus 10 to give it 5px side padding
        var stringWidth = ctx.measureText(txt).width;
        var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

        // Find out how much the font can grow in width.
        var widthRatio = elementWidth / stringWidth;
        var newFontSize = Math.floor(30 * widthRatio);
        var elementHeight = (chart.innerRadius * 2);

        // Pick a new font size so it will not be larger than the height of label.
        var fontSizeToUse = Math.min(newFontSize, elementHeight);

				//Set font settings to draw it correctly.
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
        var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
        ctx.font = fontSizeToUse+"px " + fontStyle;
        ctx.fillStyle = color;
        
        //Draw text in center
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
					data: [300, 50, 100],
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
		         fontSize:16
		        	
		       },
			elements: {
				center: {
					text: '2124kcal',
          color: '#FFFFFF', // Default is #000000
          fontStyle: 'Arial', // Default is Arial
          sidePadding: 20 // Defualt is 20 (as a percentage)
				}
			}
		}
	};


		var doghnutCTX = document.getElementById("doughnut-chart").getContext("2d");
		 new Chart(doghnutCTX, config);
	
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["데드리프트", "벤치프레스", "스쿼트", "턱걸이", "밀리터리프레스"],
	      datasets: [
	       {
	          label: "나의 중량",
	          fill: true,
	          backgroundColor: "rgba(255,99,132,0.2)",
	          borderColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          data: [57.48,54.16,7.61,8.06,4.45]
	        },{
	            label: "이상적인 5대 운동 비율",
	            fill: true,
	            backgroundColor: "rgba(255,241,86,0.2)",
	            borderColor: "rgba(255,241,86,1)",
	            pointBorderColor: "#fff",
	            pointBackgroundColor: "rgba(255,241,86,1)",
	            data: [40.77,50.61,21.69,15.62,31.82]
	          }
	      ]
	    },
	    options: {
	    	maintainAspectRatio: false,
	      title: {
	        display: true,
	        text: '5대 운동 비율 ',
	        fontColor:'#fff',
	        fontSize:16
	      }
	    }
	});
	
	new Chart(document.getElementById("line-chart-weight"), {
		  type: 'line',
		  data: {
		    labels: /*["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"]*/inputDate,
		    datasets: [{ 
		        data: /*[70,71,72,68,69,70,71,73,74,75.6]*/inputWeight,
		        label: "체중 변화(in Kg)",
		        borderColor: "hsla(210, 94%, 54%, 1)",
		        pointBackgroundColor:  "#3e95cd",
		        backgroundColor:grd,
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
		      fontSize:16
		    }
		  }
		});
});
