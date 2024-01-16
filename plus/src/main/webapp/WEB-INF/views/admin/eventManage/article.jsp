<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
function deleteOk() {
	let query = 'eventNum=${dto.eventNum}&${query}&eventImg=${dto.eventImg}';
	let url = '${pageContext.request.contextPath}/admin/eventManage/${category}/delete?' + query;

	if(confirm('위 자료를 삭제 하시 겠습니까 ? ')) {
		location.href = url;
	}
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
});
</script>

<style>
img{
	width:80%;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
a{
	text-decoration: none;
	color : black;
}
</style>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
	                	<i class="fa-regular fa-calendar"></i> 이벤트 관리 
		            </h3>
				
					<div>
						<ul class="tabs">
							<li id="tab-all" data-category="all">전체 이벤트</li>
							<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
							<li id="tab-ended" data-category="ended">종료된 이벤트</li>
							<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
						</ul>
					</div>
					
					<div id="tab-content" style="clear: both;">
				    	<table class="table">
							<tr>
								<td align="left" width="50%">
									&nbsp;
								</td>
								<td align="right">
									&nbsp;
								</td>
							</tr>
						</table>
						
						<div class="card mb-5 w-80" style="margin:0 auto">
							<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
								<table class="table	">
									<thead>
										<tr>
											<td colspan="2" align="center">
												${dto.subject}
											</td>
										</tr>
									</thead>
									
									<tbody>
										<tr>
											<td width="50%" align="left">
												작성자 : ${dto.userName}
											</td>
											<td width="50%" align="right">
												조회 : ${dto.hitCount} / 출력여부 : ${dto.showEvent == 1 ? "표시" : "숨김" }
											</td>
										</tr>
						
										<tr>
											<td colspan="2" width="50%" align="left">
												이벤트 기간 : ${dto.startDate} ~ ${dto.endDate} 
											</td>
										</tr>
										<tr class="text-center">
											<td colspan="2" style="border-bottom: none;">
												<img src="${pageContext.request.contextPath}/uploads/photo/${dto.eventImg}" 
													class="img-fluid img-thumbnail w-100 h-auto">
											</td>
										</tr>
										<tr style="border-bottom: none;" class="text-center">
											<td colspan="2" valign="top" height="200">
												${dto.eContent}
											</td>
										</tr>
										<tr class="text-center">
											<td colspan="2">
												<div class="row">
													<div class="col">
														클래스번호
													</div>
													<div class="col">
														클래스명
													</div>
													<div class="col">
														플러스
													</div>
													<div class="col">
														가격
													</div>
												</div>
											</td>
										</tr>
										<c:forEach var="vo" items="${list}" varStatus="status">
											<tr class="text-center">
												<td colspan="2">
													
													<div class="row">
														<div class="col">
															${vo.classNum}
														</div>
														<div class="col">
															${vo.className}
														</div>
														<div class="col">
															${vo.nickName}님
														</div>
														<div class="col">
															${vo.price}원
														</div>
													</div>
												</td>
												
											</tr>
										</c:forEach>
										
										
										<tr>
											<td colspan="2">
												이전글 :
												<c:if test="${not empty prevDto}">
													<a href="${pageContext.request.contextPath}/admin/eventManage/${category}/article?${query}&eventNum=${prevDto.eventNum}">${prevDto.subject}</a>
												</c:if>
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												다음글 :
												<c:if test="${not empty nextDto}">
													<a href="${pageContext.request.contextPath}/admin/eventManage/${category}/article?${query}&eventNum=${nextDto.eventNum}">${nextDto.subject}</a>
												</c:if>
											</td>
										</tr>
									</tbody>
								</table>
									
								<table class="table">
									<tr>
										<td width="50%" align="left">
								    		<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/update?eventNum=${dto.eventNum}&page=${page}';">수정</button>
							    			<button type="button" class="btn btn-success rere" onclick="deleteOk();">삭제</button>
										</td>
						
										<td align="right">
											<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list?${query}';">리스트</button>
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