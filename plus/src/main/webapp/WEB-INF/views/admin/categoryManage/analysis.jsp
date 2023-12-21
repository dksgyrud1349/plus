<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<style type="text/css">



</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
$(function(){
	$("#tab-1").addClass("active");

	$("ul.tabs li").click(function() {
		let tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		let url = "${pageContext.request.contextPath}/admin/memberManage/list";	
		location.href = url;
	});
});


$(function(){
	let url = "${pageContext.request.contextPath}/admin/memberManage/ageAnalysis";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		/*
		for(let i=0; i<data.list.length; i++) {
			titles.push(data.list[i].section);
			values.push(data.list[i].count);
		}
		*/
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("chart-container", {
			title:{
				text : "연령대별 회원수"
			},
			xAxis : {
				categories:titles
			},
			yAxis : {
				title:{
					text:"인원(명)"
				}
			},
			series:[{
		        type: 'column',
		        colorByPoint: true,
		        name: '인원수',
		        data: values,
		        showInLegend: false
		    }]
		});
	});
});
</script>

<main class="wrapper" style="margin:5% auto; width:80%;">
	<div id="layoutSidenav_content">
		 	<div class="container-fluid px-5">
				<div class="body-container">
		    			<div class="body-title">
		<h2><i class="fa-solid fa-user-group"></i> 회원 관리 </h2>
    </div>
    
    <div class="body-main">
    	
		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;회원 리스트</li>
				<li id="tab-1" data-tab="1"><i class="fa-solid fa-chart-column"></i>&nbsp;연령대 분석</li>
			</ul>
		</div>
		<div id="tab-content" style="margin:10px auto">
			<div id="chart-container"></div>
		</div>

    	
	</div>
</div>
</div>
</div>
</main>
