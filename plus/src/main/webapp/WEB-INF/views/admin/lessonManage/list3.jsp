<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table td{
	height:60px;
	line-height: 60px;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
a{
	text-decoration: none;
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/admin/lessonManage/list3">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}" />
		<c:param name="kwd" value="${kwd}" />
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
			<div class="body-container" style="width: 80%; margin: 5% auto;">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="bi bi-app"></i> 승인취소 클래스 관리
						<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/lessonManage/list3';" title="새로고침" style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>
					</h3>
				
					<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">총 <font
									style="color: green; font-weight: bold; text-decoration: underline">${dataCount}개</font>
									(${page}/${total_page} 페이지)
								</td>
								<td align="right">&nbsp;</td>
							</tr>
						</table>

						<div class="card mb-5 w-80 " style="margin: 0 auto">
							<div class="card-header text-center">
								
							</div>

							<table class="table table-hover table-list">
								<thead>
									<tr style="text-align: center">
										<th width="60">번호</th>
										<th>클래스 이름</th>
										<th width="150">시작일자</th>
										<th width="150">종료일자</th>
										<th width="150">등록일자</th>
										<th width="100">가격</th>
										<th width="90">승인결과</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr style="text-align: center">
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<c:url var="url" value="/admin/lessonManage/article3">
													<c:param name="classNum" value="${dto.classNum}" />
													<c:param name="page" value="${page}" />
													<c:if test="${not empty kwd}">
														<c:param name="schType" value="${schType}" />
														<c:param name="kwd" value="${kwd}" />
													</c:if>
												</c:url>
												<a href="${url}" class="text-reset">${dto.className}</a>
											</td>
											<td>${dto.startDate}</td>
											<td>${dto.endDate}</td>
											<td>${dto.regDate}</td>
											<td>${dto.price}</td>
											<td>${dto.memo}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<table class="table">
								<tr>
									<td align="center">
										<form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/lessonManage/list3" method="post" style="width: 300px; margin-left: 100px">
											<div class="input-group mb-3">
												<select name="schType" class="form-select">
													<option value="className" ${schType=="className"?"selected":""}>클래스이름</option>
													<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
												</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-success rere" onclick="searchList()">
													<i class="bi bi-search"></i>
												</button>
											</div>
										</form>
									</td>
									<td align="right" width="120"></td>
								</tr>
							</table>
							
							<div class="page-navigation dataCount text-center mb-3">
								${dataCount == 0 ? "등록된 클래스가 없습니다." : paging}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>