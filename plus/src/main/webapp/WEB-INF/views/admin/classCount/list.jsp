<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>

<style type="text/css">
.barChartsContainer {
	
	width: 1200px;
	text-align: center
}


#barChartsLayout {
	width: 100%;
	height: 600px;
	border: 1px solid #cccccc;
}
</style>


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/admin/class/charts";
	
	$.getJSON(url, function(data){
		
		chartsDayOfMonth(data);
	});
    
    function chartsDayOfMonth(data) {
	    let chartData = [];
	    console.log(data);
	    let y = data.dayOfMonth.month.substring(0, 4);
	 	let m = parseInt(data.dayOfMonth.month.substring(4));
		//$('.barChart-title').html(y + "년 " + m + "월");
		$('.barChart-title').html("월별 클래스 개설 수");
		
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
				      barWidth: '60%',	
				      data: chartData
				      
				    }
				  ]
				};

				option && myChart.setOption(option);

			}
			
		});	
</script>

<div id="layoutSidenav_content">
	<div class="container-fluid px-4 mt-5">


		<div id="layoutSidenav_content">
	<div class="container-fluid px-4 mt-5">
		<div class="barChartsContainer">
			<h3 class="barChart-title" style="height:30 auto;"></h3>
			<div id="barChartsLayout" style="margin: 0 auto;"></div>
		</div>
	</div>
</div>

	</div>
</div>