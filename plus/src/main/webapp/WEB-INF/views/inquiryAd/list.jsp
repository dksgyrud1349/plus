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
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
.miyul {
	color: #828282;
}
.yul {
	color: #3c3c3c;
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
						<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
						<li><a href="${pageContext.request.contextPath}/etc/list">연락처/위치 안내</a></li>
						<li><a href="${pageContext.request.contextPath}/chatting/main">실시간 채팅</a></li>
						<li><a href="${pageContext.request.contextPath}/declaration/article">신고하기</a></li>
						<li><a href="${pageContext.request.contextPath}/suggest/article">제안하기</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/inquiryAd/list">문의하기</a></li>
					</ul>
				</div>
				
				<h3 class="mb-3 p-2" style="border-bottom:2px solid #32B0E4;">
					<i class="bi bi-question-diamond"></i> 1:1 문의
					
					<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/list';" title="새로고침" style="float:right;">
						<i class="bi bi-arrow-counterclockwise"></i>
					</button>
					
					<button type="button" class="btn btn-success rere me-3" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/write';" style="float:right;">질문등록</button>
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
		
					<div class="card mb-5 w-80 text-center" style="margin:0 auto; border:none;">
						<table class="table table-border table-list table-hover">
							<thead>
								<tr>
									<th width="50">번호</th>
									<th>제목</th>
									<th width="70">작성자</th>
									<th width="140">문의일자</th>
									<th width="230">처리일자</th>
									<th width="110">처리결과</th>
								</tr>
							</thead>
					
							<tbody>
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr>
										<td>${dataCount - (page-1) * size - status.index}</td>
										<td class="left">
											<a href="${articleUrl}&inquiryNum=${dto.inquiryNum}">${dto.subject}</a>
										</td>
										<td>${dto.userName}</td>
										<td>${dto.inquiryDate}</td>
										<td>${dto.reInquiryDate}</td>
										<td>
										<c:choose>
							                <c:when test="${dto.reInquiryDate == null}">
							                    <span class="fw-bold miyul"><i class="bi bi-x-circle" style="color: red"></i>&nbsp;답변대기</span>
							                </c:when>
							                <c:otherwise>
							                    <span class="fw-bold yul"><i class="bi bi-check-circle" style="color: green"></i>&nbsp;답변완료</span>
							                </c:otherwise>
							            </c:choose>
							            </td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				
						<table class="table">
							<tr>
								<td align="center">
									<form name="searchForm" action="${pageContext.request.contextPath}/inquiryAd/list" method="post" style="width:300px; margin-left:100px">
										<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-secondary" onclick="searchList()"> <i class="bi bi-search"></i> </button>
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
	</div>
</main>
