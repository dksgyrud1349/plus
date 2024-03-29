<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
		<tr class='table-light' style='border:1px solid #32B0E4;'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.userName}</div>
						<div class='date'>${vo.reRegDate}</div>
					</div>
				</div>
			</td>
			<td width='50%' align='right' class='align-middle'>
				<div class="reply-menu">
					<c:choose>
						<c:when test="${sessionScope.member.userId==vo.userId}">
							<div class='hideReply reply-menu-item' data-replyNum='${vo.replyNum}' data-showReply='${vo.showReply}'>${vo.showReply == 1 ? "숨김":"표시"}</div>
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'><i class="bi bi-trash3"></i></div>
						</c:when>
						<c:when test="${sessionScope.member.membership > 90}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'><i class="bi bi-trash3"></i></div>
						</c:when>
						<c:otherwise>
							<div class='notifyReply reply-menu-item'>신고</div>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan='2' valign='top' class="${vo.showReply == 0 ? 'text-primary text-opacity-50':''}">${vo.reContent}</td>
		</tr>

		<tr>
			<td colspan='2' align='right'>
				<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="bi bi-hand-thumbs-up"></i> <span>${vo.likeCount}</span></button>
			</td>
		</tr>
	
	    
	</c:forEach>
</table>

<div class="page-navigation">
	${paging}
</div>			
