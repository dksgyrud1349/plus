<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; ">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
		    			<i class="fas fa-clipboard-list" ></i> 공지사항
		    		</h3>
				
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				    <table class="table">
						<tr>
							<td align="left" width="50%">
								&nbsp;
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
				
				
					<div class="card mb-5 w-80" style="margin:0 auto; border: 1px solid #cccccc;">
						<table class="table table-hover board-list">
							<thead>
								<tr>
									<td colspan="2" align="center">
									    ${dto.subject}
									</td>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td width="50%">
										이름 : 관리자
									</td>
									<td align="right">
										${dto.regDate} | 조회 ${dto.hitCount}
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
									<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
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