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
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="bi bi-app"></i> 클래스 리스트
						<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/pluszone/booking/lessonList';" title="새로고침" style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>
					</h3>
					<form action="${pageContext.request.contextPath}/pluszone/booking/lessonList" name="searchForm" method="post">
						<div class="col-2 input-group" style="float: right; width: 16.66%;">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
							<button type="button" class="btn btn-secondary me-1" onclick="searchList()">
								<i class="bi bi-search"></i>
							</button>
						</div>
						<div class="col-2" style="float: right; width: 16.66%;">
							<select name="schType" class="form-select">
								<option value="className" ${schType=="className"?"selected":""}>클래스이름</option>
								<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
							</select> 
						</div>
					</form>

					<table class="table table-hover table-list">
						<thead>
							<tr style="text-align: center">
								<th width="50" class="text-center">번호</th>
								<th class="text-center">클래스</th>
								<th width="120" class="text-center">시작일</th>
								<th width="120" class="text-center">종료일</th>
								<th width="120" class="text-center">등록일</th>
								<th width="90" class="text-center">가격</th>
								<th width="120" class="text-center">메인카테고리</th>
								<th width="120" class="text-center">서브카테고리</th>
								<th width="120" class="text-center">해시태그</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr style="text-align: center">
									<td>${dataCount - (page-1) * size - status.index}</td>
									<td class="left">
										<c:url var="detailUrl" value="/pluszone/booking/detailList">
											<c:param name="classNum" value="${dto.classNum}"/>
										</c:url> 
										<a href="${detailUrl}" class="text-reset" style="text-decoration: none;">${dto.className}</a>
									</td>
									<td>${dto.startDate}</td>
									<td>${dto.endDate}</td>
									<td>${dto.regDate}</td>
									<td>${dto.price}</td>
									<td>${dto.mainName}</td>
									<td>${dto.subName}</td>
									<td>${dto.tagName}</td>
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