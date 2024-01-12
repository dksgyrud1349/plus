<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<style>
.rere {
	color: white;
	background: #46AA46; 
	padding: 6px 12px 6px 12px;
	border: none;
}
a{
	text-decoration:none;
	color:black;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#tab-0").addClass("active");

		$("ul.tabs li")
				.click(
						function() {
							let tab = $(this).attr("data-tab");

							$("ul.tabs li").each(function() {
								$(this).removeClass("active");
							});

							$("#tab-" + tab).addClass("active");

							let url = "${pageContext.request.contextPath}/pluszone/plusInq/inqOkList";
							location.href = url;
						});
	});

	function login() {
		location.href = '${pageContext.request.contextPath}/member/login';
	}

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

					<h3 class="mb-3 p-2" style="border-bottom: 3px solid black;">
						<i class="fa-solid fa-user-group"></i> 클래스 문의 내역
						<button type="button" class="btn btn-success rere"
							onclick="location.href='${pageContext.request.contextPath}/pluszone/plusInq/inqList';"
							style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>
					</h3>

					<div>
						<ul class="tabs">
							<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;문의
								답변대기</li>
							<li id="tab-1" data-tab="1"><i
								class="fa-solid fa-chart-column"></i>&nbsp;문의 답변완료</li>
						</ul>
					</div>

					<div id="tab-content" style="padding: 20px 0px 0;">
						<table class="table">
							<tr>
								<td align="left" width="70%" style="font-weight: bold">
									답변대기 <font
									style="color: green; font-weight: bold; text-decoration: underline">${dataCount}명</font>
									(${page}/${total_page} 페이지)
								</td>
								<td align="right">
									<form name="searchForm" action="${pageContext.request.contextPath}/pluszone/plusInq/inqList" style="width: 300px; margin-left: 100px">
										<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="inquiryDate"
													${schType=="inquiryDate"?"selected":""}>문의일자순</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select> <input type="text" name="kwd" value="${kwd}"
												class="form-control">
											<button type="button" class="btn btn-success rere"
												onclick="searchList()">
												<i class="bi bi-search"></i>
											</button>
										</div>
									</form>
								</td>
							</tr>
						</table>

						<div class="card mb-5 w-80 text-center" style="margin: 0 auto">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th width="90">번호</th>
												<th>제목</th>
												<th width="150">문의일</th>
												<th width="150">답변일</th>
												<th width="90">답변여부</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="dto" items="${list}" varStatus="status">
												<tr class="hover">
													<td>${dataCount - (page-1) * size - status.index}</td>
													<td class="left">
														<a href="${pageContext.request.contextPath}/pluszone/plusInq/article1?inquiryNum=${dto.inquiryNum}">${dto.subject}</a>
													</td>
													<td>${dto.inquiryDate}</td>
													<td>${empty dto.reInquiryDate ? "" : dto.reInquiryDate}</td>
													<td>${dto.reInquiryNum == 0 ? "대기" : "완료"}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="page-navigation">${dataCount == 0 ? "내역이 없습니다." : paging}
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<div id="member-dialog" style="display: none;"></div>
