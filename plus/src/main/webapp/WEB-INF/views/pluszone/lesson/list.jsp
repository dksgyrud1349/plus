<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
} 

</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>


<c:url var="listUrl" value="/pluszone/lessonPlus/main">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}" />
		<c:param name="kwd" value="${kwd}" />
	</c:if>
	<c:if test="${not empty mainNum}">
		<c:param name="mainNum" value="${mainNum}" />
	</c:if>
	<c:if test="${not empty subNum}">
		<c:param name="subNum" value="${subNum}" />
	</c:if>
	<c:if test="${not empty tagNum}">
		<c:param name="tagNum" value="${tagNum}" />
	</c:if>
</c:url>

<script type="text/javascript">
	window.addEventListener('load', function() {
		let page = ${page};
		let pageSize = ${size};
		let dataCount = ${dataCount};
		let url = '${listUrl}';

		let total_page = pageCount(dataCount, pageSize);
		let paging = pagingUrl(page, total_page, url);

		document.querySelector('.dataCount').innerHTML = dataCount + '개 (' + page + '/' + total_page + '페이지)';

		document.querySelector('.page-navigation').innerHTML = dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
	});
	
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
	
	
	
	$(function(){
		$("form select[name=mainNum]").change(function(){
			let mainNum = $(this).val();
			
			$("form select[name=subNum]").find('option').remove().end()
				.append("<option value=''>서브카테고리</option>");	
			
			if(! mainNum) {
				return false;
			}
			
			let url = "${pageContext.request.contextPath}/lesson/listSubCategory";
			let query = "mainNum="+mainNum;
			
			const fn = function(data) {
				$.each(data.listSubCategory, function(index, item){
					let subNum = item.subNum;
					let subName = item.subName;
					let s = "<option value='"+subNum+"'>"+subName+"</option>";
					$("form select[name=subNum]").append(s);
				});
			};
			ajaxFun(url, "get", query, "json", fn);
			
		});
	});
</script>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 100%; margin: 5% auto;">
				<div class="body-main">

					<h3 class="mb-3 p-2" style="border-bottom: 3px solid #cccccc;">
						클래스 관리
						<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/pluszone/lessonPlus/main';" title="새로고침" style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>

						<button type="button" class="btn btn-success rere me-3" onclick="location.href='${pageContext.request.contextPath}/pluszone/lessonPlus/write';" style="float: right; background: #32B0E4; color: white;">등록하기</button>
					</h3>

					<div id="tab-content" style="padding: 15px 0px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">
									총 <span style="color: #32B0E4;">${dataCount}개</span> (${page}/${total_page} 페이지)
								</td>
								<td align="right">&nbsp;</td>
							</tr>
						</table>

						<div class="card mb-5 w-80 " style="margin: 0 auto">
							<table class="table table-hover table-list">
								<thead>
									<tr style="text-align: center">
										<th width="60">번호</th>
										<th>클래스</th>
										<th width="120">시작일</th>
										<th width="120">종료일</th>
										<th width="120">등록일</th>
										<th width="80">가격</th>
										<th width="120">메인카테고리</th>
										<th width="130">서브카테고리</th>
										<th width="100">해시태그</th>
										<th width="90">승인상태</th>
										<th width="110">신고여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr style="text-align: center">
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<c:url var="updateUrl" value="/pluszone/lessonPlus/update">
													<c:param name="classNum" value="${dto.classNum}" />
													<c:param name="page" value="${page}" />
												</c:url>
												<a href="${updateUrl}" class="text-reset" style="text-decoration: none;">${dto.className}</a>
											</td>
											<td>${dto.startDate}</td>
											<td>${dto.endDate}</td>
											<td>${dto.regDate}</td>
											<td>${dto.price}</td>
											<td>${dto.mainName}</td>
											<td>${dto.subName}</td>
											<td>${dto.tagName}</td>
											<td>${dto.memo}</td>
											<td>
												<button type="button" class="btn reportDetail" style="background: #47a3da; color: white;">
												자세히<input type="hidden" name="classNum" id="classNum" value="${dto.classNum}">
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 모달 창 -->
							<div class="modal fade" id="reportDetailModal" tabindex="-1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="staticBackdropLabel">신고</h1>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body"> 
										</div>
									</div>
								</div>
							</div>

							<table class="table">
								<tr>
									<td align="center">
										<form class="row" name="searchForm"
											action="${pageContext.request.contextPath}/pluszone/lessonPlus/main"
											method="post" style="width: 600px;">
											<div class="input-group mb-3">
												<select name="mainNum" class="form-select" style="width: 80px;">
													<option value="0">메인카테고리</option>
													<c:forEach var="vo" items="${listMainCategory}">
														<option value="${vo.mainNum}" ${mainNum == vo.mainNum ? "selected" : ""}>${vo.mainName}</option>
													</c:forEach>
												</select>
												<select name="subNum" class="form-select" style="width: 80px;">
													<option value="0">서브카테고리</option>
													<c:forEach var="vo" items="${listSubCategory}">
														<option value="${vo.subNum}" ${subNum == vo.subNum ? "selected" : ""}>${vo.subName}</option>
													</c:forEach>
												</select>
												<select name="schType" class="form-select" style="width: 80px;">
													<option value="className" ${schType=="className"?"selected":""}>클래스이름</option>
													<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
													<option value="memo" ${schType=="memo"?"selected":""}>승인상태</option>
													<option value="highPrice" ${schType=="highPrice"?"selected":""}>높은가격순</option>
													<option value="lowPrice" ${schType=="lowPrice"?"selected":""}>낮은가격순</option>
												</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-success rere" onclick="searchList()" style="background: #46AA46; color: white;">
													<i class="bi bi-search"></i>
												</button>
											</div>
										</form>
									</td>
								</tr>
							</table>

							<div class="page-navigation dataCount text-center mb-3">
								${dataCount == 0 ? "등록된 클래스가 없습니다." : paging}</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<script type="text/javascript">
$(function(){
	$(".reportDetail").click(function(){
		let classNum = $(this).find("input[name='classNum']").val();
		
		let url = '${pageContext.request.contextPath}/pluszone/lessonPlus/reportDetail';
		let query = 'classNum=' + classNum;
		
		const fn = function(data){
			var reportCount = data.reportCount;
			let html;
			html = '<div class="modal-body">';
			html += '	<div> 신고 개수 : ' + reportCount + '개</div>';
			html += '</div>';
			
			$("#reportDetailModal .modal-body").html(html);
			$("#reportDetailModal").modal("show");
		};
		
		ajaxFun(url, 'get', query, 'json', fn);
	});
});
</script>