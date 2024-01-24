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
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
a{
	text-decoration: none;
	color : black;
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
	    			<i class="bi bi-pin-angle-fill"></i> 공지사항 관리
	    			<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/list';" title="새로고침" style="float:right;">
		            	<i class="fa-solid fa-arrow-rotate-left"></i>
		            </button>
		            <button type="button" class="btn btn-success me-3 rere" onclick="location.href='${pageContext.request.contextPath}/admin/noticeManage/write';" style="float:right;">글올리기</button>
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
							<table class="table table-border table-list">
								<thead>
									<tr>
										<th width="60">번호</th>
										<th>제목</th>
										<th width="80">작성자</th>
										<th width="110">작성일</th>
										<th width="70">조회수</th>
										<th width="50">첨부</th>
										<th width="70">표시</th>
									</tr>
								</thead>
							 
							 	<tbody>
									<c:forEach var="dto" items="${noticeList}">
										<tr> 
											<td><span class="badge">공지</span></td>
											<td class="left">
												<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
											</td>
											<td>${dto.userName}</td>
											<td>${dto.regDate}</td>
											<td>${dto.hitCount}</td>
											<td>
												<c:if test="${dto.fileCount != 0}">
													<a href="${pageContext.request.contextPath}/admin/noticeManage/zipdownload?num=${dto.num}">
														<i class="fa-solid fa-file-zipper"></i>
													</a>
												</c:if>		      
											</td>
											<td>&nbsp;</td>
										</tr>
									</c:forEach>
					
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr> 
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
												<c:if test="${dto.gap < 1}">
													<!-- 이미지 변경 요망 <img src='${pageContext.request.contextPath}/resources/images/new.gif'> -->
												</c:if>
											</td>
											<td>${dto.userName}</td>
											<td>${dto.regDate}</td>
											<td>${dto.hitCount}</td>
											<td>
												<c:if test="${dto.fileCount != 0}">
													<a href="${pageContext.request.contextPath}/admin/noticeManage/zipdownload?num=${dto.num}"><i class="fa-solid fa-file-zipper"></i></a>
												</c:if>		      
											</td>
											<td>											
											<c:choose>
								                <c:when test="${dto.showNotice == 1}">
								                    <span>표시</span>
								                </c:when>
								                <c:otherwise>
								                    <span>숨김</span>
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
										<form name="searchForm" action="${pageContext.request.contextPath}/admin/noticeManage/list" method="post" style="width:300px;">
											<div class="input-group mb-1">
												<select name="schType" class="form-select">
													<option value="all" ${schType=="all"?"selected":""}>제목 &amp; 내용</option>
													<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
													<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
													<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
													<option value="content" ${schType=="content"?"selected":""}>내용</option>
												</select>
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-success rere" onclick="searchList()">검색</button>
											</div>
										</form>
									</td>
								</tr>
							</table>
							
							<div class="page-navigation mb-3">
								${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>