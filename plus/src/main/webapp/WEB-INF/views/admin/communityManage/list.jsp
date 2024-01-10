<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table td{
	height:60px;
	line-height: 60px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/admin/communityManage/list">
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
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
                      	<i class="bi bi-app"></i> 커뮤니티 관리
	                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/communityManage/list';" title="새로고침" style="float:right;">
	                    	<i class="fa-solid fa-arrow-rotate-left"></i>
	                    </button>
	                </h3>
				
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
							
						<div class="card mb-5 w-80 " style="margin:0 auto">
							<table class="table table-hover table-list">
								<thead>
									<tr>
										<th width="60" class="text-center">번호</th>
										<th>제목</th>
										<th width="100" class="text-center">작성자</th>
										<th width="150" class="text-center">작성일</th>
										<th width="70" class="text-center">조회수</th>
									</tr>
								</thead>
							<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr>
									<td class="text-center">${dataCount - (page-1) * size - status.index}</td>
									<td class="left">
										<c:url var="url" value="/admin/communityManage/article">
											<c:param name="num" value="${dto.num}"/>
											<c:param name="page" value="${page}"/>
											<c:if test="${not empty kwd}">
												<c:param name="schType" value="${schType}"/>
												<c:param name="kwd" value="${kwd}"/>
											</c:if>									
										</c:url>
										<a href="${url}" class="text-reset">${dto.subject}</a>
										<c:if test="${dto.replyCount!=0}"> (${dto.replyCount})</c:if>
									</td>
									<td class="text-center">${dto.userName}</td>
									<td class="text-center">${dto.regDate}</td>
									<td class="text-center">${dto.hitCount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			
					<table class="table">
						<tr>
							<td align="center">
								<form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/communityManage/list" method="post" style="width:300px; margin-left:100px">
									<div class="input-group mb-3">
										<select name="schType" class="form-select">
											<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
											<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
											<option value="reg_date" ${schType=="regDate"?"selected":""}>등록일</option>
											<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
											<option value="content" ${schType=="content"?"selected":""}>내용</option>
										</select>
									
										<input type="text" name="kwd" value="${kwd}" class="form-control">
										<button type="button" class="btn btn-outline-secondary" onclick="searchList()"> <i class="bi bi-search"></i> </button>
									</div>
								</form>
							</td>
					
							<td align="right" width="120">
								
							</td>
						</tr>
					</table>
					
					<div class="page-navigation dataCount">
						${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</main>