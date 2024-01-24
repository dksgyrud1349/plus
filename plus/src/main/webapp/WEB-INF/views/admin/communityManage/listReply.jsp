<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>

<c:if test="${replyCount == 0}">
	<div class="text-center my-3">
		<h6 class="mb-3">등록된 댓글이 없습니다.</h6>
	</div>
</c:if>
<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
		<tr class='border table-light'>
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
						<c:when test="${sessionScope.member.membership > 90}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
						</c:when>
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
