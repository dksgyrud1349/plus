<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; padding-top:5%">
				<div class="body-main">
				
					<h3 class="mb-3 p-2 text-center" style="border-bottom:3px solid black;">
						<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pluszone/booking/lessonList';" title="뒤로가기" style="float: left;">
							<i class="bi bi-arrow-left"></i>
						</button>
						<i class="bi bi-app"></i> 클래스의 상세시간
						<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pluszone/booking/detailList?classNum=${classNum}';" title="새로고침" style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>
					</h3>

					<table class="table table-hover table-list">
						<thead>
							<tr style="text-align: center">
								<th width="60">번호</th>
								<th width="150">수업시작일</th>
								<th width="150">최대 인원수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr style="text-align: center">
									<td>${dataCount - (detailPage-1) * size - status.index}</td>
									<td class="left">
										<c:url var="bookUrl" value="/pluszone/booking/bookList">
											<c:param name="detailNum" value="${dto.detailNum}"/>
										</c:url> 
										<a href="${bookUrl}" class="text-reset" style="text-decoration: none;">${dto.classDate}</a>
									</td>
									<td>${dto.count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<h4 class="text-center mb-4">총 <font style="color: green; font-weight: bold; text-decoration: underline">${dataCount}개</font></h4>
				</div>
			</div>
		</div>
	</div>
</main>