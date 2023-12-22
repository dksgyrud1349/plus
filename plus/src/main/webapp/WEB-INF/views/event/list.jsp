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



#box {
  border-radius: 8px;
  transition: all 0.3s cubic-bezier(0.42, 0.0, 0.58, 1.0);
}

#box:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
  transform: translateY(-10px);
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
				
				<h3>
		    			<i class="bi bi-calendar-event"></i> 이벤트 
		    			<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list';" title="새로고침" style="float:right;">
			            	<i class="fa-solid fa-arrow-rotate-left"></i>
			            </button>
		    		</h3>
		    		<hr>
				
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
								총 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}건</font> (${page}/${total_page} 페이지)
							</td>
							<td align="right">
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
						
		    		
						
					<div class="row mt-5">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div class="card p-1 me-3 mb-5 mx-4" id="box" style="width: 16rem; height: 30rem; border:0.8px solid #cccccc;">
							<c:choose>
								<c:when test="${dto.eventImg != null}">
									<img src="${pageContext.request.contextPath}/uploads/photo/${dto.eventImg}"  class="card-img-top"  alt="...">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/images/Image-folder.jpg"  class="card-img-top"  alt="...">
								</c:otherwise>
							</c:choose>
							
							<div class="card-header">
								<h6 class="card-title pb-1 text-start" style="margin-top:10px;">
									${dataCount - (page-1) * size - status.index}. <a href="${articleUrl}&eventNum=${dto.eventNum}" class="text-reset">${dto.subject}</a>
								</h6>
							</div>
							<div class="card-body">
								<p class="card-text" style="margin-top:10px;"> <i class="bi bi-calendar-check"></i> 시작날짜 ${dto.startDate}</p>
								<p class="card-text"> <i class="bi bi-calendar-check"></i> 종료날짜 ${dto.endDate}</p>	
							</div>
							<div class="card-footer">
								<p class="card-end" style="float:right; margin-top:10px;"><i class="bi bi-eye-fill"></i> ${dto.hitCount}</p>
							</div>
						</div>
					</c:forEach>
				</div>
						
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
				</div>
	
				<table class="table">
					<tr>
						<td align="center">
						
						</td>
						</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>