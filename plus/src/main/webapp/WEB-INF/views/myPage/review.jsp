<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.score-star {
	font-size: 0;
	letter-spacing: -4px;
}

.score-star .item {
	font-size: 22px;
	letter-spacing: 1px;
	display: inline-block;
	color: #ccc;
	text-decoration: none;
	vertical-align: middle;
}

.score-star .item:first-child {
	margin-left: 0;
}

.score-star .on {
	color: #FFF612;
}

.md-img img {
	width: 150px;
	height: 150px;
	cursor: pointer;
	object-fit: cover;
}

.deleteReview, .deleteQuestion {
	cursor: pointer;
	padding-left: 5px;
}

.deleteReview:hover, .deleteQuestion:hover {
	font-weight: 500;
	color: #2478FF;
}
</style>

<main class="wrapper" style="margin: 5% auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container">
				<div class="body-main">

					<div class="pt-2" id="myTabContent">
						<div class="mt-3 pt-3">
							<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
								클래스 리뷰
							</h3>
						</div>
						<div class="mt-2 list-review"></div>
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
$(function(){
	listReview(1);
});
// review -------------
function listReview(page) {
	let url = '${pageContext.request.contextPath}/review/mylist';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printReview(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printReview(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = '';
	if (dataCount == 0) {
		out += '<div class="text-center m-5"><h6 class="mb-5">등록된 리뷰가 없습니다.</h6></div>'
	}
	
	for(let item of data.list) {
		let reviewNum = item.reviewNum;
		let userName = item.userName;
		let plusName = item.plusName;
		let reviewScore = item.reviewScore;
		let reviewContent = item.reviewContent;
		let reviewDate = item.reviewDate;
		let replyContent = item.replyContent;
		let replyDate = item.replyDate;
		let listFilename = item.listFilename;
		
		let className = item.className;
		let orderNum = item.orderNum;
		let classDate = item.classDate;
		
		out += '<div class="mt-3 border-bottom">';
		out += '  <div class="p-2 fw-semibold">';
		out +=        className + '('+ classDate +')';
		out += '  </div>';
		out += '  <div class="row p-2">';
		out += '    <div class="col-auto pt-0 ps-2 pe-1 score-star">';
		for(let i=1; i<=5; i++) {
			out += '  <span class="item fs-6 ' + (reviewScore>=i ? 'on' : '') + '"><i class="bi bi-star-fill"></i></span>';
		}
		out += '    </div>';
		out += '    <div class="col text-end"><span>'+reviewDate+'</span>';
		out += '    <span class="deleteReview" data-num="'+reviewNum+'">삭제</span></div>';	
		out += '  </div>';
		out += '  <div class="mt-2 p-2">' + reviewContent + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/review/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		
		if(replyContent) {
			out += '  <div class="p-3 pt-0">';
			out += '    <div class="bg-light">';
			out += '      <div class="p-2 pb-0">';
			out += '        <label class="text-bg-primary px-2">'+ plusName +' 플러스님</label> <label>' + replyDate + '</label>';
			out += '      </div>';
			out += '      <div class="p-2 pt-1">' + replyContent + '</div>';
			out += '    </div>';
			out += '  </div>';
		}
		out += '</div>';
	}
	if(dataCount > 0) {
		out += '<div class="page-navigation mt-3">' + paging + '</div>';
	}
	
	$('.list-review').html(out);	
}

$(function(){
	$('.list-review').on('click', '.deleteReview', function(){
		if(! confirm('리뷰를 삭제하시겠습니까? ')){
			return false;
		}
		let num = $(this).attr('data-num');
		let url = '${pageContext.request.contextPath}/review/delete';
		let query = 'reviewNum='+num;
		
		const fn = function(data) {
			location.href="${pageContext.request.contextPath}/myPage/review";
		};
		ajaxFun(url, 'post', query, 'json', fn);	
	});
});
</script>