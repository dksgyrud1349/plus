<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
@font-face {
	font-family: font-family: 'Lato', Arial, sans-serif;
	font-weight: bold;
	font-style: normal;
}
.font1 {
	font-family: font-family: 'Lato', Arial, sans-serif;
	font-weight: bold;
	font-style: normal;
}


.kwd {
	width: 200px;
	height: 40px;
	float: right;
	margin: 2px;
	padding-top: 3px;
	margin-right: 3px;
}

.kwd2 {
	margin-top: 5px;
	width: 58px;
	height: 37px;
	border-radius: 6px;
}
.chat{
	color: #3CB371;
}


.tabs {
	font-size: 20px; line-height: 20px;
}
.tabs ul:before, .tabs ul:after {
	content: ""; 
	display: block; 
	height: 0; 
	visibility: hidden;	
} 
.tabs ul:after { 
	clear: both; 
}
.tabs ul {
	margin:0;
	list-style:none;
	border-bottom: 1px solid #e0e0e0;
	zoom: 1;
}

.tabs ul li {
	position: relative;
	float: left;
	margin: 0;
}
.tabs ul li a {
	background: #f6f6f6;
	font-weight: bold;
	text-align: center;
	display: block;
	border: 1px solid #e0e0e0;
	color: #909090;
	text-shadow: 0 1px 0 rgba(255,255,255, 0.75);
	padding: 6px 25px; 
	margin: 0 10px -1px 0;
	border-top-left-radius: 15px;
	border-top-right-radius: 10px;
	text-decoration:none;
}
.tabs ul li a:hover {
	border-color: rgb(214, 241, 207);
	color: #606060;
}
.tabs ul li.active a {
	background: #fff;
	border-color: #d4d4d4;
	border-bottom: 1px solid #fff;
	color: #dd390d;
	margin-top: -4px;
	padding-top: 10px;
}
</style>

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
		listPage(1);
		
	    $("button[role='tab']").on("click", function(e){
	    	listPage(1);
	    	
	    });
	});

	// 글리스트 및 페이징 처리
	function listPage(page) {
		const $tab = $("button[role='tab'].active");
		let cateNum = $tab.attr("data-cateNum");
		
		let url = "${pageContext.request.contextPath}/faq/list";
		let query = "pageNo="+page+"&cateNum="+cateNum;
		
		let selector = "#nav-content";
		
		const fn = function(data){
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "text", fn);
	}	
	
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main">
				
					<div class="tabs">
					  <ul>
						<li class="active"><a href="${pageContext.request.contextPath}/faq/main">자주 묻는 질문</a></li>
						<li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
						<li><a href="${pageContext.request.contextPath}/etc/list">연락처/위치 안내</a></li>
						<li><a href="${pageContext.request.contextPath}/chatting/main">실시간 채팅</a></li>
						<li><a href="${pageContext.request.contextPath}/declaration/article">신고하기</a></li>
						<li><a href="${pageContext.request.contextPath}/suggest/article">제안하기</a></li>
						<li><a href="${pageContext.request.contextPath}/inquiryAd/list">문의하기</a></li>
					  </ul>
					</div>
				
					<h3 class="font1"
						style="padding-top: 20px;">
						<br><i class="bi bi-wechat fa-2x chat"></i>&nbsp;자주하는 질문<br><br>
					</h3>
					
					<div class="body-main main-color">
						
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="0" aria-selected="true" data-cateNum="0">모두</button>
							</li>
							<c:forEach var="dto" items="${listCategory}" varStatus="status">
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="tab-${status.count}" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="${status.count}" aria-selected="true" data-cateNum="${dto.cateNum}">${dto.faqName}</button>
								</li>
							</c:forEach>
						</ul>
						
						<div class="tab-content pt-2" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>