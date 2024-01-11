<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.totalBox{
	position: absolute;
	top: 480px;
	left: 55%;
	width: 1200px;
	height: 800px;
}

.nameTitle{
	color: black;
	font-size: 30px;
	font-weight: bold;
	position: absolute;
	top: 20px;
	left: 460px;
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

img{
	min-height: 100%; 
	max-width: 100%; 
}
.imgHoverEvent{
	width: 300px; 
	height: 300px; 
	margin: 5px; 
	position: relative; 
	overflow: hidden; 
	display: inline-block;
}
.imgHoverEvent .imgBox{
	width: 300px; 
	height: 300px; 
	text-align: center; 
	background: black; 
	background-size: auto 100%;
}
.imgHoverEvent .hoverBox{
	position: absolute; 
	top:0; 
	left: 0; 
	width: 300px; 
	height: 300px;
}
.hoverBox p.p1{
	text-align:center; font-size:18px;
}
.hoverBox p.p2{
	margin-top: 40px;
} 
.imgHoverEvent{
	position: relative;
}
.event5 .imgBox{
	transform-origin: 0% 0%;
}
.event5 .hoverBox{
	transform: rotateX(-90deg);
	transform-origin: 100% 100%; 
	background: #000
}
.event5 .hoverBox p{
	color:#fff;
}
.event5:hover .imgBox{
	transform: rotateX(90deg); 
	animation: event5Ani 0.5s linear 1;
}
.event5:hover .hoverBox{
	transform: rotateX(0deg); animation: event5Ani2 0.8s linear 1;
}
@keyframes event5Ani {
    0%{transform: rotateX(0)}
    100%{transform: rotateX(90deg)}
}
@keyframes event5Ani2 {
    0%{transform: rotateX(-90deg)}
    30%{transform: rotateX(-90deg)}
    100%{transform: rotateX(0)}
}
.tab-content{
	height: 650px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
	$('li.nav-${category} button').addClass('active');
	$('div.tab-${category}').addClass('active');
	
	$('ul.nav-tabs li').click(function(){
		let category = $(this).attr('data-category');
		
		$('#nav-${category}').addClass('active');
		$('#tab-${category}').addClass('active');
		
		location.href = '${pageContext.request.contextPath}/admin/reviewManage/'+category+'/list';
	});
	
});
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class = "nameTitle">
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
					    </ul>
					  </div>
					  <div class="cart-text tab-content" id="myTabContent">
						  <div class="row tab-pane fade tab-all show" id="all" role="tabpanel" aria-labelledby="all-tab" style="margin-left: 125px;">
						      <c:forEach var="dto" items="${list}" varStatus="status">
							      <div class="col imgHoverEvent event5" style="float: left;">
							          <div class="imgBox" style="margin-top: 20px;">
								          <img src="${pageContext.request.contextPath}/uploads/review/${dto.filename}" alt="">
							          </div>
							          
							          <a href="${articleUrl}&reviewNum=${dto.reviewNum}">
							          <div class="hoverBox">
							            <span>
							              <p class="p1">${dto.reviewSubject}</p>
							              <p class="p2">${dto.reviewContent}</p>
							              <p class="p1">${dto.reviewScore}/5점</p>
							            </span>
							          </div>
							          </a>
							      </div>
						    	</c:forEach>
						    </div>
						    	
						  <div class="row tab-pane fade tab-hide show" id="hide" role="tabpanel" aria-labelledby="hide-tab" style="margin-left: 125px;">
						      <c:forEach var="dto" items="${listHide}" varStatus="status">
							      <div class="col imgHoverEvent event5" style="float: left;">
							          <div class="imgBox" style="margin-top: 20px;">
								          <img src="${pageContext.request.contextPath}/uploads/review/${dto.filename}" alt="">
							          </div>
							          
							          <a href="${articleUrl}&reviewNum=${dto.reviewNum}">
							          <div class="hoverBox">
							            <span>
							              <p class="p1">${dto.reviewSubject}</p>
							              <p class="p2">${dto.reviewContent}</p>
							              <p class="p1">${dto.reviewScore}/5점</p>
							            </span>
							          </div>
							          </a>
							      </div>
						    	</c:forEach>
						  </div>
					  </div>
					</div>
				  </div>
				</div>
			  </div>
			</div>
		<div class="page-navigation mb-3" style="margin-left: 200px;">
			${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
		</div>
  </main>
 
