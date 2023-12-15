<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/bbs/list">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}"/>
		<c:param name="kwd" value="${kwd}"/>
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener('load', function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = '${listUrl}'; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector('.dataCount').innerHTML = dataCount + '개 ('
			+ page + '/' + total_page + '페이지)';

	document.querySelector('.page-navigation').innerHTML = 
		dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
});
</script>

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
				
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
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
					
					<div class="card mb-5 w-80 text-center" style="margin:0 auto">
				    	<div class="card-header">
				    		<h3>
				    			<i class="bi bi-app"></i> 커뮤니티
				    			<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/bbs/list';" title="새로고침" style="float:right;">
					            	<i class="fa-solid fa-arrow-rotate-left"></i>
					            </button>
				    		</h3>
				    		<hr>

							<table class="table table-hover board-list">
								<thead class="table-light">
									<tr>
										<th width="60">번호</th>
										<th>제목</th>
										<th width="100">작성자</th>
										<th width="100">작성일</th>
										<th width="70">조회수</th>
										
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr>
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<c:url var="url" value="/bbs/article">
													<c:param name="num" value="${dto.num}"/>
													<c:param name="page" value="${page}"/>
													<c:if test="${not empty kwd}">
														<c:param name="schType" value="${schType}"/>
														<c:param name="kwd" value="${kwd}"/>
													</c:if>									
												</c:url>
												<a href="${url}" class="text-reset">${dto.subject}</a>
												<c:if test="${dto.replyCount!=0}">(${dto.replyCount})</c:if>
											</td>
											<td>${dto.userName}</td>
											<td>${dto.regDate}</td>
											<td>${dto.hitCount}</td>
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
			
							<div class="page-navigation"></div>
			
							<table class="table">
									<tr>
										<td align="center">
						
									<form class="row" name="searchForm" action="${pageContext.request.contextPath}/bbs/list" method="post" style="width:300px; margin-left:15px;">
											<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
												<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-success" onclick="searchList()"> <i class="bi bi-search"></i> </button>
										</div>
									</form>
								</td>
							</tr>
						</table>
						<div class="col text-end">
							<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/bbs/write';">글올리기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</main>
