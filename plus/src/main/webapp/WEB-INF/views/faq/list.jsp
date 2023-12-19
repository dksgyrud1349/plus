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
	$(function() {
		// $('#nav-${category}').addClass('active');
		$('li.nav-${category} a').addClass('active');

		$('ul.navs li').click(
				function() {
					let category = $(this).attr('data-category');

					$('#nav-${category}').addClass('active');

					location.href = '${pageContext.request.contextPath}/faq/'
							+ category + '/list';
				});

	});
</script>

<div>
	<jsp:include page="/WEB-INF/views/center/layout/left2.jsp" />
</div>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3 class="font1"
				style="border-top: 1px solid black; padding-top: 20px;">
				<i class="bi bi-question-octagon"></i> 자주하는 질문
			</h3>
		</div>
		<ul class="nav nav-pills navs" style="margin-top: 25px;">
			<li class="nav-item nav-all" id="nav-all" data-category="all"><a
				class="nav-link" aria-current="page">전체</a></li>
			<li class="nav-item nav-apply" id="nav-apply" data-category="apply"><a
				class="nav-link">클래스 신청</a></li>
			<li class="nav-item nav-cancel" id="nav-cancel"
				data-category="cancel"><a class="nav-link">예약취소/환불</a></li>
			<li class="nav-item nav-member" id="nav-member"
				data-category="member"><a class="nav-link" tabindex="-1"
				aria-disabled="true">회원</a></li>
			<div style="margin-left: 460px;">
				<select name="schType" class="form-select"
					style="margin-top: 5px; margin-right: 4px;">
					<option value="all">제목</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="kwd">
				<input type="text" name="kwd" class="form-control" value="${dto.regDate}">
			</div>
			<div class="kwd2">
				<button class="btn btn-outline-secondary">
					<span class="fw-semibold text-dark">검색</span>
				</button>
			</div>
		</ul>
	</div>
</div>
<div class = "container2">
	
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
			<h2 ${dto.regDate} id="flush-headingOne">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
					aria-expanded="false" aria-controls="flush-collapseOne" style="font-weight: bold;">
					Accordion Item #1</button>
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse"
				aria-labelledby="flush-headingOne"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">
					Placeholder content for this accordion, which is intended to
					demonstrate the
					<code>.accordion-flush</code>
					class. This is the first item's accordion body.
				</div>
			</div>
		</div>
		<div class="accordion-item">
		
			<h2 class={Dto.content} id="flush-headingTwo">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
					aria-expanded="false" aria-controls="flush-collapseTwo" style="font-weight: bold;">
					Accordion Item #2</button>
			</h2>
			<div id="flush-collapseTwo" class="accordion-collapse collapse"
				aria-labelledby="flush-headingTwo"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">
					Placeholder content for this accordion, which is intended to
					demonstrate the
					<code>.accordion-flush</code>
					class. This is the second item's accordion body. Let's imagine this
					being filled with some actual content.
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="${dto.regDate}" id="flush-headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
					aria-expanded="false" aria-controls="flush-collapseThree" style="font-weight: bold;">
					Accordion Item #3</button>
			</h2>
			<div id="${dto.regDate}" class="accordion-collapse collapse"
				aria-labelledby="flush-headingThree"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">
					Placeholder content for this accordion, which is intended to
					demonstrate the
					<code>.accordion-flush</code>
					class. This is the third item's accordion body. Nothing more
					exciting happening here in terms of content, but just filling up
					the space to make it look, at least at first glance, a bit more
					representative of how this would look in a real-world application.
				</div>
			</div>
		</div>
	</div>
</div>