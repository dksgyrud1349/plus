<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.board-article img { max-width: 650px; }
</style>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main" style="width: 100%;">
				
					<div class="card mb-5 w-80" style="margin:0 auto;">
				    	<div class="card-header text-center">
				    		<h3 class="pt-2">
				    			<i class="bi bi-question-circle-fill"></i> 문의 내역
				    		</h3>
				    	</div>
		
					<div class="table table-hover board-list " id="nav-tabContent">
						<table class="table">
							<thead>
								<tr>
									<td colspan="2" class="text-white fs-4 fw-medium" style="background: #32B0E4;">
										Q. ${dto.subject}
									</td>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>
										클래스 : ${className.className}
									</td>
								</tr>
								<tr>
									<td width="50%">
										작성자 : ${sessionScope.member.userName}
									</td>
									<td align="right">
										문의일 : ${dto.inquiryDate}
									</td>
								</tr>
								<tr>
									<td colspan="2" valign="top" height="200" style="border-bottom: none;">
										${dto.content}
									</td>
								</tr>
								<c:if test="${dto1.reInquiryNum == 1}">
									<tr>
										<td colspan="2" class="bg-danger text-white fs-4 fw-medium">
											A. ${dto1.reSubject}
										</td>
									</tr>
									<tr>
										<td width="50%">
											작성자 : ${dto1.nickName}
										</td>
										<td align="right">
											답변일 : ${dto1.reInquiryDate}
										</td>
									</tr>
									<tr>
										<td colspan="2" valign="top" height="200" style="border-bottom: none;">
											${dto1.reContent}
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						
						<table class="table table-borderless mb-2">
							<tr>
								<td class="text-left">
									<c:if test="${dto.reInquiryNum == 0}">
										<button type="button" class="btn" style="background: #32B0E4; color: white;" onclick="location.href='${pageContext.request.contextPath}/classInq/updateInq?inquiryNum=${dto.inquiryNum}&classNum=${classNum}';">수정하기</button>
									</c:if>
									<button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/classInq/deleteInq?inquiryNum=${dto.inquiryNum}';">삭제하기</button>
								</td>
								<td class="text-end">
									<button type="button" class="btn" style="background: #46AA46; color: white;" onclick="location.href='${pageContext.request.contextPath}/classInq/myInqList';">리스트</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}
</script>
