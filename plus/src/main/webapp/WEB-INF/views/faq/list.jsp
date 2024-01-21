<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style> 
.numb{
	text-color: #3c3c3c;
}
.subj{
	text-colot: #3c3c3c;
}
.main-board {
	border: 1px solid #dee2e6;
	padding: 20px 16px;
	background: #e9ecef;
}
.accord-body{
	background: #f4f5f7;
	font-size: 19px;
}
</style>
<c:if test="${list.size() == 0 }">
	<div class="m-5 text-center">
		<h6>등록된 FAQ가 없습니다.</h6>
	</div>
</c:if>
<c:if test="${list.size() > 0}">
	<div class="accordion accordion-flush mt-1" id="accordionFlush">
		<div class="row main-board fw-bold" style="margin-left: 0px; width: 1200px;"><div class="col-2">카테고리</div><div class="col-7">제목</div></div>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<div class="accordion-item" style="border: none;">
				<h2 class="accordion-header border" id="flush-heading-${status.index}">
					<button class="accordion-button fw-bold bg-white" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${status.index}" aria-expanded="false" aria-controls="flush-collapse-${status.index}">
						<div class="col-2 numb">[${dto.faqName}]</div>
						<div class="col-7 subj">Q.&nbsp;${dto.subject}</div>
					</button>
				</h2>
				<div id="flush-collapse-${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading-${status.index}" data-bs-parent="#accordionFlush">
					<div class="accordion-body border accord-body fw-bolder text-white pt-4 pb-5">
						<div class="p-2 answer text-black-50">
							A.&nbsp;${dto.content}
						</div>
					</div>
				</div>
			</div>		
		</c:forEach>
	</div>
</c:if>