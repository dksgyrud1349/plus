<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function view(arg){
	$(".time1, .time2, .time3, .time4, .ad1, .ad2, .ad3, .ad4").css("display","none");
	if(arg=="0") {
		$(".time2, .ad2").css("display","block");
		viewcount = 1;
	}
	else if(arg=="1") {
		$(".time3, .ad3").css("display","block");
		viewcount = 2;
	}
	else if(arg=="2") {
		$(".time4, .ad4").css("display","block");
		viewcount = 3;
	}
	else if(arg=="3") {
		$(".time1, .ad1").css("display","block");
		viewcount = 0;
	}
	}
	var viewcount = 0;
	var rtcarousel = setInterval(function(){ view(viewcount) },5000);
	
	$("#best_search").mouseenter(function() {
		clearInterval(rtcarousel);
	});
	
	$("#best_search").mouseleave(function() {
		rtcarousel = setInterval(function(){ view(viewcount) },5000);
	});
	
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<style>
	#txt{
	   display:flex;
	   align-items:center;
	   float:left;
	   flex:1;
	   font-family:sans-serif;
	   letter-spacing:3.5px;
	   font-size:2.0rem;
	   font-weight:700;
	   position:relative;

	}
	#txt>b{
	   height:2.3rem;
	   box-shadow:0 .4rem .3rem -.3rem #aaa;
	   color:#979c9f;
	  background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(25,117,190,1) 100%);
	   background-clip:text;
	   text-fill-color:transparent;
	   -webkit-background-clip:text;
	   -webkit-text-fill-color:transparent;
	   transform-origin:bottom;
	   transform:rotateX(-85deg);
	   -webkit-transform-origin:bottom;
	   -webkit-transform:rotateX(-85deg);
	   animation:getUp 5s infinite;
	}
	#txt>b:nth-child(2){
	   animation-delay:.25s;
	}
	#txt>b:nth-child(3){
	   animation-delay:.5s;
	}
	#txt>b:nth-child(4){
	   animation-delay:.75s;
	}
	#txt>b:nth-child(5){
	   animation-delay:1s;
	}
	#txt>b:nth-child(6){
	   animation-delay:1.25s;
	}
	#txt>b:nth-child(7){
	   animation-delay:1.5s;
	}
	#txt>b:nth-child(8){
	   animation-delay:1.75s;
	}
	@keyframes getUp{
	   10%,50%{
	      transform:rotateX(0);
	   }
	   0%,60%,100%{
	      transform:rotateX(-85deg);
	   }
	}
	.tltle{
		font-weight: bold;
		font-size: 200%;
	}
	.bar:focus{
		text-decoration: underline;
		text-underline-position : under;
		text-decoration-color: #47a3da;
		text-decoration-thickness: 2px;
		color: #47a3da;	
	}
	.menu:hover{
		text-decoration: underline;
		text-underline-position : under;
		text-decoration-thickness: 2px;
		text-decoration-color: #47a3da;
		font-weight: 900;
		color: #47a3da;
	}
	.menu:focus{
		color: #47a3da;
		text-decoration: underline;
		text-underline-position : under;
	}
	.go-ahead{
		text-decoration: underline; 
		text-underline-position : under; 
		font-size: 18px;
		color: #FFA98F;
	}
	.go-ahead:hover{
		font-size: 18px;
		color: #FF7F50;
	}
	.go-ahead:focus{
		font-size: 18px;
		color: #FF7F50;
	}
	
	
	
	
	
	.hover-content {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: #47a3da;
	    color: white;
	    font-weight: bold;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    opacity: 0;
	    transition: opacity 0.3s ease;
	    border-radius: 15px;
	}
	
	.checkbox-button:hover .hover-content,
	.checkbox-container input[type="button"]:checked + .checkbox-button .hover-content {
	    opacity: 1;
	}
	
	.checkbox-container {
	    display: inline-block;
	    position: relative;
	    border: 2px solid transparent;
	}
	
	input[type="button"] {
	    display: none;
	}
	
	.checkbox-container label {
	    display: block;
	    cursor: pointer;
	}
	
	
	
</style>


<!-- header start-->
			<header class="clearfix">
				<span>원데이 클래스 추천 </span>
				<div class="txt" id="txt">
				        <b>원</b>
				        <b>데</b>
				        <b>이</b>
				        <b>플</b>
				        <b>러</b>
				        <b>스</b>
				        <b>+</b>
				</div>
				
			<form action="${pageContext.request.contextPath}/lesson/main" name="searchForm" method="post">
				<div class="search">
					<i class="bi bi-search-heart" style="padding: 10px;"></i>
					<input type="text" name="kwd" placeholder="검색어를 입력하세요." class="searchbox">
					<button type="button" class="btn search-button " onclick="searchList()">검색</button>
				</div>
				
				<nav>
				<c:choose>
					<c:when test="${empty sessionScope.member}">
						<audio id="myAudio">
						    <source src="${pageContext.request.contextPath}/resources/sound/mainSound.mp3" type="audio/mp3">
						</audio>
						
						<a href="#" class="icon-arrow-left bi bi-play-fill" data-info="노래" onclick="togglePlayPause()">노래</a>
						<a href="${pageContext.request.contextPath}/member/member" class="icon-drop bi bi-person" data-info="회원가입">회원가입</a>
						<a href="javascript:dialogLogin();" class="icon-arrow-left bi bi-person-fill-gear" data-info="로그인">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="icon-arrow-left bi bi-play-fill" data-info="노래" onclick="togglePlayPause()">노래</a>
						<audio id="myAudio">
						    <source src="${pageContext.request.contextPath}/resources/sound/mainSound.mp3" type="audio/mp3">
						</audio>
						<a href="${pageContext.request.contextPath}/note/receive/list" class="icon-arrow-left bi bi-envelope-open" data-info="쪽지">쪽지</a>
						<a href="${pageContext.request.contextPath}/member/logout" class="icon-drop bi bi-person" data-info="로그아웃"></a>
						<c:if test="${sessionScope.member.membership > 90}">
							<a href="${pageContext.request.contextPath}/admin" class="icon-drop bi bi-gear-wide-connected" data-info="관리자 페이지"></a>
						</c:if>
						<c:if test="${sessionScope.member.membership > 50 && sessionScope.member.membership < 90}">
							<a href="${pageContext.request.contextPath}/pluszone" class="icon-drop bi bi-gear-wide-connected" data-info="사업자 페이지"></a>
						</c:if>
					</c:otherwise>
				</c:choose>
				</nav>
			</form>
		</header>
		
		<script>
		    var audio = document.getElementById("myAudio");
			
		    function togglePlayPause() {
		        if (audio.paused) {
		            audio.play();
		        } else {
		            audio.pause();
		        }
		    }
		</script>
			
			<ul id="best_search" style="margin-left: 30px;">
				<li><p>인기검색어</p></li>
				<li>
					<dl class="time1">
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=1&mainNum=1"><div class="num">1</div>간식</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=2&mainNum=1"><div class="num">2</div>장난감</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=3&mainNum=1"><div class="num">3</div>미용</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=4&mainNum=2"><div class="num">4</div>천연화장품</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=5&mainNum=2"><div class="num">5</div>메이크업</a></dd>
					</dl>
					<dl class="time2" style="display:none;">
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=6&mainNum=2"><div class="num">6</div>헤어</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=7&mainNum=2"><div class="num">7</div>네일아트</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=8&mainNum=2"><div class="num">8</div>향수</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=9&mainNum=3"><div class="num">9</div>스킨스쿠버</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=10&mainNum=3"><div class="num">10</div>서핑</a></dd>
					</dl>
					<dl class="time3" style="display:none;">
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=11&mainNum=3"><div class="num">11</div>클라이밍</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=12&mainNum=3"><div class="num">12</div>펜싱</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=13&mainNum=3"><div class="num">13</div>카약</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=14&mainNum=3"><div class="num">14</div>테니스</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=15&mainNum=3"><div class="num">15</div>배드민턴</a></dd>
					</dl>
					<dl class="time4" style="display:none;">
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=16&mainNum=4"><div class="num">16</div>프로듀싱</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=17&mainNum=4"><div class="num">17</div>보컬</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=18&mainNum=4"><div class="num">18</div>국악</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=19&mainNum=4"><div class="num">19</div>댄스</a></dd>
						<dd><a class="t" href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=20&mainNum=4"><div class="num">20</div>악기</a></dd>
					</dl>
				</li>
				<li>
					<a class="best_add ad1" style="cursor:pointer" onClick="javascript:view('0')">&#62;</a>
					<a class="best_add ad2" onClick="javascript:view('1')" style="display:none;cursor:pointer" >&#62;</a>
					<a class="best_add ad3" onClick="javascript:view('2')" style="display:none;cursor:pointer" >&#62;</a>
					<a class="best_add ad4" onClick="javascript:view('3')" style="display:none;cursor:pointer" >&#60;</a>
				</li>
			</ul>	
			<div class="main">
				<nav id="cbp-hrmenu" class="cbp-hrmenu">
					<ul>
						<li>
							<a href="#" class="bar">원데이 클래스</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner">
									<div>
										<h4 class="tltle">이달의 추천 클래스<hr class="my-hr1"></h4>
										<ul>
											<li><a href="${pageContext.request.contextPath}/lesson/detail/116" class="menu">겉바속촉 마들렌과 스콘만들기</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/detail/119" class="menu">3D피부테스트 & 맞춤형화장품 만들기</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/detail/120" class="menu">꽃꽂이-프렌치스타일의꽃바구니 만들기</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/detail/121" class="menu">명작모작 페인팅 원데이클래스</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/detail/122" class="menu">반려 동물과 함께하는 펫 목걸이 만들기</a></li>
										</ul>
									</div>
									
									<div>
										<h4 class="tltle">메인 카테고리<hr class="my-h	r1"></h4>
										<ul>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=1" class="menu">반려동물</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=2" class="menu">뷰티</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=3" class="menu">스포츠</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=4" class="menu">음악</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=5" class="menu">쿠킹</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=6" class="menu">핸드메이드</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=7" class="menu">플라워가드닝</a></li>
											<li><a href="${pageContext.request.contextPath}/lesson/main?kwd=&schType=all&subNum=&mainNum=8" class="menu">드로잉</a></li>
										</ul>
									</div>
									
									<div>
										<h4 class="tltle">원데이 클래스 더보기<hr class="my-hr1"></h4>
										<ul>
											
											<li>
												<label class="checkbox-container">
													<input type="button" onclick="location.href='${pageContext.request.contextPath}/lesson/main'">
												 	<div class="checkbox-button">
														<img src="${pageContext.request.contextPath}/resources/images/main/onedayclass_1.png" width="300px;" height="200px;"
														style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
													 	<div class="hover-content">원데이 클래스 더보기</div>
													</div>
												</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						
						<li>
							<a href="#" class="bar">이벤트</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner">
									<div>
										<h4 class="tltle">NEW 이벤트<hr class="my-hr1"></h4>
										<ul>
											<li>
												<label class="checkbox-container">
													<input type="button" onclick="location.href='${pageContext.request.contextPath}/event/progress/article?page=1&&eventNum=15'">
												 	<div class="checkbox-button">
														<img src="${pageContext.request.contextPath}/resources/images/main/eventsales_1.png" width="300px;" height="200px;"
														style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
													 	<div class="hover-content">신년맞이 이벤트</div>
													</div>
												</label>
											</li>
										</ul>
										
									</div>
									<div>
										<h4 class="tltle">기획전<hr class="my-hr1"></h4>
										<ul>
											<li>
												<label class="checkbox-container">
													<input type="button" onclick="location.href='${pageContext.request.contextPath}/event/progress/article?page=1&&eventNum=17'">
												 	<div class="checkbox-button">
														<img src="${pageContext.request.contextPath}/resources/images/main/eventsales_4.png" width="300px;" height="200px;"
														style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
													 	<div class="hover-content">마음을 선물하는 방법</div>
													</div>
												</label>
											</li>
										</ul>
										
									</div>
									<div>
										<h4 class="tltle">이벤트 더보기<hr class="my-hr1"></h4>
										<ul>
											<li>
												<label class="checkbox-container">
													<input type="button" onclick="location.href='${pageContext.request.contextPath}/event/progress/list'">
												 	<div class="checkbox-button">
														<img src="${pageContext.request.contextPath}/resources/images/main/event_1.png" width="300px;" height="200px;"
														style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
													 	<div class="hover-content">이벤트 더보기</div>
													</div>
												</label>
											</li>
										</ul>
										
									</div>
								</div>
							</div>
						</li>
						
						<li>
							<a href="#" class="bar">고객센터</a><span class="border-end"></span>
							<div class="cbp-hrsub">
								<div class="cbp-hrsub-inner"> 
									<div>
										<h4 class="tltle">문의<hr class="my-hr1"></h4>
										<ul>
											<li><a href="${pageContext.request.contextPath}/faq/main" class="menu">자주 묻는 질문</a></li>
											<li><a href="${pageContext.request.contextPath}/notice/list" class="menu">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/declaration/article" class="menu">신고하기</a></li>
											<li><a href="${pageContext.request.contextPath}/suggest/article" class="menu">제안하기</a></li>
											<li><a href="${pageContext.request.contextPath}/inquiryAd/list" class="menu">1:1 문의</a></li>
											<li><a href="${pageContext.request.contextPath}/etc/list" class="menu">연락처/위치 안내</a></li>
										</ul>
									</div>
									<div>
										<h4 class="tltle">공지사항 바로가기<hr class="my-hr1"></h4>
										<ul>
											<li>
												<label class="checkbox-container">
													<input type="button" onclick="location.href='${pageContext.request.contextPath}/notice/list'"></button>
												 	<div class="checkbox-button">
														<img src="${pageContext.request.contextPath}/resources/images/main/notice_1.png" width="300px;" height="200px;" 
														style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
													 	<div class="hover-content">공지사항 바로가기</div>
													</div>
												</label>
											</li>
										</ul>
										
									</div>
									<div>
										<h4 class="tltle">고객센터 바로가기<hr class="my-hr1"></h4>
										<ul>
											<li>
												<label class="checkbox-container">
													<input type="button" onclick="location.href='${pageContext.request.contextPath}/faq/main'"></button>
												 	<div class="checkbox-button">
														<img src="${pageContext.request.contextPath}/resources/images/main/center_1.png" width="300px;" height="200px;" 
														style="border-radius: 20px; box-shadow: -5px -3px 3px  3px black inset, 3px 2px 3px 3px white;">
													 	<div class="hover-content">고객센터 바로가기</div>
													</div>
												</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						
						<li>
						    <li onclick="urlOk('/bbs/list')" class="menubtn bar">커뮤니티</li><span class="border-end"></span>
						</li>
						
						<li>
							<li onclick="urlOk('/sitemap/sitemap')" class="menubtn bar">사이트맵</li><span class="border-end"></span>
						</li>
						
						<li>
						    <li onclick="urlOk('/onedayplus/onedayplus')" class="menubtn bar">원데이 플러스</li><span class="border-end"></span>
						</li>
						
						<c:choose>
							<c:when test="${empty sessionScope.member}">
								<li>
									<li onclick="urlOk('/pluszone/member/member')" class="menubtn bar">플러스존 가입</li>
								</li>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.member.membership == 49}">
									<li>
										<li onclick="urlOk('/pluszone/question/list')" class="menubtn bar">플러스존 요청</li>
									</li>
								</c:if>
								<c:if test="${sessionScope.member.membership > 50}">
									<li>
										<li onclick="urlOk('/pluszone')" class="menubtn bar">플러스존</li>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>

		
		<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
		<script>
			function urlOk(url) {
			    window.location.href = "${pageContext.request.contextPath}" + url;
			  }
		
			$(function() {
				cbpHorizontalMenu.init();
			});
		</script>

	<!-- header end-->