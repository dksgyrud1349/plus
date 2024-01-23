<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">

.table .ellipsis {
	position: relative;
	min-width: 200px;
}
.table .ellipsis span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: absolute;
	left: 9px;
	right: 9px;
	cursor: pointer;
}
.table .ellipsis:before {
	content: '';
	display: inline-block;
}

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #00D8FF; }

.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }

.item-basic-content { cursor: pointer; }
.item-detail-content { display: none; }

.answer-form textarea { width: 100%; height: 75px; resize: none; }

.deleteReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover { font-weight: 500; color: #2478FF; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
	$('.item-basic-content').click(function(){
		const $basic = $(this);
		const $detail = $basic.next();
		if($detail.is(':visible')) {
			$detail.hide(100);
			$basic.addClass('border-bottom');
		} else {
			$detail.show(100);
			$basic.removeClass('border-bottom');
		}
	});
});
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; ">
				<div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="bi bi-chat-right-text"></i> 클래스 리뷰
					</h3>
		

			        <div class="row board-list-header">
			            <div class="col-auto pt-2">
			            	<span>
			            		리뷰 <font style="color: green; font-weight: bold; text-decoration: underline">${dataCount}개</font> (${page}/${total_page} 페이지)</span>
			            </div>
			        </div>
					
					<table class="table table-borderless board-list">
						<thead class="table-light">
							<tr class="border-bottom1">
								<th width="100">답변상태</th>
								<th>제목</th>
								<th width="100">작성자</th>
								<th width="150">작성일</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr class="item-basic-content border-bottom">
									<td>
										${not empty dto.replyContent ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>'}
									</td>
									<td class="left ellipsis">
										<span>${fn:replace(dto.reviewSubject, "<br>", "")}</span>
									</td>
									<td>${dto.userName}</td>
									<td>${fn:substring(dto.reviewDate, 0, 10)}</td>
								</tr>
								<tr class="item-detail-content">
									<td colspan="6" class="left p-0">
										<div class="border-bottom p-2 px-3">
											<div class="bg-light p-2">
												<div>
													<div class="p-2 pb-0 fw-semibold">
														${dto.className} (${dto.reviewDate})
													</div>
													
													<div class="row p-2">
														<div class="col-auto pt-0 ps-2 pe-1 score-star">
															<c:forEach var="n" begin="1" end="5">
																<span class="item fs-6 ${dto.reviewScore>=n ? 'on' : ''}"><i class="bi bi-star-fill"></i></span>
															</c:forEach>
														</div>
													</div>
													
													<div class="p-2">${dto.reviewContent}</div>
													
													<c:if test="${not empty dto.listFilename}">
														<div class="row gx-1 mt-2 mb-1 p-1">
																<div class="col-md-auto md-img">
																	<img class="border rounded" src="${pageContext.request.contextPath}/uploads/review/${dto.fileName}">
																</div>
														</div>
													</c:if>
													<div class="col text-end">
														<button class="answerReview btn btn-success" data-reviewNum="${dto.reviewNum}">답변</button>
													</div>
												</div>
												
												<c:if test="${not empty dto.replyContent}">
													<div class="p-2 pt-0 border-top">
														<div class="bg-light">
															<div class="p-3 pb-0">
																<label class="text-bg-primary px-2"> 플러스 </label> <label>${dto.replyDate}</label>
															</div>
															<div class="p-3 pt-1 pb-1 answer-content">${dto.replyContent}</div>
														</div>
													</div>						
												</c:if>
												
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="page-navigation">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>
		
				</div>
			</div>
		</div>

		<div class="modal fade" id="answerDialogModal" tabindex="-1" 
				data-bs-backdrop="static" data-bs-keyboard="false"
				aria-labelledby="answerDialogModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="answerDialogModalLabel">리뷰 답변</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="p-2 answer-form">
							<form name="answerForm" method="post">
								<div class="row">
									<div class="col">
										<span class="fw-bold">답변 달기</span>
									</div>
									
								</div>
								<div class="p-1">
									<textarea name="replyContent" id="replyContent" class="form-control"></textarea>
									<input type="hidden" name="reviewNum">
									<input type="hidden" name="page" value="${page}">
								</div>
							</form>
						</div>
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary btnAnswerSendOk">답변등록 <i class="bi bi-check2"></i> </button>
						<button type="button" class="btn btn-secondary btnAnswerSendCancel" data-bs-dismiss="modal">취소</button>
					</div>			
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
$('.answerReview').click(function() {
	let reviewNum = $(this).attr("data-reviewNum");
	$('form[name=answerForm]').find("input[name=reviewNum]").val(reviewNum);
    let $reviewContent = $(this).closest("td").find(".answer-content");
    let reviewContent = "";

    if ($reviewContent.length) {
        reviewContent = $reviewContent.text().trim();
    }

    const f = document.answerForm;
    f.reviewNum.value = reviewNum;

    $("#answerDialogModal").modal("show");
});

$('.btnAnswerSendOk').click(function() {
	let reviewNum = $(this).data("reviewNum");
    const f = document.answerForm;
    let reviewContent;

    reviewContent = f.replyContent.value.trim();

    if (!reviewContent) {
        alert("답변을 입력하세요.");
        f.replyContent.focus();
        return false;
    }

    f.action = "${pageContext.request.contextPath}/pluszone/review/answer";
    f.submit();
});

$('.btnAnswerSendCancel').click(function() {
    const f = document.answerForm;
    f.reset();

    $("#answerDialogModal").modal("hide");
});
</script>
