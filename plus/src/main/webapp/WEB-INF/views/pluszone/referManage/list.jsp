<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.badge {
	display: inline-block; padding:2px 3px; background: #0d6efd; color: #fff; font-weight: 500;
	font-size: 11px;
}
</style>

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
				    			<i class="fas fa-clipboard-list"></i> 자료실
				    			<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pluszone/referManage/list';" title="새로고침" style="float:right;">
					            	<i class="fa-solid fa-arrow-rotate-left"></i>
					            </button>
				    		</h3>
			
		
							<table class="table table-border table-list">
								<thead>
									<tr>
										<th width="60">번호</th>
										<th>제목</th>
										<th width="100">작성일</th>
										<th width="70">조회수</th>
										<th width="50">표시</th>
									</tr>
								</thead>
							 
							 	<tbody>
									<c:forEach var="dto" items="${referManageList}">
											<tr>
												<td><span class="badge bg-primary">자료실</span></td>
												<td>${dto.className}</td>
												<td class="right">
													<a href="${articleUrl}&num=${dto.refNum}" class="text-reset">${dto.subject}</a>
												</td>
											
												
												<td class="text-center">${dto.regDate}</td>
												
												
											</tr>
										</c:forEach>
					
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr> 
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td>${dto.classNum}</td>
											<td class="left">
												<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
											<!-- 	<c:if test="${dto.gap < 1}"> -->
													<!-- 이미지 변경 요망 <img src='${pageContext.request.contextPath}/resources/images/new.gif'> -->
												</c:if>
											</td>
											
											<td>${dto.hitCount}</td>
											<td>${dto.showNotice == 1 ? "표시" : "숨김" }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							 
							<div class="page-navigation">
								${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
							</div>
							
							<table class="table">
								<tr>
									<td align="center">
										<form name="searchForm" action="${pageContext.request.contextPath}/pluszone/referManage/list?num=${dto.num}&page=${page}" method="post" style="width:300px; margin-left:100px">
											<div class="input-group mb-1">
												<select name="schType" class="form-select">
													<option value="all" ${schType=="all"?"selected":""}>제목 &amp; 내용</option>
													<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
													<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
													<option value="content" ${schType=="content"?"selected":""}>내용</option>
												</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-success" onclick="searchList()">검색</button>
											</div>
										</form>
									</td>
									<td align="right" width="100">
										<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pluszone/referManage/write';">글올리기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>