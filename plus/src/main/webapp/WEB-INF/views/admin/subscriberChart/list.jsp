<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<style type="text/css">

</style>

<script src="https://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/plus/admin/sub/list";
	
	$.getJSON(url, function(data){
		// console.log(data);
		
		var chartDom = document.getElementById('dayOfWMonthSubscriberCount');
		var myChart = echarts.init(chartDom);
		var option;

		option = {
		  title: {
		    text: data.year + "년 월별 평균 기온"
		  },
		  tooltip: {
		    trigger: 'axis'
		  },
		  legend: {
		    data: data.legend
		  },
		  xAxis: {
		    type: 'category',
		    boundaryGap: false,
		    data: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		  },
		  yAxis: {
		    type: 'value'
		  },
		  series: data.series
		};

		option && myChart.setOption(option);
		
	});
	
	
});

</script>


</html>	   