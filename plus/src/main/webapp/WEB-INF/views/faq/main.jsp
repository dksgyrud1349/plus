<%@ page contentType="text/html; charset=UTF-8" %>
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
$(function(){
	$("#tab-content").on("click", ".accordion h3.question", function(){
		 const $answer = $(this).next(".accordion div.answer");
		 let isVisible = $answer.is(':visible');
		 if(isVisible) {
			 $(this).next(".accordion div.answer").hide();
			 $(this).removeClass("active");
		 } else {
			 $(".accordion div.answer").hide();
			 $(".accordion h3.question").removeClass("active");
			 
			 $(this).next(".accordion div.answer").show();
			 $(this).addClass("active");
		 }
	});
});

$(function(){
	let cateNum = "${cateNum}";
	let pageNo = "${pageNo}";
	if(pageNo === "") {
		pageNo = 1;
	}
	$("#tab-"+cateNum).addClass("active");
	listPage(pageNo);

	$("ul.tabs li").click(function() {
		cateNum = $(this).attr("data-cateNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+cateNum).addClass("active");
		
		listPage(1);
	});
});

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
	
	$.ajax(url, settings);
}

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $(".tabs .active");
	let cateNum = $tab.attr("data-cateNum");
	
	let url = "${pageContext.request.contextPath}/plus/faq/list";
	let query = "pageNo="+page+"&cateNum="+cateNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#tab-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}



// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	$("#schType").val("all");
	$("#kwd").val("");
	
	listPage(1);
}

</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		 	<div class="container-fluid px-5">
				<div class="body-container" style="width:80%; margin:5% auto; ">
		 <div class="body-main">
		<h2><i class="fa-solid fa-clipboard-question"></i> 자주하는 질문 </h2>

    
   

		<div>
			<ul class="tabs">
				<li id="tab-0" data-cateNum="0">모두</li>
				<c:forEach var="dto" items="${listCategory}">
					<li id="tab-${dto.cateNum}" data-cateNum="${dto.cateNum}">${dto.faqName}(${dto.showUser==0 ? "공통" : "${dto.showUser==1? '이용자' : '플러스'}"})</li>
				</c:forEach>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px;"></div>
		
	</div>
</div>
</div>
</div>
</main>


