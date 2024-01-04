<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
a{
	text-decoration:none;
	color: #000;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.css">

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto;">
				<div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<a class="btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
							<i class="bi bi-layout-text-sidebar-reverse" style="font-size:30px;"></i>
						</a> 
						일정관리 
					</h3>
			
					<div class="row">
						<div class="col px-2">
							<div id="calendar"></div>
						</div>
					</div>
					
					<div id='scheduleLoading' style="display: none;">loading...</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- 좌측 카테고리 관리 오프캔버스 -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasExampleLabel"><i class="bi bi-gear-wide-connected"></i> 내 캘린더 설정</h5>
		<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<div class="row mb-3">
			<div class="col">
				<button class="btn btn-success" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					카테고리 추가 <i class="bi bi-plus-lg"></i>
				</button>
				
				<button type="button" class="btn btn-success btnCategorySearch" title="검색" style="float:right;"><i class="bi bi-search"></i></button>
			</div>
		</div>
		<div class="collapse" id="collapseExample">
		  <div class="card card-body">
		  	<div class="input-group">
				<input type="text" id="category-input" class="form-control">
				<button type="button" class="btn btn-outline-success btnCategoryAddOk"><i class="bi bi-save"></i></button>
			</div>
		  </div>
		</div>
		
		<div class="d-flex flex-column bd-highlight mt-3 px-2 category-list">
			<c:forEach var="vo" items="${listCategory}">
				<div class='row p-2 border category-row'>
					<div class='col-auto'>
						<input class='form-check-input me-1 category-item' type='checkbox' value='${vo.cNum}' checked> ${vo.cName}
						<a href='#'><i class='bi bi-dash-square category-item-delete' data-cNum='${vo.cNum}' style="float:right;"></i></a>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div>
</div>

<!-- 일정 상세 보기 Modal -->
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">일정 상세 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<table class="table">
					<tr>
						<td colspan="2" class="text-center align-middle">
							<p class="form-control-plaintext view-subject"></p>
						</td>
					</tr>
					<tr>
						<td class="table-light col-2 align-middle">일정분류</td>
						<td>
							<p class="form-control-plaintext view-category"></p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-2 align-middle">날 짜</td>
						<td>
							<p class="form-control-plaintext view-period"></p>
						</td>
					</tr>

 					<tr>
						<td class="table-light col-2 align-middle">등록일</td>
						<td>
							<p class="form-control-plaintext view-sRegDate"></p>
						</td>
					</tr>

 					<tr>
						<td class="table-light col-2 align-middle">내용</td>
						<td>
							<p class="form-control-plaintext view-sContent"></p>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-end">
							<button type="button" class="btn btn-outline-primary btnScheduleUpdate">일정 수정</button>
			    			<button type="button" class="btn btn-outline-danger btnScheduleDelete">일정 삭제</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/main.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/fullcalendar5/lib/locales-all.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

var calendar = null;
document.addEventListener('DOMContentLoaded', function() {
	const calendarEl = document.getElementById('calendar');

	calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		},
		initialView: 'dayGridMonth', // 처음 화면에 출력할 뷰
		locale: 'ko',
		editable: true,
		navLinks: true,
		dayMaxEvents: true,
		events: function(info, successCallback, failureCallback) {
			let url = "${pageContext.request.contextPath}/pluszone/schedule/month";
			let startDay = info.startStr.substr(0, 10);
			let endDay = info.endStr.substr(0, 10);
			let query = "start="+startDay+"&end="+endDay;
            
			let a = $(".category-list input:checkbox.category-item").length;
			let b = $(".category-list input:checkbox.category-item:checked").length;
            if(b !== 0 && a !== b) {
            	$('.category-list input:checkbox.category-item:checked').each(function() {
            		query += "&categorys=" + $(this).val();
            	});
            }
            
        	const fn = function(data){
        		// var events = eval(data.list);
        		// console.log(data.list);
        		successCallback(data.list);
        	};
        	
        	ajaxFun(url, "get", query, "json", fn);

		},
		selectable: true,
		selectMirror: true,
		select: function(info) {
			// 날짜의 셀을 선택하거나 드래그하면 일정 추가 화면으로 이동
			// console.log(info);
			insertSchedule(info.startStr, info.endStr, info.allDay);
			
			calendar.unselect(); // 현재 선택된 영역을 지움
		},
		eventClick: function(info) {
			// 일정 제목을 선택할 경우
			
			//  상세 일정 보기
			viewSchedule(info.event);
		},
		eventDrop: function(info) {
			// 일정을 드래그 한 경우
			
			// 수정하기
			updateDrag(info.event);
		},
		eventResize: function(info) {
			// 일정의 크기를 변경 한 경우
			
			// 수정하기
			updateDrag(info.event);
		},
		loading: function(bool) {
			// document.getElementById('scheduleLoading').style.display = bool ? 'block' : 'none';
		}
	});

	calendar.render();
});

$(function() {
	$('body').on('click', ".btnCategorySearch", function () {
		if($(".category-list input:checkbox.category-item:checked").length === 0) {
			return false;
		}
		
		// 카테고리 검색
		calendar.refetchEvents();
		
		$('#offcanvasExample').offcanvas('hide')
	});

});

// 일정 등록 폼
function insertSchedule(startStr, endStr, allDay) {
	let query;
	
	if(allDay) {
		query = "sday="+startStr;
		if(endStr) {
			endStr = daysLater(endStr, -1); // 종일 일정인 경우 끝나는 날짜가 +1 로 선택 되므로 -1 함 
			query += "&eday=" + endStr;
		}
		query += "&all_day=1";
	} else {
		query = "sday="+startStr.substr(0, 10);
		query += "&eday="+endStr.substr(0, 10);
		query += "&stime="+startStr.substr(11, 5);
		query += "&etime="+endStr.substr(11, 5);
		query += "&allDay=0";
	}

	location.href = "${pageContext.request.contextPath}/pluszone/schedule/write?"+query;
}

// 일정 상세 보기
function viewSchedule(calEvent) {
	$("#myDialogModal").modal("show");
	
	// console.log(calEvent);
	
	let sNum = calEvent.id;
	let title = calEvent.title;
	let color = calEvent.backgroundColor;
	// let start = calEvent.start;
	// let end = calEvent.end;
	let start = calEvent.startStr;
	let end = calEvent.endStr;
	let all_day = calEvent.all_day;

	let cNum = calEvent.extendedProps.cNum;
	if(! cNum) cNum = 0;
	let cName = calEvent.extendedProps.cName;
	if(! cName) cName = "설정하지 않음";
	
	let sDay = calEvent.extendedProps.sDay;
	let eDay = calEvent.extendedProps.eDay;
	let sTime = calEvent.extendedProps.sTime;
	let eTime = calEvent.extendedProps.eTime;
	
	let sContent = calEvent.extendedProps.sContent;
	if(! sContent) sContent = "";
	let sRegDate = calEvent.extendedProps.sRegDate;
	
	$(".btnScheduleUpdate").attr("data-num", sNum);
	$(".btnScheduleDelete").attr("data-num", sNum);
	
	let s;
	$(".view-subject").html(title);
	
	s = all_day ? "종일일정" : "시간일정";
	$(".view-category").html(cName + ", " + s);
	
	s = sDay;
	if( sTime ) {
		s += " "+sTime;
	}
	if( eDay && all_day ) {
		eDay = daysLater(eDay, -1);
		if(sDay < eDay) {
			s += " ~ " + eDay;
		}
	} else if( eDay ) {
		s += " ~ " + eDay;
	}
	if( eTime ) s += " " + eTime;
	$(".view-period").html(s);
	
	$(".view-sRegDate").html(sRegDate);
	
	$(".view-sContent").html(sContent);
}

$(function(){
	// 일정 수정 화면
	$(".btnScheduleUpdate").click(function(){
		let sNum = $(this).attr("data-num");
		location.href = "${pageContext.request.contextPath}/pluszone/schedule/update?sNum="+sNum;
	});

	// 일정 삭제
	$(".btnScheduleDelete").click(function(){
		if(! confirm("일정을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		const fn = function(data){
			var event = calendar.getEventById(sNum);
	        event.remove();
	        
	        $("#myDialogModal").modal("hide");
		};
		
		let sNum = $(this).attr("data-num");
		let query = "sNum="+sNum;
		let url = "${pageContext.request.contextPath}/pluszone/schedule/delete";

		ajaxFun(url, "post", query, "json", fn);
	});
});

// 일정을 드래그한 경우 일정 수정
function updateDrag(calEvent) {
	let num = calEvent.id;
	let title = calEvent.title;
	let color = calEvent.backgroundColor;
	let start = calEvent.startStr;
	let end = calEvent.endStr;
	let all_day = calEvent.all_day;
	
	let cNum = calEvent.extendedProps.cNum;
	if(! cNum) cNum = 0;
	
	let sContent = calEvent.extendedProps.sContent;
	if(! sContent) sContent = "";
	
	let startDate="", endDate="", startTime="", endTime="", allDay="";
	if(allDay) {
		startDate = start;
		endDate = end;
		allDay = "1";
	} else {
		startDate = start.substr(0, 10);
		endDate = end.substr(0, 10);
		startTime = start.substr(11, 5);
		endTime = end.substr(11, 5);
	}
	
	let query = "sNum="+sNum+"&subject="+title
			+ "&cNum="+cNum+"&color="+color
			+ "&allDay="+allDay
			+ "&sday="+startDate+"&eday="+endDate
			+ "&stime="+startTime+"&etime="+endTime
			+ "&sContent="+sContent;
	
	let url = "${pageContext.request.contextPath}/pluszone/schedule/updateDrag";

	const fn = function(data) {
		// 모든 소스의 이벤트를 다시 가져와 화면에 다시 렌더링
		calendar.refetchEvents();
	};
	ajaxFun(url, "post", query, "json", fn);
}

$(function(){
	// 카테고리 추가
	$(".btnCategoryAddOk").click(function(){
		let cName = $("#category-input").val().trim();
		if(! cName) {
			return false;
		}
		
		cName = encodeURIComponent(cName);
		let query = "cName="+cName;
		let url = "${pageContext.request.contextPath}/pluszone/schedule/categoryAdd";
		
		const fn = function(data) {
			if(data.state === "true") {
				$("#category-input").val("");
			
				$(".category-list").empty();
				
				let out = "";
				for(let idx = 0; idx < data.listCategory.length; idx++) {
					let item = data.listCategory[idx];
					out += "<div class='row p-2 border category-row'>";
					out += "  <div class='col-auto'>";
					out += "    <input class='form-check-input me-1 category-item' type='checkbox' value='"+item.cNum+"' checked>" + item.cName;
					out += "    <a href='#'><i class='bi bi-dash-square category-item-delete' data-cNum='" + item.cNum + "' style='float:right;'></i></a>";
					out += "  </div>";
					out += "</div>";
				}

				$(".category-list").html(out);
			};
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
	
	$(".btnDeleteIcon").click(function(){
		$(".category-item-minus").toggleClass("invisible");
	});
	
	$("body").on("click", ".category-item-delete", function(){
		if(! confirm("카테고리를 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		const $i = $(this);
		
		let query = "cNum="+$(this).attr("data-cNum");
		let url = "${pageContext.request.contextPath}/pluszone/schedule/categoryDelete";
		
		const fn = function(data) {
			if(data.state === "true") {
				$i.closest(".category-row").remove();
				
				calendar.refetchEvents();
			}
		};
		ajaxFun(url, "post", query, "json", fn);
	});
});
</script>