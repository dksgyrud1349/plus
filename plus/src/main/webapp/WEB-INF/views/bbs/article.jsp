<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

img {
        height: 600px;
        width: 600px;
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}

</style>

<c:if test="${sessionScope.member.userId==dto.userId||sessionScope.member.membership>90}">
	<script type="text/javascript">
		function deleteBoard() {
		    if(confirm('게시글을 삭제 하시 겠습니까 ? ')) {
			    let query = 'num=${dto.num}&${query}';
			    let url = '${pageContext.request.contextPath}/bbs/delete?' + query;
		    	location.href = url;
		    }
		}
	</script>
</c:if>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; padding-top:5%">
				<div class="body-main">
				
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
		    			<i class="bi bi-app"></i> 커뮤니티
		    		</h3>
				
					<div class="card mb-5 w-80" style="border:none;">
						<div class="table table-hover board-list " id="nav-tabContent">
							<table class="table">
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
											이름 : ${dto.userName}
										</td>
										<td align="right">
											${dto.regDate} | 조회 ${dto.hitCount}
										</td>
									</tr>
									<tr class="text-center">
										<td colspan="2" valign="top" height="200" style="border-bottom: none;">
											${dto.content}
										</td>
									</tr>
									
									<tr>
										<td colspan="2" class="text-center p-3" style="border-bottom: none;">
											<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2">
											이전글 :
											<c:if test="${not empty prevDto}">
												<a href="${pageContext.request.contextPath}/bbs/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
											</c:if>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											다음글 :
											<c:if test="${not empty nextDto}">
												<a href="${pageContext.request.contextPath}/bbs/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							
							<table class="table table-borderless mb-2">
								<tr>
									<td width="50%">
										<c:choose>
											<c:when test="${sessionScope.member.userId==dto.userId}">
												<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/update?num=${dto.num}&page=${page}';">수정</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-light" disabled>수정</button>
											</c:otherwise>
										</c:choose>
								    	
										<c:choose>
								    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>90}">
								    			<button type="button" class="btn btn-success" onclick="deleteBoard();">삭제</button>
								    		</c:when>
								    		<c:otherwise>
								    			<button type="button" class="btn btn-light" disabled>삭제</button>
								    		</c:otherwise>
								    	</c:choose>
									</td>
									<td class="text-end">
										<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/bbs/list?${query}';">리스트</button>
									</td>
								</tr>
							</table>
							
							<div class="reply">
								<form name="replyForm" method="post">
									<div class='form-header'>
										<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
									</div>
									
									<table class="table table-borderless reply-form">
										<tr>
											<td>
												<textarea class='form-control' name="reContent"></textarea>
											</td>
										</tr>
										<tr>
										   <td align='right'>
										        <button type='button' class='btn btn-success rere btnSendReply'>댓글 등록</button>
										    </td>
										 </tr>
									</table>
								</form>
								<div id="listReply"></div>
							</div>
						</div>
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

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

// 게시글 공감 여부
$(function(){
	$('.btnSendBoardLike').click(function(){
		const $i = $(this).find('i');
		let userLiked = $i.hasClass('bi-hand-thumbs-up-fill');
		let msg = userLiked ? '게시글 공감을 취소하시겠습니까 ? ' : '게시글에 공감하십니까 ? ';
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertBoardLike';
		let num = '${dto.num}';
		let query = 'num=' + num + '&userLiked=' + userLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userLiked ) {
					$i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
				} else {
					$i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
				}
				
				let count = data.boardLikeCount;
				$('#boardLikeCount').text(count);
			} else if(state === 'liked') {
				alert('게시글 공감은 한번만 가능합니다. !!!');
			} else if(state === "false") {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = '${pageContext.request.contextPath}/bbs/listReply';
	let query = 'num=${dto.num}&pageNo=' + page;
	let selector = '#listReply';
	
	const fn = function(data){
		$(selector).html(data);
	};
	// ajaxFun(url, 'get', query, 'html', fn);
	ajaxFun(url, 'get', query, 'text', fn);
}

// 리플 등록
$(function(){
	$('.btnSendReply').click(function(){
		let num = '${dto.num}';
		const $tb = $(this).closest('table');

		let content = $tb.find('textarea').val().trim();
		if(! content) {
			$tb.find('textarea').focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = '${pageContext.request.contextPath}/bbs/insertReply';
		let query = 'num=' + num + '&reContent=' + content;
		
		const fn = function(data){
			$tb.find('textarea').val('');
			
			let state = data.state;
			if(state === 'true') {
				listPage(1);
			} else if(state === 'false') {
				alert('댓글을 추가 하지 못했습니다.');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 삭제, 신고 메뉴
$(function(){
	$('.reply').on('click', '.reply-dropdown', function(){
		const $menu = $(this).next('.reply-menu');
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$('.reply-menu').hide();
			$menu.fadeIn(100);

			let pos = $(this).offset(); // 선택한 요소 집합의 첫 번째 요소의 위치를 HTML 문서를 기준으로 반환
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	
	$('.reply').on('click', function() {
		if($(event.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let replyNum = $(this).attr('data-replyNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/bbs/deleteReply';
		let query = 'replyNum=' + replyNum + '&mode=reply';
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 댓글 좋아요 / 싫어요
$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$('.reply').on('click', '.btnSendReplyLike', function(){
		let replyNum = $(this).attr('data-replyNum');
		let replyLike = $(this).attr('data-replyLike');
		const $btn = $(this);
		
		let msg = '게시물이 마음에 들지 않으십니까 ?';
		if(replyLike === '1') {
			msg = '게시물에 공감하십니까 ?';
		}
		
		if(! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertReplyLike';
		let query = 'replyNum=' + replyNum + '&replyLike=' + replyLike;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				let likeCount = data.likeCount;
				let disLikeCount = data.disLikeCount;
				
				$btn.parent('td').children().eq(0).find('span').html(likeCount);
				$btn.parent('td').children().eq(1).find('span').html(disLikeCount);
			} else if(state === 'liked') {
				alert('게시물 공감 여부는 한번만 가능합니다. !!!');
			} else {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


// 댓글 숨김기능
$(function(){
	$('.reply').on('click', '.hideReply', function(){
		let $menu = $(this);
		
		let replyNum = $(this).attr('data-replyNum');
		let showReply = $(this).attr('data-showReply');
		let msg = '댓글을 숨김 하시겠습니까 ? ';
		if(showReply === '0') {
			msg = '댓글 숨김을 해제 하시겠습니까 ? ';
		}
		if(! confirm(msg)) {
			return false;
		}
		
		showReply = showReply === '1' ? '0' : '1';
		
		let url = '${pageContext.request.contextPath}/bbs/replyShowHide';
		let query = 'replyNum=' + replyNum + '&showReply=' + showReply;
		
		const fn = function(data){
			if(data.state === 'true') {
				let $item = $($menu).closest('tr').next('tr').find('td');
				if(showReply === "1") {
					$item.removeClass('text-primary').removeClass('text-opacity-50');
					$menu.attr('data-showReply', '1');
					$menu.html('숨김');
				} else {
					$item.addClass('text-primary').addClass('text-opacity-50');
					$menu.attr('data-showReply', '0');
					$menu.html('표시');
				}
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


</script>
