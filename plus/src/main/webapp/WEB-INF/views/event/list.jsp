<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
.tab-pane { min-height: 300px; }

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
	let menu = "${category}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/event/"+tab+"/list";
		location.href = url;
    });
});

function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main">
			

			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-progress" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="progress" aria-selected="true" data-tab="progress">진행중인 이벤트</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-ended" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="ended" aria-selected="true" data-tab="ended">종료된 이벤트</button>
				</li>
			</ul>
			
			
			
			<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">
									총 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}개</font> (${page}/${total_page} 페이지)
								</td>
								<td align="right">
									&nbsp;
								</td>
							</tr>
						</table>
						
						<div class="card mb-5 w-80 text-center" style="margin:0 auto">
					    	<div class="card-header">
					    		<h3>
					    			<i class="bi bi-calendar-event"></i> 이벤트
					    			<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list';" title="새로고침" style="float:right;">
						            	<i class="fa-solid fa-arrow-rotate-left"></i>
						            </button>
					    		</h3>
					    		<hr>			
				
				<table class="table table-hover board-list mt-4">
					<thead class="table-light">
						<tr>
							<th width="60">번호</th>
							<th>제목</th>
							<th width="140">시작일</th>
							<th width="140">종료일</th>
							<th width="70">조회수</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td>${dataCount - (page-1) * size - status.index}</td>
								<td class="left">
									<a href="${articleUrl}&eventNum=${dto.eventNum}" class="text-reset">${dto.subject}</a>
								</td>
								<td>${dto.startDate}</td>
								<td>${dto.endDate}</td>
								<td>${dto.hitCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
				</div>
	
				<table class="table">
					<tr>
						<td align="center">
						<form class="row" name="searchForm" action="${pageContext.request.contextPath}/event/${category}/list" method="post" style="width:300px; margin-left:15px;">
							<div class="input-group mb-1">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
									<option value="startDate" ${schType=="startDate"?"selected":""}>시작일</option>
									<option value="endDate" ${schType=="endDate"?"selected":""}>종료일</option>
								</select>
								<input type="text" name="kwd" value="${kwd}" class="form-control">
								<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
						</form>
						</td>
						</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</main>