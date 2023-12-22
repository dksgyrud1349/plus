<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
 
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		   
		<div class="container-fluid px-7">
			<div class="body-container" style="width:100%; margin:5% auto; ">
				<div class="body-main">
					<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						</div>
						<table class="table">
							<tr>
								<td align="left" width="50%">
									총 <font style="color:black; font-weight:bold; text-decoration:underline">${dataCount}개</font> (${page}/${total_page} 페이지)
								</td>
								<td align="right">	
									&nbsp;
								</td>
							</tr>
						</table>
					
					<div style="background-color: white;">
									
						<div class="card mb-5 w-80" style="margin:0 auto; border: 1px solid #cccccc;">
					    	 <div style="background-color: white;">


                            <div class="card-header" style="text-align: center;">
					    	
					    		<h3>
					    		
					    			<i class="fas fa-clipboard-list"  ></i> 공지사항
					    			
					    			<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/notice/list';" title="새로고침" style="float:right;">
						            	<i class="fa-solid fa-arrow-rotate-right"></i>
						            </button>
					    		</h3>
					    	
							</div>
								<table class="table table-hover board-list mt-7">
									<thead class="table-light ">
									<thead style="background-color: white;">
									
									
										<tr>
											<th width="60">번호</th>
											<th>제목</th>
											<th width="100">작성자</th>
											<th width="100">작성일</th>
											<th width="70">조회수</th>
											<th width="50">파일</th>
										</tr>
									</thead>
													
							<!-- 								
							<thead>
						    <tr>
						      <th scope="col">번호</th>
						      <th scope="col">제목</th>
						      <th scope="col">작성자</th>
						      <th scope="col">작성일</th>
						      <th scope="col">조회수</th>
						      <th scope="col">파일</th>
						    </tr>
						  </thead>
								 -->							
									<tbody>
									
										<c:forEach var="dto" items="${noticeList}">
											<tr>
												<td><span class="badge bg-primary">공지</span></td>
												<td class="right">
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
												<td class="left">
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
								
								<div class="page-navigation">
									${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
								</div>
					
								<table class="table">
									<tr>
										<td align="center">
										<form class="row" name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post" style="width:300px; margin-left:15px;">
											<div class="input-group mb-1">
												<select name="schType" class="form-select">
													<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
													<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
													<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
													<option value="content" ${schType=="content"?"selected":""}>내용</option>
												</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
											</div>
										</form>
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