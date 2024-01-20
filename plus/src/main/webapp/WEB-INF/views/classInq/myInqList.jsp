<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table td{
	height:60px;
	line-height: 60px;
}
.rere {
	color: white;
	background: #32B0E4;
	padding: 6px 12px 6px 12px;
	border: none;
}
a:hover {color: #32B0E4;}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
			<div class="body-container" style="width: 100%; margin: 10% auto; ">
				<div class="body-main" style="width: 100%;">
				
				<h3 class="mb-3 p-2" style="border-bottom:2px solid gray;">클래스 문의내역
					
					<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/classInq/myInqList';" title="새로고침" style="float:right; background: #32B0E4;">
						<i class="bi bi-arrow-counterclockwise"></i>
					</button>
				</h3>
				
				<div id="tab-content" style="padding: 15px 0px 5px; clear: both;">
					<div>
						총 <span class="fw-semibold" style="color: #32B0E4;">${dataCount}개</span> (${page}/${total_page} 페이지)
					</div>
					<div class="card mb-5 w-80 mt-4 text-center" style="margin:0 auto; border:none;">
						<table class="table table-border table-list table-hover">
							<thead>
								<tr style="border-top: 1px solid #d8d8d8;">
									<th width="60">번호</th>
									<th>제목</th>
									<th width="150">문의일</th>
									<th width="150">답변일</th>
									<th width="90">답변여부</th>
								</tr>
							</thead>
					
							<tbody>
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr>
										<td>${dataCount - (page-1) * size - status.index}</td>
										<td class="left">
											<a href="${pageContext.request.contextPath}/classInq/article?inquiryNum=${dto.inquiryNum}" style="font-weight: normal;">${dto.subject}</a>
										</td>
										<td>${dto.inquiryDate}</td>
										<td>${empty dto.reInquiryDate ? "" : dto.reInquiryDate}</td>
										<c:if test="${dto.reInquiryNum == 0}">
											<td style="color: red;">대기</td>
										</c:if>
										<c:if test="${dto.reInquiryNum == 1}">
											<td style="color: #32B0E4;">완료</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				
						<table class="table">
							<tr>
								<td align="center">
									<form name="searchForm" action="${pageContext.request.contextPath}/classInq/myInqList" style="width:300px; margin-left:100px">
										<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="userName" ${schType=="inquiryDate"?"selected":""}>문의일</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-success rere" onclick="searchList()" style="background: #32B0E4;"> <i class="bi bi-search"></i> </button>
										</div>
									</form>
								</td>
								<td align="right" width="120"></td>
							</tr>
						</table>
						
						<div class="page-navigation text-center mb-3">
							${dataCount == 0 ? "등록된 문의글이 없습니다." : paging}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
