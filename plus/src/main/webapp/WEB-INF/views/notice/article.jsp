<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
</style>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:10% auto; ">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:2px solid #32B0E4;">
		    			<i class="bi bi-pin-angle-fill"></i> 공지사항
		    		</h3>
				
				<div id="tab-content" style="padding: 5px; clear: both;">
				    <table class="table mb-0">
						<tr>
							<td align="left" width="50%">
								&nbsp;
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
				
				
					<div class="card mb-5 w-80" style="margin:0 auto; border:none;">
						<table class="table board-list">
							<thead>
								<tr>
									<td class="text-center align-middle p-3 fs-5 fw-bold" colspan="2">
									    ${dto.subject}
									</td>
								</tr>
							</thead>
							
							<tbody>
								<tr class="fs-5">
									<td width="50%" class="p-2">
										이름 : 관리자
									</td>
									<td align="right" class="p-2">
										${dto.regDate} <i class="bi bi-three-dots-vertical"></i> 조회 ${dto.hitCount}
									</td>
								</tr>
								
								<tr>
									<td colspan="2" valign="top" height="200" style="border-bottom:none;">
										${dto.content}
									</td>
								</tr>
								
								<tr>
									<td colspan="2">
										<c:forEach var="vo" items="${listFile}" varStatus="status">
											<p class="border text-secondary mb-1 p-2">
												<i class="bi bi-folder2-open"></i>
												<a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}">${vo.originalFileName}</a>
												[${vo.fileSize} byte]
											</p>
										</c:forEach>
									</td>
								</tr>
								
								<tr>
									<td colspan="2">
										이전글 :
										<c:if test="${not empty prevDto}">
											<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										다음글 :
										<c:if test="${not empty nextDto}">
											<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-borderless">
							<tr>
								
								<td width="50%">&nbsp;</td>
								<td class="text-end">
									<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>