<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>

<style type="text/css">
.barChartsContainer {
	align-items: center;
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

#barChartsLayout {
	width: 100%;
	height: 500px;
	border: 1px solid #cccccc;
	margin: 0 auto;
}

.barChart-title {
	font-family: 'Nanum Gothic', sans-serif; /* 원하는 폰트로 변경하세요. */
	font-size: 35px; /* 원하는 크기로 변경하세요. */
	color: #222; /* 원하는 색상으로 변경하세요. */
}
</style>

<script>


$(function(){
	let url = "${pageContext.request.contextPath}/admin/sub/charts";
	
	$.getJSON(url, function(data){
		
		chartsDayOfMonth(data);
	});
    
    function chartsDayOfMonth(data) {
	    let chartData = [];
	    console.log(data);
	    let y = data.dayOfMonth.month.substring(0, 4);
	 	let m = parseInt(data.dayOfMonth.month.substring(4));
		//$('.barChart-title').html(y + "년 " + m + "월");
		
	    chartData.push(data.dayOfMonth.JAN);
	    chartData.push(data.dayOfMonth.FEB);
	    chartData.push(data.dayOfMonth.MAR);
	    chartData.push(data.dayOfMonth.APR);
	    chartData.push(data.dayOfMonth.MAY);
	    chartData.push(data.dayOfMonth.JUN);
	    chartData.push(data.dayOfMonth.JUL);
	    chartData.push(data.dayOfMonth.AUG);
	    chartData.push(data.dayOfMonth.SEP);
	    chartData.push(data.dayOfMonth.OCT);
	    chartData.push(data.dayOfMonth.NOV);
	    chartData.push(data.dayOfMonth.DEC);
	    
	    console.log(chartData);
    
		var chartDom = document.getElementById('barChartsLayout');
		var myChart = echarts.init(chartDom);
		var option;

		option = {
				  tooltip: {
				    trigger: 'axis',
				    axisPointer: {
				      type: 'shadow'
				    }
				  },
				  grid: {
				    left: '3%',
				    right: '4%',
				    bottom: '3%',
				    containLabel: true
				  },
				  xAxis: [
				    {
				      type: 'category',
				      data: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],
				      axisTick: {
				        alignWithLabel: true
				      }
				    }
				  ],
				  yAxis: [
				    {
				      type: 'value'
				    }
				  ],
				  series: [
					  {
					    name: 'Direct',
					    type: 'bar',
					    barWidth: '80%',	
					    data: chartData,
					    itemStyle: {
					      color: function(params) {
					        var colorList = ['#c23531','#2f4554','#61a0a8','#d48265','#91c7ae','#749f83','#ca8622','#bda29a','#6e7074','#546570','#c4ccd3'];
					        if(params.value == 0) {
					          return '#d9d9d9'; // 값이 없는 달에 대한 색상
					        } else {
					          return colorList[params.dataIndex % colorList.length];
					        }
					      }
					    }
					  }
					]
				};

				option && myChart.setOption(option);

			}
		
		});	
</script>
<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
						<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
							<i class="bi bi-bar-chart-line-fill"></i> 월별 가입자 수
						</h3>
					<div class="barChartsContainer">
						<div id="barChartsLayout" style="margin: 0 auto;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>