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

.tabs {
	font-size: 20px; line-height: 20px;
}
.tabs ul:before, .tabs ul:after {
	content: ""; 
	display: block; 
	height: 0; 
	visibility: hidden;	
} 
.tabs ul:after { 
	clear: both; 
}
.tabs ul {
	margin:0;
	list-style:none;
	border-bottom: 1px solid #e0e0e0;
	zoom: 1;
}

.tabs ul li {
	position: relative;
	float: left;
	margin: 0;
}
.tabs ul li a {
	background: #f6f6f6;
	font-weight: bold;
	text-align: center;
	display: block;
	border: 1px solid #e0e0e0;
	color: #909090;
	text-shadow: 0 1px 0 rgba(255,255,255, 0.75);
	padding: 6px 25px; 
	margin: 0 10px -1px 0;
	border-top-left-radius: 15px;
	border-top-right-radius: 10px;
	text-decoration:none;
}
.tabs ul li a:hover {
	border-color: rgb(214, 241, 207);
	color: #606060;
}
.tabs ul li.active a {
	background: #fff;
	border-color: #d4d4d4;
	border-bottom: 1px solid #fff;
	color: #dd390d;
	margin-top: -4px;
	padding-top: 10px;
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
				
				<div class="tabs mb-5">
					<ul>
						<li><a href="${pageContext.request.contextPath}/faq/main">자주 묻는 질문</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
						<li><a href="${pageContext.request.contextPath}/etc/list">연락처/위치 안내</a></li>
						<li><a href="${pageContext.request.contextPath}/chatting/main">실시간 채팅</a></li>
						<li><a href="${pageContext.request.contextPath}/declaration/article">신고하기</a></li>
						<li><a href="${pageContext.request.contextPath}/suggest/article">제안하기</a></li>
						<li><a href="${pageContext.request.contextPath}/inquiryAd/list">문의하기</a></li>
					</ul>
				</div>
				
				<h3 class="mb-3 p-2" style="border-bottom:2px solid #32B0E4;">
	    			<i class="bi bi-pin-angle-fill"></i> 공지사항
	    			
	    			<button type="button" class="btn btn-outline-success rere" onclick="location.href='${pageContext.request.contextPath}/notice/list';" title="새로고침" style="float:right;">
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
									<form class="row" name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post" style="width:300px;">
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
											<th class="text-start">제목</th>
											<th width="90">작성자</th>
											<th width="150">작성일</th>
											<th width="110">조회수</th>
											<th width="50">파일</th>
										</tr>
									</thead>
																			
									<tbody>
										<c:forEach var="dto" items="${noticeList}">
											<tr>
												<td><span class="badge bg-primary">공지</span></td>
												<td class="right text-start">
													<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
												</td>
											
												
												<td>관리자</td>
												<td class="text-center">${dto.regDate}</td>
												<td class="text-center">${dto.hitCount}</td>
												<td>
												
													<c:if test="${dto.fileCount != 0}">
														<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
														
										<c:forEach var="dto" items="${list}" varStatus="status">
											<tr>
												<td>${dataCount - (page-1) * size - status.index}</td>
												<td class="left text-start">
													<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
													<c:if test="${dto.gap < 10}">
														<span class="badge text-bg-info">New</span>
													</c:if>
												</td>
												<td>관리자</td>
												<td>${dto.regDate}</td>
												<td>${dto.hitCount}</td>
												<td>
													<c:if test="${dto.fileCount != 0}">
														<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
													</c:if>
												</td>
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