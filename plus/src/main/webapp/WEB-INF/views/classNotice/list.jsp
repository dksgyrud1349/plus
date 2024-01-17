<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main">
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
	    			<i class="bi bi-pin-angle-fill"></i> 공지사항
	    			
	    			<button type="button" class="btn btn-outline-success rere" onclick="location.href='${pageContext.request.contextPath}/classNotice/list?classNum=${classNum}';" title="새로고침" style="float:right;">
		            	<i class="fa-solid fa-arrow-rotate-left"></i>
		            </button>
	    		</h3>
				
					<div id="tab-content">
						</div>
						<table class="table">
							<tr>
								<td align="left">
									총 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}개</font> (${page}/${total_page} 페이지)
								</td>
								<td align="right">	
									<form class="row" name="searchForm" action="${pageContext.request.contextPath}/classNotice/list" style="width:300px;">
										<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-secondary" onclick="searchList()"> <i class="bi bi-search"></i> </button>
										</div>
										<input type="hidden" name="classNum" value="${classNum}">
									</form>
								</td>
							</tr>
						</table>
									
						<div class="card w-80" style="border: none;">
					    	 <div style="background-color: white;">
								<table class="table table-hover text-center">
									<thead class="table-light">
									<thead>
										<tr>
											<th width="80">번호</th>
											<th style="text-align: center;">제목</th>
											<th width="90">작성자</th>
											<th width="150">작성일</th>
											<th width="110">조회수</th>
										</tr>
									</thead>
																			
									<tbody>
										<c:forEach var="dto" items="${notices}">
											<tr>
												<td><span class="badge bg-primary">공지</span></td>
												<td>
													<a href="${articleUrl}&num=${dto.num}&classNum=${classNum}">${dto.subject}</a>
												</td>
												<td>${dto.nickName}</td>
												<td class="text-center">${dto.regDate}</td>
												<td class="text-center">${dto.hitCount}</td>
											</tr>
										</c:forEach>
														
										<c:forEach var="dto" items="${noticeList}" varStatus="status">
											<tr>
												<td>${dataCount - (page-1) * size - status.index}</td>
												<td>
													<a href="${articleUrl}&num=${dto.num}&classNum=${classNum}" class="text-reset">${dto.subject}</a>
												</td>
												<td>${dto.nickName}</td>
												<td>${dto.regDate}</td>
												<td>${dto.hitCount}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<div class="page-navigation text-center mb-3">
									${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>