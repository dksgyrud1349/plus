<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${list.size() > 0}">
	<div class="accordion"> 
		<c:forEach var="dto" items="${list}">
			<div class="question d-flex flex-row">
				<h4 class="q col-md-auto" style="line-height:68px;">Q.&nbsp;&nbsp;</h4> 
				<h5 class="subject col-8 me-5" style="line-height:68px;">${dto.subject}</h5>
				<span class="faqName col-2 text-end" style="line-height:68px;">(${dto.faqName})</span>
			</div>
			<div class="answer bg-white">
				<div class="content">
					<div>A.</div>
					<div>${dto.content}</div>
				</div>

				<div class="update">
					<a onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/update?num=${dto.num}&pageNo=${pageNo}';">수정</a>&nbsp;<i class="bi bi-three-dots-vertical"></i>
					<a onclick="deleteFaq('${dto.num}', '${pageNo}');">삭제</a>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>
 
<div class="page-navigation text-center mb-3">
	${dataCount == 0 ? "등록된 FAQ가 없습니다." : paging}
</div>
