<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.nav-tabs .nav-link {
	margin:0;
	list-style:none;
	zoom: 1;
	color:#c0c0c0;
}
.nav-tabs .nav-link.active {
	background: #fff;
	border-color: #d4d4d4;
	border-bottom: 1px solid #fff;
	color: #47a3da;
	padding-top: 10px;
	
}
.nav-tabs:hover .nav-link:hover{
	border-color: #fff;
	color: #46AA46;
}
.tab-pane { min-height: 300px; }

.table img {
	max-width: 650px;
}

.overflowText {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
.imgcard {
        max-width: 300px;
        max-height: 400px; 
        margin: 10px; 
    }

.imgcard img {
    max-width: 100%; 
    height: auto; 
}

.detailbtn {
	background-color:#47a3da;
	border-radius: 10px;
	color: #FFFFFF;
	font-weight: 700;
}

.detailbtn:hover {
	background-color:#3F8FBD;
	color: #FFFFFF;
}
</style>

<script type="text/javascript">
$(function(){
	let menu = "${category}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/event/"+tab+"/list";
		location.href = url;
    });
});


</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container pt-5" style="width:100%; margin:5% auto;">
				<div class="body-main">
				<h3 class="mb-3 p-2" style="border-bottom:2px solid #32B0E4;">
	    			<i class="bi bi-calendar-event"></i> 이벤트
	    		</h3>

			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-progress" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="progress" aria-selected="true" data-tab="progress">진행중인 이벤트</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-ended" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="ended" aria-selected="true" data-tab="ended">종료된 이벤트</button>
				</li>
			</ul>
			
			<div id="tab-content">
				<table class="table">
					<tr>
						<td align="left" width="50%">
							&nbsp;
						</td>
						<td align="right">
							&nbsp;
						</td>
					</tr>
				</table>
						
			<div class="card mb-5 w-80" style="margin:0 auto; border:none;">
					    	
			<div class="table table-hover board-list " id="nav-tabContent">
				<table class="table">
					<thead>
						<tr>
							<td colspan="2" style="text-align:center; vertical-align: middle; font-size:25px;">
								${dto.subject}
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td width="50%">
								이벤트 기간 : ${dto.startDate} ~ ${dto.endDate}
							</td>
							<td align="right">
								조회 : ${dto.hitCount}
							</td>
						</tr>
						
							<tr>
								<td colspan="2" style="border-bottom: none;" class="text-center">
									<img src="${pageContext.request.contextPath}/uploads/photo/${dto.eventImg}" 
										class="img-fluid img-thumbnail w-100 h-auto">
								</td>
							</tr>
							<tr>
								<td colspan="2" valign="top" height="200" class="text-center">
									${dto.eContent}
								</td>
							</tr>
										
						
						<tr>
						    <td class="row" colspan="2">
						        <c:forEach var="clist" items="${classList}">
						            <div class="card border-light col imgcard">
						                <img src="${pageContext.request.contextPath}/uploads/lesson/${clist.firstPhoto}"/>
						                <h5 class="card-header overflowText">${clist.className}</h5>
						                <p class="card-body text-end overflowText">${clist.price}</p>
						                <a href="${pageContext.request.contextPath}/lesson/detail/${clist.classNum}" class="btn detailbtn text-center mb-2">상세보기</a>
						            </div>
						        </c:forEach>
						    </td>
						</tr>
						<tr>
							<td colspan="2" class="text-center p-3" style="border-bottom: none;">
								<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi ${userEventLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span id="eventLikeCount">${dto.eventLikeCount}</span></button>
							</td>
						</tr>
												
						<c:if test="category == 'ended'">
							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button" class="btn btn-outline-secondary"> 종료된 이벤트입니다. </button>
								</td>
							</tr>
						</c:if>		
						
						<tr>
							<td colspan="2">
								이전글 :
								<c:if test="${not empty prevDto}">
									<a href="${pageContext.request.contextPath}/event/${category}/article?${query}&eventNum=${prevDto.eventNum}">${prevDto.subject}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								다음글 :
								<c:if test="${not empty nextDto}">
									<a href="${pageContext.request.contextPath}/event/${category}/article?${query}&eventNum=${nextDto.eventNum}">${nextDto.subject}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td width="50%">&nbsp;</td>
						<td class="text-end">
							<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list?${query}';">리스트</button>
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
		
		let url = '${pageContext.request.contextPath}/event/insertEventLike';
		let eventNum = '${dto.eventNum}';
		let query = 'eventNum=' + eventNum + '&userLiked=' + userLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userLiked ) {
					$i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
				} else {
					$i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
				}
				
				let count = data.eventLikeCount;
				$('#eventLikeCount').text(count);
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
	let url = '${pageContext.request.contextPath}/event/listReply';
	let query = 'eventNum=${dto.eventNum}&pageNo=' + page;
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
		let eventNum = '${dto.eventNum}';
		const $tb = $(this).closest('table');

		let content = $tb.find('textarea').val().trim();
		if(! content) {
			$tb.find('textarea').focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = '${pageContext.request.contextPath}/event/insertReply';
		let query = 'eventNum=' + eventNum + '&erContent=' + content;
		
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
		if(! confirm('댓글을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let replyNum = $(this).attr('data-replyNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/event/deleteReply';
		let query = 'replyNum=' + replyNum + '&mode=reply';
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

</script>
