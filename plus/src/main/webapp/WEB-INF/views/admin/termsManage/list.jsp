<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
.badge {
	display: inline-block; padding:2px 3px; background: #0d6efd; color: #fff; font-weight: 500;
	font-size: 11px;
}

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
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
		    			<i class="fas fa-clipboard-list"></i> 서비스 이용약관
		    			<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/termsManage/list';" title="새로고침"  style="float:right;">
			            	<i class="fa-solid fa-arrow-rotate-left"></i>
			            </button>
			            <button type="button" class="btn btn-success me-3" onclick="location.href='${pageContext.request.contextPath}/admin/termsManage/write';" style="float:right;">글올리기</button>
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
					
					<div class="card mb-5 w-80 text-center" style="margin:0 auto">
							<table class="table table-border table-list table-hover">
								<thead>
									<tr>
										<th width="60">번호</th>
										<th>제목</th>
									</tr>
								</thead>
							 
							 	<tbody>					
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr>								<!-- status.index@ -->
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<table class="table">
								<tr>
									<td align="center">
										<form name="searchForm" action="${pageContext.request.contextPath}/admin/termsManage/list" method="post" style="width:300px; margin-left:100px">
											<div class="input-group mb-1">
												<select name="schType" class="form-select">
													<option value="all" ${schType=="all"?"selected":""}>제목 &amp; 내용</option>
													<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
													<option value="content" ${schType=="content"?"selected":""}>내용</option>
												</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-success" onclick="searchList()">검색</button>
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