<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
@font-face {
    font-family: 'EASTARJET-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/EASTARJET-Medium.woff2') format('woff2');
}

.page-section {
	padding: 8rem 0;
}

.text-white-75 {
	color: rgba(255, 255, 255, 0.75) !important;
}

.btn-xl {
	padding: 1.25rem 2.25rem;
	font-size: 0.85rem;
	font-weight: 700;
	text-transform: uppercase;
	border: none;
	border-radius: 10rem;
}

hr.divider {
	height: 0.2rem;
	max-width: 3.25rem;
	margin: 1.5rem auto;
	background-color: #f4623a;
	opacity: 1;
}

hr.divider-light {
	background-color: #fff;
}

#mainNav {
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
	background-color: #fff;
	transition: background-color 0.2s ease;
}

#mainNav .navbar-brand {
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
	font-weight: 700;
	color: #212529;
}

#mainNav .navbar-nav .nav-item .nav-link {
	color: #6c757d;
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
	font-weight: 700;
	font-size: 0.9rem;
	padding: 0.75rem 0;
}

#mainNav .navbar-nav .nav-item .nav-link:hover, #mainNav .navbar-nav .nav-item .nav-link:active
	{
	color: #f4623a;
}

#mainNav .navbar-nav .nav-item .nav-link.active {
	color: #f4623a !important;
}

@media ( min-width : 992px) {
	#mainNav {
		box-shadow: none;
		background-color: transparent;
	}
	#mainNav .navbar-brand {
		color: black;
	}
	#mainNav .navbar-brand:hover {
		color: #f4623a;
	}
	#mainNav .navbar-nav .nav-item .nav-link {
		color: black;
		padding: 0 1rem;
	}
	#mainNav .navbar-nav .nav-item .nav-link:hover {
		color: #f4623a;
	}
	#mainNav .navbar-nav .nav-item:last-child .nav-link {
		padding-right: 0;
	}
	#mainNav.navbar-shrink {
		box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
		background-color: #fff;
	}
	#mainNav.navbar-shrink .navbar-brand {
		color: #212529;
	}
	#mainNav.navbar-shrink .navbar-brand:hover {
		color: #f4623a;
	}
	#mainNav.navbar-shrink .navbar-nav .nav-item .nav-link {
		color: #212529;
	}
	#mainNav.navbar-shrink .navbar-nav .nav-item .nav-link:hover {
		color: #f4623a;
	}
}

header.masthead {
	padding-top: 10rem;
	padding-bottom: calc(10rem - 4.5rem);
	background: white;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-size: cover;
}

header.masthead h1, header.masthead .h1 {
	font-size: 2.25rem;
}

@media ( min-width : 992px) {
	header.masthead {
		height: 100vh;
		min-height: 40rem;
		padding-top: 4.5rem;
		padding-bottom: 0;
	}
	header.masthead p {
		font-size: 1.15rem;
	}
	header.masthead h1, header.masthead .h1 {
		font-size: 3rem;
	}
}

header.masthead {
	padding-top: 10rem;
	padding-bottom: calc(10rem - 4.5rem);
	background: white;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-size: cover;
}

header.masthead h1, header.masthead .h1 {
	font-size: 2rem;
}

@media ( min-width : 992px) {
	header.masthead {
		height: 100vh;
		min-height: 40rem;
		padding-top: 4.5rem;
		padding-bottom: 0;
	}
	header.masthead p {
		font-size: 1.15rem;
	}
	header.masthead h1, header.masthead .h1 {
		font-size: 3rem;
	}
}

@media ( min-width : 1200px) {
	header.masthead h1, header.masthead .h1 {
		font-size: 3rem;
	}
}

#portfolio .container-fluid, #portfolio .container-sm, #portfolio .container-md,
	#portfolio .container-lg, #portfolio .container-xl, #portfolio .container-xxl
	{
	max-width: 1920px;
}

#portfolio .container-fluid .portfolio-box, #portfolio .container-sm .portfolio-box,
	#portfolio .container-md .portfolio-box, #portfolio .container-lg .portfolio-box,
	#portfolio .container-xl .portfolio-box, #portfolio .container-xxl .portfolio-box
	{
	position: relative;
	display: block;
}

#portfolio .container-fluid .portfolio-box .portfolio-box-caption,
	#portfolio .container-sm .portfolio-box .portfolio-box-caption,
	#portfolio .container-md .portfolio-box .portfolio-box-caption,
	#portfolio .container-lg .portfolio-box .portfolio-box-caption,
	#portfolio .container-xl .portfolio-box .portfolio-box-caption,
	#portfolio .container-xxl .portfolio-box .portfolio-box-caption {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	width: 100%;
	height: 100%;
	position: absolute;
	bottom: 0;
	text-align: center;
	opacity: 0;
	color: #fff;
	background: rgba(244, 98, 58, 0.9);
	transition: opacity 0.25s ease;
	text-align: center;
}

#portfolio .container-fluid .portfolio-box .portfolio-box-caption .project-category,
	#portfolio .container-sm .portfolio-box .portfolio-box-caption .project-category,
	#portfolio .container-md .portfolio-box .portfolio-box-caption .project-category,
	#portfolio .container-lg .portfolio-box .portfolio-box-caption .project-category,
	#portfolio .container-xl .portfolio-box .portfolio-box-caption .project-category,
	#portfolio .container-xxl .portfolio-box .portfolio-box-caption .project-category
	{
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
	font-size: 0.85rem;
	font-weight: 600;
	text-transform: uppercase;
}

#portfolio .container-fluid .portfolio-box .portfolio-box-caption .project-name,
	#portfolio .container-sm .portfolio-box .portfolio-box-caption .project-name,
	#portfolio .container-md .portfolio-box .portfolio-box-caption .project-name,
	#portfolio .container-lg .portfolio-box .portfolio-box-caption .project-name,
	#portfolio .container-xl .portfolio-box .portfolio-box-caption .project-name,
	#portfolio .container-xxl .portfolio-box .portfolio-box-caption .project-name
	{
	font-size: 1.2rem;
}

#portfolio .container-fluid .portfolio-box:hover .portfolio-box-caption,
	#portfolio .container-sm .portfolio-box:hover .portfolio-box-caption,
	#portfolio .container-md .portfolio-box:hover .portfolio-box-caption,
	#portfolio .container-lg .portfolio-box:hover .portfolio-box-caption,
	#portfolio .container-xl .portfolio-box:hover .portfolio-box-caption,
	#portfolio .container-xxl .portfolio-box:hover .portfolio-box-caption {
	opacity: 1;
}
.singo{
	float: right;
	margin-left: 10px;
	border: 2px solid #dcdcdc;
}

.singo:hover{
	border: 2px solid #c8c8c8;
	
}

.contentImg{
	overflow:hidden;
}
.score-star .on { color: #89B6F5; }
.score-star .off{ color: #EAEAEA; }

.impText{
	text-decoration:underline; 
	color:#47a3da; 
	font-weight:bold;
}

.selbox{
	width:150px;
	font-family: "Noto Sansf KR", sans-serif;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	
	
	color: #444;
	background-color: #fff;
	
	padding: 0.6em 1.4em 0.5em 0.8em;
	margin: 0;
	
	border: 1px solid #aaa;
	border-radius: 0.5em;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
}

.title{
	border-left:3px solid #47a3da;
	padding-left : 10px;
}
</style>


<script type="text/javascript">
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
	$("form select[name=classDay]").change(function(){
		let classDay = $(this).val();
		
		$("form select[name=classTime]").find('option').remove().end().append("<option value=''>시간</option>");
		
		if(!classDay){
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/lesson/lessonDtlTime";
		let query = "classNum="+${dto.classNum}+"&classDay="+classDay;
		
		
		const fn = function(data){
			$.each(data.lessonDtlTime, function(index, item){
				let startTime = item.startTime;
				let endTime = item.endTime;
				let s = "<option value='" + startTime + "~" + endTime + "'>" + startTime + "~" + endTime + "</option>";
				$("form select[name=classTime]").append(s);
			});
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
});

function sendOk(mode) {
	const f = document.detailForm;
	if(mode === "buy") {
		// GET 방식으로 전송. 로그인후 결제화면으로 이동하기 위해
		// 또는 자바스크립트 sessionStorage를 활용 할 수 있음
		let classDay = f.classDay.value;
		let classTime = f.classTime.value;
		
		if( !classDay ) {
	        alert("수강할 일자를 입력하세요.");
	        f.classDay.focus();
	        return;
	    }
		
		if( !classTime ) {
	        alert("수강할 시간을 입력하세요.");
	        f.classTime.focus();
	        return;
	    }
		
		f.action = "${pageContext.request.contextPath}/order/payment";
	} else {
		if(! confirm("선택한 상품을 장바구니에 담으시겠습니까 ? ")) {
			return false;
		}
		
		f.method = "post";
		f.action = "${pageContext.request.contextPath}/myPage/saveCart";
	}
	
	f.submit();
}

</script>
<form name="detailForm" id="detailForm" method="post" style="margin-bottom:250px;">
	<header class="masthead p-3">
		<div class="container px-4 px-lg-5 h-100">
			<section class="py-5">
				<div class="container px-4 px-lg-5 my-3">
					<div class="row gx-4 gx-lg-5 align-items-center">
						<div class="col-md-6">
							<img  src="${pageContext.request.contextPath}/uploads/lesson/${dto.firstPhoto}" class="card-img-top mb-5 mb-md-0">
						</div>
						<div class="col-md-6">
							<div class="small mb-1"><i class="bi bi-tag"></i> ${dto.mainName}</div>
							<h1 class="display-5 fw-bolder">${dto.className}</h1>
							<div class="fs-5 mb-5">
								<input type="hidden" name="classNum" value="${dto.classNum}">
								<span style="color: red"><i class="bi bi-calendar-check" style="color:black"></i> ${dto.startDate} ~ ${dto.endDate}</span><br>
								<!-- <span class="text-decoration-line-through">15,000원</span> -->
								<span><i class="bi bi-wallet-fill"></i> <fmt:formatNumber value="${dto.price}" pattern="#,###원" /></span>
								
								
								<div class="row pt-1 pb-2 border-bottom">
									<div class="col">
										<label class="align-middle"><a href="#myTabContent">리뷰 <span class="fs-5 fw-semibold product-reviewCount">(${dto.reviewCount})</span></a></label>
										<label class="align-middle pt-0 ps-2 score-star product-star">
											<c:forEach var="n" begin="1" end="5">
												<c:set var="reviewScore" value="${dto.reviewScore + ((dto.reviewScore%1>=0.5) ? (1-dto.reviewScore%1)%1 : -(dto.reviewScore%1))}"/>
												<span class="fs-6 item ${reviewScore>=n?'on':'off'}">
													<i class="bi bi-star-fill"></i>
												</span>
											</c:forEach>
										</label>
										<label class="align-middle "><span class="product-score ps-1">(${dto.reviewScore} / 5)</span></label>
									</div>
							</div>
								
							<div class="mt-2">
								<button type="button" class="btn singo" style="width: 60x;" onclick="location.href='${pageContext.request.contextPath}/declaration/article';">
									<span style="font-size: medium; font-family: 'EASTARJET-Medium';">신고</span><i class="bi bi-exclamation-triangle-fill"></i>
								</button>
								<button type="button" class="btn singo" style="width: 60x;" onclick="location.href='${pageContext.request.contextPath}/classInq/insertInq?classNum=${dto.classNum}';">
									<span style="font-size: medium; font-family: 'EASTARJET-Medium';">문의하기</span> <i class="bi bi-question-circle"></i>
								</button>
							</div>
						</div>
						<p class="lead">

							1. 강사 : ${dto.nickName}<br> 2. 상세주소 : ${dto.addr1}
							${dto.addr2}<br> <br> 
							<i class="bi bi-stars"></i> 예약하기를 눌러 <font class="impText">예약가능 시간</font>과 <font class="impText">인원수</font>를 확인해주세요.
						</p>
						<div>
							<select name="classDay" id="classDay" class="selbox">
								<option value="">일자</option>
								<c:forEach var="vo" items="${lessonDtlDate}" varStatus="status">
									<option value="${vo.classDate}">${vo.classDate}</option>
								</c:forEach>
							</select> <select name="classTime" id="classTime" class="selbox">
								<option value="">시간</option>
								<c:forEach var="vo" items="${lessonDtlTime}">
									<option value="${vo.startTime}${vo.endTime}">${vo.startTime} ~ ${vo.endTime}</option>
								</c:forEach>
							</select>
							<div class="d-flex" style="float: right; margin-bottom: 15px;">
								<button class="btn btn-outline-dark flex-shrink-0"
									type="button" onclick="sendOk('buy');">
									<i class="bi-cart-fill me-1"></i>예약하기
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

				
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">NEW 클래스</h2>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach var="newList" items="${newClassList}">
						<div class="col mb-5">
							<div class="card h-100">
							<div class="badge bg-dark text-white position-absolute"
									style="top: 0.5rem; right: 0.5rem">NEW</div>
								<!-- Product image-->
								<img class="card-img-top" src="${pageContext.request.contextPath}/uploads/lesson/${newList.firstPhoto}" />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${newList.className}</h5>
										<!-- Product reviews-->
										<div class="d-flex justify-content-center small mb-2 score-star">
											<c:forEach var="n" begin="1" end="5">
												<c:set var="score" value="${newList.reviewScore + ((newList.reviewScore%1>=0.5) ? (1-newList.reviewScore%1)%1 : -(newList.reviewScore%1))}"/>
												<span class="fs-6 item ${reviewScore>=n?'on':'off'}">
													<i class="bi bi-star-fill"></i>
												</span>
											</c:forEach>
											<label class="align-middle ">
												<span class="product-score ps-1">(${newList.reviewScore} / 5)</span>
											</label>
										</div>
										
										<!-- Product price-->
										${newList.price}
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/lesson/detail/${newList.classNum}">보러 가기</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</header>
</form>

<!-- Services-->
<section class="page-section mt-5" id="services">
	<div class="container px-5 px-lg-5">
		<h2 class="text-center mt-5">카테고리 · 해시태그</h2>
		<hr class="divider">
		
		<div class="row">
			
			<div class="col text-center">
				<div class="mt-5">
					<div class="mb-2">
						<i class="bi-gem fs-1 text-primary"></i>
					</div>
					<h3 class="h4 mb-2">${dto.mainName}</h3>
				</div>
			</div>
			
			<div class="col text-center">
				<div class="mt-5">
					<div class="mb-2">
						<i class="bi-laptop fs-1 text-primary"></i>
					</div>
					<h3 class="h4 mb-2">${dto.subName}</h3>
				</div>
			</div>
			
			<div class="col text-center">
				<div class="mt-5">
					<div class="mb-2">
						<i class="bi-heart fs-1 text-primary"></i>
					</div>
					<h3 class="h4 mb-2">${dto.tagName}</h3>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Portfolio-->

<div id="portfolio" class="mt-5">
	<div class="container-fluid p-0">
		<div class="row g-0">
		<c:forEach var="photo" items="${listPhoto}" varStatus="status">
			<div class="col-lg-4 col-sm-6">
				<a class="portfolio-box" href="#" title="Project Name">
				<img class="img-fluid w-100" src="${pageContext.request.contextPath}/uploads/lesson/${photo.photoName}" style="height:250px;">
					<div class="portfolio-box-caption">
						<div class="project-category text-white-50">${dto.className}</div>
						<div class="project-name">추가사진입니다.</div>
					</div>
				</a>
			</div>
		</c:forEach>	
		</div>
	</div>
</div>

<!-- Call to action-->
<section class="page-section bg-dark text-white">
	<div class="px-4 px-lg-5 text-center">
	
		<h2 class="mb-4 contentImg" style="max-width:100%">${dto.content}</h2>
		
		<a href="#" class="btn btn-light btn-xl">예약하러 가기</a>
	</div>
</section>


	<div class="tab-content pt-2" id="myTabContent">
		<div class="mt-3 pt-3 border-bottom">
			<p class="fs-4 fw-semibold title">원데이 클래스 리뷰</p> 
		</div>

		<div class="row border-bottom">
			<div class="col p-3 text-center">
				<div class="fs-6 fw-semibold">클래스 만족도</div>
				<div class="score-star review-score-star">
					<c:forEach var="n" begin="1" end="5">
						<c:set var="reviewScore" value="${dto.reviewScore + ((dto.reviewScore%1>=0.5) ? (1-dto.reviewScore%1)%1 : -(dto.reviewScore%1))}"/>
						<span class="item fs-2 ${dto.reviewScore>=n?'on':'off'}"><i class="bi bi-star-fill"></i></span>
					</c:forEach>
				</div>
				<div class="fs-2">
					<label class="review-score">${dto.reviewScore} / 5</label> 
				</div>
			</div>
			
			<div class="col p-3 text-center">
				<div class="fs-6 fw-semibold">리뷰수</div>
				<div class="fs-2"><i class="bi bi-chat-right-text"></i></div>
				<div class="fs-2 review-reviewCount">${dto.reviewCount}</div>
			</div> 
		
		<div class="mt-2 list-review"></div>
	</div>
	</div>
	
	
	
	<script>
	// 리뷰 -----
	$(function(){
			listReview(1);
		
	});

	function listReview(page) {
		let classNum = '${dto.classNum}';
		let sortNo = $('.reviewSortNo').val();
		let url = '${pageContext.request.contextPath}/review/list';
		let query = 'classNum='+classNum+'&pageNo='+page;
		
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
		
		if(dataCount > 0) {
			$('.reviewSort-area').show();
		} else {
			$('.reviewSort-area').hide();
		}
		
		
		let out = '';
		if(dataCount == 0){
			out += '<div class="border-top">';
			out += "<div class='text-center my-5'><h5>등록된 리뷰가 없습니다.</h5></div>";
			out += '</div>'
		}
		else {
			for(let item of data.list) {
				let reviewNum = item.reviewNum;
				let userName = item.userName;
				let reviewSubject = item.reviewSubject;
				let reviewScore = item.reviewScore;
				let reviewContent = item.reviewContent;
				let reviewDate = item.reviewDate;
				let replyContent = item.replyContent;
				let replyDate = item.replyDate;
				let fileName = item.fileName;
				// let deletePermit = item.deletePermit;
	
				out += '<div class="mt-3 border-bottom">';
				out += '  <div class="row p-2">';
				out += '     <div class="col-auto fs-2"><i class="bi bi-person-circle text-muted icon"></i></div>';
				out += '     <div class="col pt-3 ps-0 fw-semibold">'+userName+'</div>';
				out += '     <div class="col pt-3 text-end"><span>'+reviewDate+'</span>';
				out += '  </div>';
				out += '  </div>';
				out += '     <div class="col pt-3 ps-0 fw-semibold"><span style="font-size:1.2rem"><i class="bi bi-journal-text"></i> '+reviewSubject+'</span>';
				out += '  <div class="row p-2">';
				out += '    <div class="col-auto pt-0 ps-2 pe-1 score-star">';
				for(let i=1; i<=5; i++) {
					out += '  <span class="item fs-6 ' + (reviewScore>=i ? 'on' : 'off') + '"><i class="bi bi-star-fill"></i></span>';
				}
				out += '    </div>';
				out += '    <div class="col-auto ps-0 fs-6"><span>' + reviewScore + '점<span></div>';
				out += '  </div>';
				out += '  <div class="mt-2 p-2">' + reviewContent + '</div>';
	
				if(fileName && fileName.length > 0) {
					out += '<div class="row gx-1 mt-2 mb-1 p-1">';
						
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" style="height:150px; width:150px;" src="${pageContext.request.contextPath}/uploads/review/'+fileName+'">';
					out += '</div>';
				
					out += '</div>';
				}
				
				if(replyContent) {
					out += '  <div class="p-3 pt-0">';
					out += '    <div class="bg-light">';
					out += '      <div class="p-3 pb-0">';
					out += '        <label class="text-bg-primary px-2"> ${dto.nickName} 강사님 </label> <label>' + replyDate + '</label>';
					out += '      </div>';
					out += '      <div class="p-3 pt-1">' + replyContent + '</div>';
					out += '    </div>';
					out += '  </div>';
				}
				out += '</div>';
			}
			if(dataCount > 0) {
				out += '<div class="page-navigation">' + paging + '</div>';
			}
		}
		$('.list-review').html(out);
	}
	</script>
