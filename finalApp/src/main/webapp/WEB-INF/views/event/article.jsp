<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 850px;
}

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

.table img {
	max-width: 650px;
}
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


</script>

<div class="container" style="margin-top: 10%; width: 65%;">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-calendar-event"></i> 이벤트 게시물</h3>
		</div>
		
		<div class="body-main">

			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-progress" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="progress" aria-selected="true" data-tab="progress">진행중인 이벤트</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-ended" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="ended" aria-selected="true" data-tab="ended">종료된 이벤트</button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="nav-tabContent">
			
				<table class="table mb-0">
					<thead>
						<tr>
							<td colspan="2" align="center">
								${dto.subject}
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td width="50%">
								이벤트 기간 : ${dto.startDate} ~ ${dto.endDate}
							</td>
							<td align="right">
								조회 : ${dto.hitCount}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" style="border-bottom: none;">
								<img src="${pageContext.request.contextPath}/uploads/photo/${dto.eventImg}" 
									class="img-fluid img-thumbnail w-100 h-auto">
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="top" height="200">
								${dto.eContent}
							</td>
						</tr>
						
												
						<c:if test="category == 'ended'">
							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button" class="btn btn-outline-secondary"> 종료된 이벤트입니다. </button>
								</td>
							</tr>
						</c:if>						

						<tr>
							<td colspan="2">
								이전글 :
								<c:if test="${not empty prevDto}">
									<a href="${pageContext.request.contextPath}/event/${category}/article?${query}&eventNum=${prevDto.eventNum}">${prevDto.subject}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								다음글 :
								<c:if test="${not empty nextDto}">
									<a href="${pageContext.request.contextPath}/event/${category}/article?${query}&eventNum=${nextDto.eventNum}">${nextDto.subject}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td width="50%">&nbsp;</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>
			
			</div>
		</div>
	</div>
</div>

