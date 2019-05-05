


$(function() {
	
	var ctx = document.getElementById('line-chart-daed').getContext("2d");

	var grd = ctx.createLinearGradient(0, 0, 0, 120.5);
	grd.addColorStop(0, "hsla(210, 94%, 54%, 1)");
	grd.addColorStop(1, "hsla(210, 94%, 54%, 0)");

	new Chart(document.getElementById("line-chart-daed"), {
		  type: 'line',
		  data: {
		    labels: ["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"],
		    datasets: [{ 
		        data: [60,66,68,72,74,76,80,88,94,102],
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
		      text: '데드 리프트 중량 변화 (in Kg)'
		    }
		  }
		});
	

	
	new Chart(document.getElementById("line-chart-squat"), {
		  type: 'line',
		  data: {
		    labels: ["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"],
		    datasets: [{ 
		        data: [72,73,73,75,78,70,85,85,94,97],
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
		      text: '스쿼트 중량 변화 (in Kg)'
		    }
		  }
		});
	
	
	new Chart(document.getElementById("line-chart-bench"), {
		  type: 'line',
		  data: {
		    labels: ["4/12","4/18","4/25","4/26","4/27","4/29","5/1","5/2","5/3","5/4"],
		    datasets: [{ 
		        data: [120,120,125,125,125,130,130,120,115,110],
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
		      text: '벤치 프레스 중량 변화 (in Kg)'
		    }
		  }
		});
	
	
	
//	new Chart(document.getElementById("doughnut-chart"), {
//	    type: 'doughnut',
//	    data: {
//	      labels: ["탄수화물","단백질","지방"],
//	      datasets: [
//	        {
//	          label: "Population (millions)",
//	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
//	          data: [1180,720,320]
//	        }
//	      ]
//	    },
//	    options: {
//	      title: {
//	        display: true,
//	        text: '3대 영양소 권장섭취량 (in kcal)'
//	      }
//	    }
//	});
//	
	
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
	        text: '5대 운동 비율 '
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
		      text: '체중 변화 그래프'
		    }
		  }
		});
});
