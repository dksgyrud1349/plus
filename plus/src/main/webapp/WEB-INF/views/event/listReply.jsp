<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
		<tr class='border table-light'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.userName}</div>
						<div class='date'>${vo.regDate}</div>
					</div>
				</div>
			</td>
			
			<td width='50%' align='right' class='align-middle'>
				<div class="reply-menu">
					<c:choose>
						<c:when test="${sessionScope.member.userId==vo.userId}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
						</c:when>
						<c:when test="${sessionScope.member.membership > 90}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
						</c:when>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan='2' valign='top' >${vo.erContent}</td>
		</tr>

	    
	</c:forEach>
</table>

<div class="page-navigation">
	${paging}
</div>			
