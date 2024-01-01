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

$(function(){
	let url = "${pageContext.request.contextPath}/admin/memberManage/purposeClassChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("purposeChart-container", {
			title:{
				text : "어떤 목적의 원데이 클래스를 추천 받으시겠습니까?"
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
	let url = "${pageContext.request.contextPath}/admin/memberManage/categoryClassChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("categoryChart-container", {
			title:{
				text : "어떤 카테고리의 원데이 클래스를 추천 받으시겠습니까?"
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
	let url = "${pageContext.request.contextPath}/admin/memberManage/regionClassChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("regionChart-container", {
			title:{
				text : "어떤 지역의 원데이 클래스를 추천 받으시겠습니까?"
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
	let url = "${pageContext.request.contextPath}/admin/memberManage/priceClassChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("priceChart-container", {
			title:{
				text : "어떤 가격대의 원데이 클래스를 추천 받으시겠습니까?"
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
	let url = "${pageContext.request.contextPath}/admin/memberManage/ageClassChart";
	
	$.getJSON(url, function(data){
		let titles = [];
		let values = [];
		
		for(let item of data.list) {
			titles.push(item.section);
			values.push(item.count);
		}

		Highcharts.chart("ageChart-container", {
			title:{
				text : "어떤 나이대의 원데이 클래스를 추천 받으시겠습니까?"
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

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		 	<div class="container-fluid px-5">
				<div class="body-container" style="width:80%; margin:5% auto; ">
    				<div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
			           	<i class="fa-solid fa-user-group"></i> 회원 분석
			           	<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/analysis';" style="float:right;">
	                    	<i class="fa-solid fa-arrow-rotate-left"></i>
	                    </button>
					</h3>
					<div>
						<ul class="tabs">
							<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;회원 리스트</li>
							<li id="tab-1" data-tab="1"><i class="fa-solid fa-chart-column"></i>&nbsp;회원 분석</li>
						</ul>
					</div>
					<div id="tab-content" style="margin:10px auto">
						<div id="chart-container"></div>
						<div id="purposeChart-container"></div>
						<div id="categoryChart-container"></div>
						<div id="regionChart-container"></div>
						<div id="priceChart-container"></div>
						<div id="ageChart-container"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
