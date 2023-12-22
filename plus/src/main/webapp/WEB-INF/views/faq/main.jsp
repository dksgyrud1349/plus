	<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
@font-face {
	font-family: 'JalnanGothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.body-container {
	width: 1200px;
	height: 150px;
	margin-top: 150px;
	margin-left: 20px;
}

.font1 {
	font-family: 'JalnanGothic';
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
.container2{
	width: 1200px;
	height: 500px;
	margin-top: 20px;
	margin-left: 20px;
	border-top: 2px solid black;
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

<div class="container" style="min-height: 600px;">
	<div class="body-container">
		<div class="body-title">
			<h3 class="font1"
				style="border-top: 1px solid black; padding-top: 20px;">
				<i class="bi bi-question-octagon"></i> 자주하는 질문
			</h3>
		</div>
		<div class="body-main">
			
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