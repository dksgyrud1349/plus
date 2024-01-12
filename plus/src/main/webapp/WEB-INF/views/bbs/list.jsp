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
    .clobText {
        font-size: 15px;
    }	

    .clobTitleBox {
        padding: 10px;
        display: flex;
        align-items: center;
    }

    .clobName {
        font-size: 17px;
        padding: 0px 10px;
        font-weight: bold;
    }


    .clobImg {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
    
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/bbs/list">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}"/>
		<c:param name="kwd" value="${kwd}"/>
	</c:if>
</c:url>
	
<script type="text/javascript">
window.addEventListener('load', function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = '${listUrl}'; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector('.dataCount').innerHTML = dataCount + '개 ('
			+ page + '/' + total_page + '페이지)';

	document.querySelector('.page-navigation').innerHTML = 
		dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
});
</script>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; padding-top:5%">
				<div class="body-main">
				
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
	    			<i class="bi bi-app"></i> 커뮤니티
	    			
	    			<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/bbs/list';" title="새로고침" style="float:right;">
		            	<i class="fa-solid fa-arrow-rotate-left"></i>
		            </button>
					<button type="button" class="btn btn-success rere me-3" onclick="location.href='${pageContext.request.contextPath}/bbs/write';"  style="float:right;">글올리기</button>
	    		</h3>
	    		
	    		<div id="tab-content">
						</div>
						<table class="table">
							<tr>
								<td align="left">
									총 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}개</font> (${page}/${total_page} 페이지)
								</td>
								
								<td align="right">	
									<form class="row" name="searchForm" action="${pageContext.request.contextPath}/bbs/list" method="post" style="width:300px; margin-left:15px;">
										<div class="input-group mb-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
												<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
												<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-secondary" onclick="searchList()"> <i class="bi bi-search"></i> </button>
										</div>
									</form>
								</td>
							</tr>
						</table>
						<c:forEach var="dto" items="${list}" varStatus="status">	
							<div class="border communityBox mb-5">
								<div class="clobTitleBox">
								    <span class="clobName" style="width:50%;">
										<i class="bi bi-person-circle"></i> ${dataCount - (page-1) * size - status.index}. ${dto.userName} 
									</span>
									
									<span class="text-end" style="width:50%">
										<i class="bi bi-eye-fill"></i>  ${dto.hitCount} 
										<c:if test="${dto.replyCount!=0}"><i class="bi bi-chat-dots-fill mx-1"></i>(${dto.replyCount})</c:if>
									</span>
								
									<c:url var="url" value="/bbs/article">
											<c:param name="num" value="${dto.num}"/>
											<c:param name="page" value="${page}"/>
										<c:if test="${not empty kwd}">
											<c:param name="schType" value="${schType}"/>
											<c:param name="kwd" value="${kwd}"/>
										</c:if>									
									</c:url>
							    </div>
						
								<div class="feed_img">
									
								   <img src="${dto.imageFilename}" class="d-block w-100" alt="게시글">
								</div>
								
								<div class="mt-1 pb-3" style="border-bottom:1px solid #cccccc">
				                	<a href="${url}" class="text-reset mx-3">${dto.subject}</a>
									<span class="me-1" style="float:right;">
					                	${dto.regDate}
					                </span>
	                    			<br>
		                    		<span class="mx-2">
		                    			<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요" style="border:none;" data-num="${dto.num}"><i class="bi ${dto.userLiked ? 'bi-heart-fill':'bi-heart' }"></i>&nbsp;&nbsp;<span id="boardLikeCount${dto.num}">${dto.boardLikeCount}</span></button>
		                    		</span>
                					<div>
                				</div>
            				</div>
            				
            				  <div class="mx-2">
					          	
					          </div>
            				</div>
						</c:forEach>	
						<div class="page-navigation dataCount text-center mb-3"></div>
					</div>
				</div>
			</div>
		</div>
</main>

<script>
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
//게시글 공감 여부
$(function(){
	$('.btnSendBoardLike').click(function(){
		const $i = $(this).find('i');
		let userLiked = $i.hasClass('bi-heart-fill');
		let num = $(this).attr("data-num");
		let msg = userLiked ? '게시글 공감을 취소하시겠습니까 ? ' : '게시글에 공감하십니까 ? ';
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertBoardLike';
		let query = 'num=' + num + '&userLiked=' + userLiked;
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userLiked ) {
					$i.removeClass('bi-heart-fill').addClass('bi-heart');
				} else {
					$i.removeClass('bi-heart').addClass('bi-heart-fill');
				}
				
				let count = data.boardLikeCount;
				$('#boardLikeCount' + num).text(count);
			} else if(state === 'liked') {
				alert('게시글 공감은 한번만 가능합니다. !!!');
			} else if(state === "false") {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});
</script>
