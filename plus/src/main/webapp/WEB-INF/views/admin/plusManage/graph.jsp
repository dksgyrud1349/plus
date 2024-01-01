<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css">

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
		
		let url = "${pageContext.request.contextPath}/admin/plusManage/plusList";	
		location.href = url;
	});
});

$(function(){
	let url = "${pageContext.request.contextPath}/admin/plusManage/plusAgeChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("chart-container1", {
			title:{
				text : "플러스 가입자 수"
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

$(function(){
	let url = "${pageContext.request.contextPath}/admin/plusManage/classChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("chart-container2", {
			title:{
				text : "어떤 클래스를 제공하실건가요?"
			},
			xAxis : {
				categories:titles
			},
			yAxis : {
				title:{
					text:"답변 수"
				}
			},
			series:[{
		        type: 'column',
		        colorByPoint: true,
		        name: '답변 수',
		        data: values,
		        showInLegend: false
		    }]
		});
	});
});

$(function(){
	let url = "${pageContext.request.contextPath}/admin/plusManage/regionChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("chart-container3", {
			title:{
				text : "어느 지역에서 제공하실건가요?"
			},
			xAxis : {
				categories:titles
			},
			yAxis : {
				title:{
					text:"답변 수"
				}
			},
			series:[{
		        type: 'column',
		        colorByPoint: true,
		        name: '답변 수',
		        data: values,
		        showInLegend: false
		    }]
		});
	});
});

$(function(){
	let url = "${pageContext.request.contextPath}/admin/plusManage/priceChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("chart-container4", {
			title:{
				text : "어느 가격대에서 제공하실 예정이신가요?"
			},
			xAxis : {
				categories:titles
			},
			yAxis : {
				title:{
					text:"답변 수"
				}
			},
			series:[{
		        type: 'column',
		        colorByPoint: true,
		        name: '답변 수',
		        data: values,
		        showInLegend: false
		    }]
		});
	});
});

$(function(){
	let url = "${pageContext.request.contextPath}/admin/plusManage/ageChart";
	
	$.getJSON(url, function(data){
		console.log(data);
		let titles = [];
		let values = [];
		
		for(let item of data.age) {
			titles.push(item.section);
			values.push(item.count);
		}
		Highcharts.chart("chart-container5", {
			title:{
				text : "어느 연령대가 제공 대상자이신가요?"
			},
			xAxis : {
				categories:titles
			},
			yAxis : {
				title:{
					text:"답변 수"
				}
			},
			series:[{
		        type: 'column',
		        colorByPoint: true,
		        name: '답변 수',
		        data: values,
		        showInLegend: false
		    }]
		});
		
	});
});
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		 	<div class="container-fluid px-5">
				<div class="body-container" style="width:80%; margin:5% auto; ">
    				<div class="body-main">
					
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
	                     	<i class="fa-solid fa-user-group"></i> 질문 분석 
	                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/plusManage/graph';" style="float:right;">
	                    	<i class="fa-solid fa-arrow-rotate-left"></i>
	                    </button>
	                </h3>
					
					<div>
						<ul class="tabs">
							<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;플러스
								리스트</li>
							<li id="tab-1" data-tab="1"><i
								class="fa-solid fa-chart-column"></i>&nbsp;질문 분석</li>
						</ul>
					</div>
					<div id="tab-content" style="margin: 10px auto">
						<div id="chart-container1"></div>
					</div>
					<div id="tab-content" style="margin: 10px auto">
						<div id="chart-container2"></div>
					</div>
					<div id="tab-content" style="margin: 10px auto">
						<div id="chart-container3"></div>
					</div>
					<div id="tab-content" style="margin: 10px auto">
						<div id="chart-container4"></div>
					</div>
					<div id="tab-content" style="margin: 10px auto">
						<div id="chart-container5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
