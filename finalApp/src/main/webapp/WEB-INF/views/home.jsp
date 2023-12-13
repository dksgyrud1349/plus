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
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/center.jpg');">
  			<p class="cbtn_1">데이트</p>
		</button>
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/center.jpg');">
			<p class="cbtn_1">공예</p>
		</button>
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/center.jpg');">
			<p class="cbtn_1">핸드 메이드</p>
		</button>
		<button type="button" class="btn btn-light col cbtn" style="background: url('${pageContext.request.contextPath}/resources/images/center.jpg');">
			<p class="cbtn_1">건강·운동</p>
		</button>
	  </div>
	 
	  <div class="mt-5" >
		<img src="${pageContext.request.contextPath}/resources/images/baner_1.jpg" width="100%" height="250px" style="border-radius: 20px;">
	  </div>
		
	
	
	 


	  <!-- card - 1-->
	  

	  
	  
	  <hr style="border: 3px dotted #47a3da;">
	  <div class="card-container d-flex justify-content-between" id="card-container">

		<button class="nav-btn-left" onclick="showPrevious()" style="background: white; border: none;">
				<i class="bi bi-caret-left"></i>
		</button>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/wood_1.jpg" class="card-img-top" alt="...">
		 <div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
		  <h5 class="card-title">목공 클래스</h5>
		  <p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  <a href="${pageContext.request.contextPath}/" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/pouch_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">지갑 / 파우치 클래스</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  <a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/flower_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">플라워 클래스</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
		  <a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  <a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/flower_2.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">플라워 클래스</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/pouch_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-5</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/flower_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-6</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/flower_2.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-7</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/wood_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-8</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/flower_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-9</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/flower_2.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-10</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/wood_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-11</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body " style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
	  </div>

	  <div class="card" style="width: 18rem;">
		<img src="${pageContext.request.contextPath}/resources/images/pouch_1.jpg" class="card-img-top" alt="...">
		<div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">추천 클래스</div>
		<div class="card-body">
			<h5 class="card-title">원데이 클래스 이름-12</h5>
			<p class="card-text">클래스 설명-1<br>클래스 설명-1<br>클래스 설명-1</p>
		</div>
		<ul class="list-group list-group-flush">
		  <li class="list-group-item">강사이름</li>
		  <li class="list-group-item">가격 : 10,000원</li>
		  <li class="list-group-item">주소 : 서울특별시 강남구 123번길 123</li>
		</ul>
		<div class="card-body" style="margin:0 auto;">
			<a href="#" class="card-link" style="float: left; margin: 4% auto">예약하기</a>
		  	<a href="#" class="card-link1" style="float: right; margin: 4% auto">자세히보기</a>
		</div>
		
		
	  </div>
	  <button class="nav-btn-right" onclick="showNext()" style="background: white; border: none;"><i class="bi bi-caret-right"></i></button>
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
			1번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	 </div>
	</div>

	<div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_2.jpg" alt="Menu Image">
		  <div class="card_content">
			2번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>
	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_3.jpg" alt="Menu Image">
		  <div class="card_content">
			3번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_4.jpg" alt="Menu Image">
		  <div class="card_content">
			4번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_5.jpg" alt="Menu Image">
		  <div class="card_content">
			5번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_6.jpg" alt="Menu Image">
		  <div class="card_content">
			6번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_7.jpg" alt="Menu Image">
		  <div class="card_content">
			7번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_8.jpg" alt="Menu Image">
		  <div class="card_content">
			8번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_9.jpg" alt="Menu Image">
		  <div class="card_content">
			9번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>

	  <div class="review_bar">
		<div class="cardreview">
		  <img src="${pageContext.request.contextPath}/resources/images/review_10.jpg" alt="Menu Image">
		  <div class="card_content">
			10번 리뷰 + 별점<br>
			원데이 클래스 이름<br>
			리뷰 내용<br>
			작성자
		</div>
	   </div>
	  </div>
	  
	</div>
	<hr style="border: 3px dotted #47a3da;">