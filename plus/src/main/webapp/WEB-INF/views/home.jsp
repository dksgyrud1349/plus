<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
const reviewBars = document.querySelectorAll('.review_bar');

function addSliceAnimation(index) {
	if (index >= 4) {
		const card = reviewBars[index].querySelector('.card');
		card.classList.add('slice-animation');
	}
}

for (let i = 0; i < reviewBars.length; i++) {
	addSliceAnimation(i);
}
</script>
<style>
.recommend{
  	margin: 0px auto;
  	overflow: hidden;
  	border-radius: 20px 20px 0 0;
}
.recommend img{
	transition: all 0.2s linear;
}
.recommend img:hover{
	transform: scale(1.2);
}
.c-t{
	color: #00BFFF;
}
</style>

	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		  <div class="carousel-item active" data-bs-interval="10000">
			<img src="${pageContext.request.contextPath}/resources/images/keyimage1.jpg" class="d-block w-100" alt="Slide 1">
		  </div>
		  <div class="carousel-item" data-bs-interval="2000">
			<img src="${pageContext.request.contextPath}/resources/images/keyimage2.jpg" class="d-block w-100" alt="Slide 2">
		  </div>
		  <div class="carousel-item">
			<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="d-block w-100" alt="Slide 3">
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
		  <span class="bi bi-caret-left-fill" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
		  <span class="bi bi-caret-right-fill" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	  </div>

	  <div class="row" style="margin: 3% auto;">
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/couple.jpg'); background-size: cover;">
  			<p class="cbtn_1">데이트</p>
		</button>
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/pottery.jpg'); background-size: cover;">
			<p class="cbtn_1">공예</p>
		</button>
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/handmade.jpg'); background-size: cover;">
			<p class="cbtn_1">핸드 메이드</p>
		</button>
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/exercise.jpg'); background-size: cover;">
			<p class="cbtn_1">건강·운동</p>
		</button>
	  </div>
	
	  <div class="mt-5" >
		<img src="${pageContext.request.contextPath}/resources/images/baner_1.jpg" width="100%" height="250px" style="border-radius: 20px;">
	  </div>
		
	
	
	 


	  <!-- card - 1-->
	  

	  <!--  -->
	  
	  <hr style="border: 3px dotted #47a3da;">
	  <div class="card-container d-flex justify-content-between" id="card-container">

		<button class="nav-btn-left" onclick="showPrevious()" style="background: white; border: none;">
				<i class="bi bi-caret-left"></i>
		</button>

	  <div class="card" style="width: 18rem;">
	  	<div class="recommend">
			<img src="${pageContext.request.contextPath}/resources/images/wood_1.jpg" class="card-img-top " alt="...">
		</div>
			 <div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
			<div class="card-body">
			  <h5 class="card-title">[서울]목공 클래스</h5>
			  <p class="card-text">-&nbsp;원하는 목재와 사이즈를 선택가능.<br>-&nbsp;버닝펜으로 자신만의 문구완성.<br>-&nbsp;퀄리티높은 나만의 도마 완성.</p>
			</div>
			<ul class="list-group list-group-flush">
			  <li class="list-group-item">강사이름 : 이승준</li>
			  <li class="list-group-item">가격 : 30,000원</li>
			  <li class="list-group-item">주소 : 서울특별시 강남구 반송로 148-9 4층 402호</li>
			</ul>
			<div class="card-body">
				<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
			  <a href="${pageContext.request.contextPath}/" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
			</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/pouch_1.jpg" class="card-img-top" alt="...">
	  </div>
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[서울]지갑 / 파우치 클래스</h5>
			<p class="card-text">-&nbsp;엣지코트, 이니셜불박 무료<br>-&nbsp;일상생활에서 사용하기에 유용.<br>-&nbsp;데이트, 취미, 모임활동 모두적합</p>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">강사이름 : 신유라</li>
		  <li class="list-group-item">가격 : 50,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 송파구 송파대로 555 (우)05510</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  <a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/flower_1.jpg" class="card-img-top" alt="...">
	  </div>
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[대구]플라워 클래스</h5>
			<p class="card-text">-&nbsp;홀더는 직접말린 생화를 이용<br>-&nbsp;티라이트있으면 지속사용가능<br>-&nbsp;지인에게 선물하기좋은 힐링수업</p>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">강사이름 : 이민주</li>
		  	<li class="list-group-item">가격 : 35,000원</li>
		  	<li class="list-group-item">주소 : 대전 중구 대종로451번길 엑스포로 107</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  <a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/flower_2.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[서울]보컬 트레이닝 클래스</h5>
			<p class="card-text">-&nbsp;호흡,발성 카피 및 분석<br>-&nbsp;본인 원하는곡 선정<br>-&nbsp;악보 및 수업에 필요 준비물 구비</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 안정희</li>
		  <li class="list-group-item">가격 : 40,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 마포구 월드컵북로 321 (우)03488</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/pouch_1.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[천안]스콘 만들기 클래스</h5>
			<p class="card-text">-&nbsp;레시피가 제공되는 수업.<br>-&nbsp;비교적 난이도쉬운 베이킹수업.<br>-&nbsp;맛있는 커피와 간식도 제공.</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 김정현</li>
		  <li class="list-group-item">가격 : 40,000원</li>
		  <li class="list-group-item">주소 : 충청남도 천안시 동남구 담방로21번길</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/flower_1.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[성남]필라테스 클래스</h5>
			<p class="card-text">-&nbsp;스트레스 해소/자세교정/다이어트<br>-&nbsp;4:1 소그룹 필라테스 수업<br>-&nbsp;필라테스 처음 접하시는분 환영</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 김예진</li>
		  <li class="list-group-item">가격 : 25,000원</li>
		  <li class="list-group-item">주소 : 경기도 성남시 분당구 판교로726번길 2</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/flower_2.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[서울]스쿠버다이빙 클래스</h5>
			<p class="card-text">-&nbsp;다이빙 방법 설명뒤 즉시 체험<br>-&nbsp;수중 인생샷 촬영<br>-&nbsp;부부와 커플 이색취미</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 최강남</li>
		  <li class="list-group-item">가격 : 65,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강서구 등촌동 513-11</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/wood_1.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[수원]드로우 페인팅 클래스</h5>
			<p class="card-text">-&nbsp;설명-스케치-채색까지 현장지도<br>-&nbsp;감성 인테리어 소품<br>-&nbsp;모든재료 준비물 구비</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 정유진</li>
		  <li class="list-group-item">가격 : 30,000원</li>
		  <li class="list-group-item">주소 : 경기도 수원시 권선구 세권로315번길 33-6</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/flower_1.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[용인]쿠키 만들기 클래스</h5>
			<p class="card-text">-&nbsp;1:1수업 가능<br>-&nbsp;2명이상 수강시 인기빵 지급.<br>-&nbsp;레시피 제공</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 박세리</li>
		  <li class="list-group-item">가격 : 35,000원</li>
		  <li class="list-group-item">주소 : 경기도 용인시 처인구 포곡읍 전대리 1387</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/flower_2.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[대구]코딩 클래스</h5>
			<p class="card-text">-&nbsp;원하는 프로그램 개별맞춤<br>-&nbsp;기초다지기 액기스 수업<br>-&nbsp;시간협상후 개별레슨 가능</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 김호준</li>
		  <li class="list-group-item">가격 : 50,000원</li>
		  <li class="list-group-item">주소 : 대구광역시 서구 덕소로97번길 6721</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/wood_1.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[서울]반려동물 훈련 클래스</h5>
			<p class="card-text">-&nbsp;원하는 훈련 개별맞춤<br>-&nbsp;다양한 사진스팟<br>-&nbsp;반려동물 간식제공</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 이웅종</li>
		  <li class="list-group-item">가격 : 40,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 봉은사로944번길 1554</li>
		</ul>
		<div class="card-body " style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
	  <div class="recommend">
		<img src="${pageContext.request.contextPath}/resources/images/pouch_1.jpg" class="card-img-top" alt="...">
	  </div>	
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">[광주]플라워 클래스</h5>
			<p class="card-text">-&nbsp;런던 스타일 플라워 제작<br>-&nbsp;런던느낌 스타일링과 포장지사용<br>-&nbsp;필요한 재료,도구 모두구비</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름 : 이소리</li>
		  <li class="list-group-item">가격 : 30,000원</li>
		  <li class="list-group-item">주소 : 광주광역시 광산구 우산동 오성로 1773-5</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
		
		
	  </div>
	  <button class="nav-btn-right" onclick="showNext()" style="background: white; border: none;"><i class="bi bi-caret-right"></i>
	  </button>
	  </div>
	  
		<hr style="border: 3px dotted #47a3da;">
	  
	  <div class="mt-5" >
		<img src="${pageContext.request.contextPath}/resources/images/baner_2.jpg" width="100%" height="150px" style="border-radius: 20px;">
	  </div>

	
		
	  
	<script>
        const cardContainer = document.getElementById('card-container');
        const totalCards = document.querySelectorAll('.card').length;
        let currentIndex = 0;

        function showCards(startIndex) {
            const endIndex = startIndex + 4;
            for (let i = 0; i < totalCards; i++) {
                const card = document.querySelectorAll('.card')[i];
                card.style.display = (i >= startIndex && i < endIndex) ? 'block' : 'none';
            }
        }

        function showNext() {
            currentIndex += 4;
            if (currentIndex >= totalCards) {
                currentIndex = 0;
            }
            showCards(currentIndex);
        }

        function showPrevious() {
            currentIndex -= 4;
            if (currentIndex < 0) {
                currentIndex = totalCards - (totalCards % 4 || 4);
            }
            showCards(currentIndex);
        }
        showCards(currentIndex);
    </script>
    
    
    <div class="container">
	  <div class="row" style="margin: 3% auto;">
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#date')"> #이색데이트 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#lover')"> #반려동물 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#wood')"> #향수 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#family')"> #선물 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#group')"> #단체 </button>	    
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#date2')"> #댄스 </button>
	  </div>
	  	<div id="date" class="explain">항상 같은 데이트코스에서 벗어나 새로운 추억을 쌓고싶진 않으신가요? <br>소중한 사람과 함께하기 좋은 새로운 이색 데이트 루틴을 원하시면 방문해보세요~</div>
	    <div id="lover" class="explain">반려동물을 위한 무언가를 만들어보고싶지 않으신가요? 소중한 반려동물, 좋은 것만 주고 싶은게 집사의 마음이잖아요 ㅎ <br>사랑을 가득 담아 아이들에게 특별한 추억을 선물해주세요!</div>
	    <div id="wood" class="explain">나에게서 이런 향이 났으면 좋겠다, 생각해 보신 적 있으신가요? 내가 좋아하는 향을 찾고, 예쁘게 향수병도 꾸며보아요!<br>혼자만의 힐링, 커플 데이트, 우정 체험으로 모두 좋습니다!! </div>
	    <div id="family" class="explain">겨울의 쌀쌀해진 날씨에 부담없는 따듯한 선물하나 직접 만들어보는건 어떠시나요? <br>가족, 애인, 친구에게 고마운 마음을 전해보아요.</div>
	  	<div id="group" class="explain">동호회모임, 친구들과의 모임, 회사단체클래스등 쉽게 접하지 못했던 여러 단체클래스를 소개해드립니다~</div>	    
	    <div id="date2" class="explain">춤을 한번도 배워본 적 없는 분들, 혹은 그냥 즐기며 스트레스 풀고 싶으신 분들, 가볍고 재미있는 분위기에서 경험해봐요~</div>
	
	  <div class="row" style="margin: 3% auto;">
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#indoor')"> #실내운동 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#leather')"> #목공 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#leisure')"> #레저 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#flower')"> #플라워 </button>
	    <button type="button" class="btn btn-info col-sm explainbtn" onclick="toggleExplain('#sports')"> #쿠킹 </button>
	  </div>
	</div>
	    <div id="indoor" class="explain">밖으로 돌아다니기는 부담스럽고 집에만 있기에는 너무 답답하시나요? <br>원데이플러스에서 다양한 실내운동을 즐겨봐요!</div>
	    <div id="leather" class="explain">부담없이 의미있는 체험을 원하시는 분들! <br>친구 연인 가족 누구와 함께해도 부담되지않고,쉽고 재미있게 우리만의 추억을 쌓을수 있는 목공체험은 어떠신가요?</div>
	    <div id="leisure" class="explain">레저스포츠 취미를 갖는건 어떠신가요? 관심이 있었지만 혼자 시작하기에 부담되셨나요? <br>원데이플러스에서 부담없이 새로운 추억을 만들어드립니다~</div>
	    <div id="flower" class="explain">벌써 코 앞으로 다가온 크리스마스! 나만의 크리스마스 트리를 조화가 아닌 생화로 직접 만들어 보는 건 어떨까요?</div>
	    <div id="sports" class="explain">살면서 스스로 여러 쿠킹경험도 가져볼만하지 않아요? <br>초보자도 재미있고 쉽게 만들 수 있도록 도와드려요. 힐링하시는 마음만 가지고 즐겨봐요~</div>
	
	
	<script>
	  function toggleExplain(id) {
	    $(id).toggle();
	  }
	</script>
    
	
<h1 class="mt-5">실시간 리뷰</h1>
<hr style="border: 3px dotted #47a3da;">
<div class="review">
	<div class="review_bar">
	  <div class="cardreview">
		<img src="${pageContext.request.contextPath}/resources/images/review_1.jpg" alt="Menu Image">
		<div class="card_content">
			초코가 말을 잘들어요! ★★★★★<br>
			<span class="c-t">[서울]반려동물 훈련 클래스<br></span>
			우리집 강아지가 달라졌어요~^^<br>
			(김준호)
		</div>
	 </div>
	</div>

	<div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_2.jpg" alt="Menu Image">
		  <div class="card_content">
			생각보다 재밌어요. ★★★★☆<br>
			<span class="c-t">[서울]목공 클래스<br></span>
			생각했던것보다 재밌고 색다른경험이었습니다.<br>
			(이정환)
		</div>
	   </div>
	  </div>
	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_3.jpg" alt="Menu Image">
		  <div class="card_content">
			완전 색다른경험! ★★★★★<br>
			<span class="c-t">[서울]스쿠버다이빙 클래스<br></span>
			너무좋은 경험이고 여행 다녀온기분이에요. 다음에 또올게요~<br>
			(이설화)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_4.jpg" alt="Menu Image">
		  <div class="card_content">
			스콧 개맛집! ★★★★★<br>
			<span class="c-t">[천안]스콘 만들기 클래스<br></span>
			스콘은 역시 천안~!<br>
			(선경호)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_5.jpg" alt="Menu Image">
		  <div class="card_content">
			강추합니다!! ★★★★★<br>
			<span class="c-t">[광주]런던 플라워 클래스<br></span>
			꽃을 좋아하시는분이면 이 클래스 강추! 꼭 들어보세요.<br>
			(김지혜)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_6.jpg" alt="Menu Image">
		  <div class="card_content">
			맛있어요. ★★★★☆<br>
			<span class="c-t">[용인]수제쿠키 만들기 클래스<br></span>
			쿠키 잘~먹고갑니다~ ^^7<br>
			(박정화)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_7.jpg" alt="Menu Image">
		  <div class="card_content">
			재밌어요! ★★★★★<br>
			<span class="c-t">[서울]지갑 / 파우치 클래스<br></span>
			찾았다 내 인생지갑!! 지갑도 너무 만족스럽고 클래스도 재밌었어요~<br>
			(최지연)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_8.jpg" alt="Menu Image">
		  <div class="card_content">
			오늘거의 이승철빙의. ★★★★★<br>
			<span class="c-t">[서울]보컬 트레이닝 클래스<br></span>
			밖으로~ 나가버리고~~<br>
			(강지수)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_9.jpg" alt="Menu Image">
		  <div class="card_content">
			완전재밌어요! ★★★★★<br>
			<span class="c-t">[성남]필라테스 클래스<br></span>
			평소 자세교정 필요했는데 재미도 챙기고 몸도 챙긴기분이에요.감사합니다~<br>
			(선예지)
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_10.jpg" alt="Menu Image">
		  <div class="card_content">
			수업이 재밌어요ㅋㅋ ★★★★★<br>
			<span class="c-t">[수원]드로우 페인팅 클래스<br></span>
			정쌤 페인팅수업 들으면서 너무웃기고 너무재밌었어요!bb<br>
			(최수진)
		</div>
	   </div>
	  </div>
	  
	</div>
			
			