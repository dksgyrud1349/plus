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
    border-radius:0 !important;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
</style>

<c:if test="${sessionScope.member.membership>90}">
	<script type="text/javascript">
		function deleteBoard() {
		    if(confirm('게시글을 삭제 하시 겠습니까 ? ')) {
			    let query = 'num=${dto.num}&${query}';
			    let url = '${pageContext.request.contextPath}/admin/communityManage/delete?' + query;
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
				
					<div class="card mb-5 w-80" style="margin:0 auto;">
				    		
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
									<td colspan="2">
										이전글 :
										<c:if test="${not empty prevDto}">
											<a href="${pageContext.request.contextPath}/admin/communityManage/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										다음글 :
										<c:if test="${not empty nextDto}">
											<a href="${pageContext.request.contextPath}/admin/communityManage/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-borderless mb-2">
							<tr>
								<td width="50%">
									<c:choose>
							    		<c:when test="${sessionScope.member.membership>90}">
							    			<button type="button" class="btn btn-success rere" onclick="deleteBoard();">삭제</button>
							    		</c:when>
							    		<c:otherwise>
							    			<button type="button" class="btn btn-light" disabled>삭제</button>
							    		</c:otherwise>
							    	</c:choose>
								</td>
								<td class="text-end">
									<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/communityManage/list?${query}';">리스트</button>
								</td>
							</tr>
						</table>
						
						<div class="reply">
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
		
		let url = '${pageContext.request.contextPath}/admin/communityManage/insertBoardLike';
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
	let url = '${pageContext.request.contextPath}/admin/communityManage/listReply';
	let query = 'num=${dto.num}&pageNo=' + page;
	let selector = '#listReply';
	
	const fn = function(data){
		$(selector).html(data);
	};
	// ajaxFun(url, 'get', query, 'html', fn);
	ajaxFun(url, 'get', query, 'text', fn);
}



// 댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let replyNum = $(this).attr('data-replyNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/admin/communityManage/deleteReply';
		let query = 'replyNum=' + replyNum + '&mode=reply';
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});
</script>
