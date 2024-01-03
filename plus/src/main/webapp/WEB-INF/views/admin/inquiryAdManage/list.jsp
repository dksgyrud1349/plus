<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table td{
	height:60px;
	line-height: 60px;
}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:10% auto; ">
				<div class="body-main">
				
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
				<i class="bi bi-question-diamond"></i> 1:1 문의 
				
				<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/inquiryAdManage/list';" title="새로고침" style="float:right;">
					<i class="bi bi-arrow-counterclockwise"></i>
				</button>
			</h3>

	        <div id="tab-content">
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
			
				<table class="table table-hover board-list">
					<thead class="table-light">
						<tr>
							<th width="10" class="text-center">번호</th>
							<th width="70" class="text-center">제목</th>
							<th width="20" class="text-center">작성자</th>
							<th width="60" class="text-center">문의일자</th>
							<th width="60" class="text-center">처리일자</th>
							<th width="40" class="text-center">처리결과</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td class="text-center">${dataCount - (page-1) * size - status.index}</td>
								<td class="left">
									<a href="${articleUrl}&inquiryNum=${dto.inquiryNum}">${dto.subject}</a>
								</td>
								<td class="text-center">${dto.userName}</td>
								<td class="text-center">${dto.inquiryDate}</td>
								<td class="text-center">${dto.reInquiryDate}</td>
								<td class="text-center">${(empty dto.reInquiryDate)?"답변대기":"답변완료"}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<table class="table">
					<tr>
						<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/inquiryAdManage/list" method="post" style="width:300px; margin-left:100px">
							<div class="input-group mb-1">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
									<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
									<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
									<option value="content" ${schType=="content"?"selected":""}>내용</option>
								</select>
								<input type="text" name="kwd" value="${kwd}" class="form-control">
								<button type="button" class="btn btn-success" onclick="searchList()" style="float:right;"> <i class="bi bi-search"></i> </button>	
							</div>
						</form>
					</td>
					<td align="right" width="120"></td>
				</tr>
			</table>
			
			<div class="page-navigation text-center mb-3">
					${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>
		</div>
	</div>
</div>
</div>
</div>
</main>	