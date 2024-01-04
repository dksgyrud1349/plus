<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function deleteInquiryAd() {
	if(confirm("문의를 삭제 하시겠습니까 ?")) {
		let query = "inquiryNum=${dto.inquiryNum}&${query}";
		let url = "${pageContext.request.contextPath}/inquiryAd/delete?"+query;
		location.href = url;
	}
}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 80%; margin: 10% auto;">
				<div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="bi bi-question-diamond"></i> 1:1 문의 
					</h3>
					
					<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tbody>
								<tr>
									<td colspan="2" class="px-0 pb-0">
										<div class="row gx-0">
											<div class="col-sm-1 bg-dark me-1">
												<p class="form-control-plaintext text-white text-center">Q.</p>
											</div>
											<div class="col bg-dark">
												<p class="form-control-plaintext text-white ps-2">${dto.subject}</p>
											</div>
										</div>
									</td>
								</tr>				
							
								<tr>
									<td align="right">
										작성자 : ${dto.userName}
									</td>
								</tr>
			
								<tr>
									<td width="50%">
										문의일자 : ${dto.inquiryDate}
									</td>
								</tr>
								
								<tr>
									<td colspan="2" valign="top" height="200">
										${dto.content}
									</td>
								</tr>
							</tbody>
						</table>
						
						<c:if test="${not empty dto.reContent}">
							<table class="table mb-0">
								<tbody>
									<tr>
										<td colspan="2" class="p-0">
											<div class="row gx-0">
												<div class="col-sm-1 bg-success me-1">
													<p class="form-control-plaintext text-white text-center">A.</p>
												</div>
												<div class="col bg-success">
													<p class="form-control-plaintext text-white ps-2">[답변] ${dto.reSubject}</p>
												</div>
											</div>
										</td>
									</tr>
								
									<tr>
										<td width="50%">
											담당자 : 관리자
										</td>
										<td align="right">
											답변일자 : ${dto.reInquiryDate}
										</td>
									</tr>
									
									<tr>
										<td colspan="2" valign="top" height="150">
											${dto.reContent}
										</td>
									</tr>
								</tbody>
							</table>
						</c:if>
						
						<table class="table table-borderless mb-2">
							<tr>
								<td class="text-start">
									<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/update?inquiryNum=${dto.inquiryNum}&page=${page}';">수정</button>
									<button type="button" class="btn btn-success" onclick="deleteInquiryAd();">삭제</button>
								</td>
								<td class="text-end">
									<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/list?${query}';">리스트</button>
								</td>
							</tr>
						</table>
			
					</div>
				</div>
			</div>
		</div>
	</div>
</main>