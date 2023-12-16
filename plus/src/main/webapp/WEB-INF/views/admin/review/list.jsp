<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.totalBox{
	position: absolute;
	top: 50%;
	left: 55%;
	width: 1200px;
	height: 500px;
	
}
.card2{
	width: 185px;
	height: 400px;
	float: left;
	position: fix;
	border: 1px solid gray;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	margin: 4px;
}
.name{
	color: black;
	font-size: 30px;
	font-weight: bold;
	position: absolute;
	top: 10%;
	left: 15%;
}
.box{
	width: 150px;
	height: 39px;
	float: right;
	margin: 2px;
}
.kwd{
	width: 398px;
	height: 39px;
	float: right;
	margin: 2px;
	padding-top: 3px;
	margin-right: 3px;
}
.kwd2{
	margin-top: 5px;
	background: #d2d2d2;
	width: 58px;
	height: 37px;
	border-radius: 6px;
}
</style>

<script type="text/javascript">
$(function(){
	$('li.nav-${category} button').addClass('active');
	$('div.tab-${category}').addClass('active');
	
	$('ul.nav-tabs li').click(function(){
		let category = $(this).attr('data-category');
		
		$('#nav-${category}').addClass('active');
		$('#tab-${category}').addClass('active');
		
		location.href = '${pageContext.request.contextPath}/admin/review/'+category+'/list';
	});
	
});
</script>

<div class = "name">
	<i class="bi bi-chat-left-text-fill"></i>
		리뷰 관리
</div>

<div class="translate-middle totalBox">
	<div class="card text-center">
	  <div class="card-header">
	    <ul class="nav nav-tabs" id="myTab" role="tablist">
	      <li class="nav-all nav-item" data-category="all" role="presentation">
	      	<button class="nav-link" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true" style="color: black;">전체 리뷰</button>
	      </li>
	      <li class="nav-hide nav-item" data-category="hide" role="presentation">
	      	<button class="nav-link" id="hide-tab" data-bs-toggle="tab" data-bs-target="#hide" type="button" role="tab" aria-controls="hide" aria-selected="true" style="color: black;">숨긴 리뷰</button>
	      </li>
	      <li class="nav-reviewChart nav-item" data-category="reviewChart" role="presentation">
	      	<button class="nav-link" id="reviewChart-tab" data-bs-toggle="tab" data-bs-target="#reviewChart" type="button" role="tab" aria-controls="reviewChart" aria-selected="false" style="color: black;">리뷰 통계</button>
	      </li>
	      <div style="position: absolute; left: 60%;">
	    	<select name="schType" class="form-select box">
				<option value="all">제목+내용</option>
				<option value="regDate">등록일자순</option>
				<option value="className">클래스명</option>
				<option value="content">내용</option>
				<option value="highReivew">리뷰높은순</option>
				<option value="lowReview">리뷰낮은순</option>
			</select>
	    	<select name="subNum" class="form-select box">
				<option value="0">서브카테고리</option>
			</select>
	    	<select name = "mainNum" class = "form-select box">
	    		<option value = "0">메인카테고리</option>
	    	</select>
		</div>
	    </ul>
			<div style="float: right;" class = "kwd2">
				<button class="btn btn-outline-secondary">
					<span class="fw-semibold text-dark">검색</span>
				</button>
			</div>
			<div class = "kwd">
				<input type="text" name="kwd" class="form-control" value="${kwd}">
			</div>
	  </div>
	  <div class="card-body tab-content" id="myTabContent">
		  <div class="col tab-pane fade tab-all show" id="all" role="tabpanel" aria-labelledby="all-tab">
		    <div class="card2">
		      <img src="${pageContext.request.contextPath}/resources/images/adminReview_1.jpg" class="card-img-top" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		      </div>
		    </div>
		  </div>
		  <div class="tab-pane fade tab-hide show" id="hide" role="tabpanel" aria-labelledby="hide-tab">
		  	<div class="card2">
		      <img src="${pageContext.request.contextPath}/resources/images/adminReview_2.jpg" class="card-img-top" alt="...">
		      <div class="card-body">
		        <h5 class="card-title">Card title</h5>
		        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		      </div>
		    </div>
		  </div>
		  <div class="tab-pane fade tab-reviewChart show" id="reviewChart" role="tabpanel" aria-labelledby="reviewChart-tab"></div>
		</div>
	  </div>
  </div>
