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
.font1 {
	font-family: 'JalnanGothic';
}
</style>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" /> 

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main">
					<h3 class="font1" style="border-top: 1px solid black; padding-top: 20px;">
						<i class="bi bi-info-square-fill"></i> 연락처/위치 안내
					</h3>
		
					<div id="map" style="height: 400px; border: 1px solid #ccc; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);" class="mt-4 mb-4">
					  <script>
					    var map = L.map('map').setView([37.556530, 126.919512], 15);
					    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
					      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
					    }).addTo(map);
					    var marker = L.marker([37.556530, 126.919512]).addTo(map);
					    marker.bindPopup("서울, 대한민국, 쌍용강북교육센터").openPopup();
					  </script>
		  			</div>
		  			
		  			<div class="row mb-2">
					  <div class="col-md-6">
					    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col p-4 d-flex flex-column position-static">
					        <strong class="d-inline-block mb-2 text-primary-emphasis">고객지원센터</strong>
					        <h3 class="mb-0">전태희</h3>
					        <div class="mb-1 text-body-secondary">센터장</div>
					        <p class="mb-auto"><i class="bi bi-telephone-fill"></i> 010-1111-1111</p>
					        <p class="mb-auto"><i class="bi bi-telegram"></i> 1111@naver.com</p>
					        <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
					         원데이플러스 + 고객지원 센터장
					        </a>
					      </div>
					      <div class="col-auto d-none d-lg-block">
					        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="bd-placeholder-img" width="200" height="250"  role="img">
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-md-6">
					    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col p-4 d-flex flex-column position-static">
					        <strong class="d-inline-block mb-2 text-success-emphasis">고객지원센터</strong>
					        <h3 class="mb-0">김정균</h3>
					        <div class="mb-1 text-body-secondary">대리</div>
					        <p class="mb-auto"><i class="bi bi-telephone-fill"></i> 010-2222-2222</p>
					        <p class="mb-auto"><i class="bi bi-telegram"></i> 2222@naver.com</p>
					        <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
					          원데이플러스 + 고객지원 센터 대리
					        </a>
					      </div>
					      <div class="col-auto d-none d-lg-block">
					      	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="bd-placeholder-img" width="200" height="250"  role="img">
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-md-6">
					    <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250">
					      <div class="col p-4 d-flex flex-column position-static">
					        <strong class="d-inline-block mb-2 text-primary-emphasis">고객지원센터</strong>
					        <h3 class="mb-0">이준영</h3>
					        <div class="mb-1 text-body-secondary">상담원</div>
					        <p class="mb-auto"><i class="bi bi-telephone-fill"></i> 010-3333-3333</p>
					        <p class="mb-auto"><i class="bi bi-telegram"></i> 3333@naver.com</p>
					        <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
					          원데이플러스 + 고객지원 센터 1팀
					        </a>
					      </div>
					      <div class="col-auto d-none d-lg-block">
					      	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="bd-placeholder-img" width="200" height="250"  role="img">
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-md-6">
					    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col p-4 d-flex flex-column position-static">
					        <strong class="d-inline-block mb-2 text-success-emphasis">고객지원센터</strong>
					        <h3 class="mb-0">임희정</h3>
					        <div class="mb-1 text-body-secondary">상담원</div>
					        <p class="mb-auto"><i class="bi bi-telephone-fill"></i> 010-5555-5555</p>
					        <p class="mb-auto"><i class="bi bi-telegram"></i> 5555@naver.com</p>
					        <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
					          원데이플러스 + 고객지원 센터 2팀
					        </a>
					      </div>
					      <div class="col-auto d-none d-lg-block">
					      	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="bd-placeholder-img" width="200" height="250"  role="img">
					      </div>
					    </div>
					  </div>
					  
					  <div class="col-md-6">
					    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col p-4 d-flex flex-column position-static">
					        <strong class="d-inline-block mb-2 text-primary-emphasis">고객지원센터</strong>
					        <h3 class="mb-0">안효경</h3>
					        <div class="mb-1 text-body-secondary">상담원</div>
					        <p class="mb-auto"><i class="bi bi-telephone-fill"></i> 010-6666-6666</p>
					        <p class="mb-auto"><i class="bi bi-telegram"></i> 6666@naver.com</p>
					        <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
					          원데이플러스 + 고객지원 센터 3팀
					        </a>
					      </div>
					      <div class="col-auto d-none d-lg-block">
					      	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="bd-placeholder-img" width="200" height="250"  role="img">
					      </div>
					    </div>
					  </div>
					  <div class="col-md-6">
					    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					      <div class="col p-4 d-flex flex-column position-static">
					        <strong class="d-inline-block mb-2 text-success-emphasis">고객지원센터</strong>
					        <h3 class="mb-0">김아은</h3>
					        <div class="mb-1 text-body-secondary">상담원</div>
					        <p class="mb-auto"><i class="bi bi-telephone-fill"></i> 010-7777-7777</p>
					        <p class="mb-auto"><i class="bi bi-telegram"></i> 7777@naver.com</p>
					        <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
					          원데이플러스 + 고객지원 센터 안내팀
					        </a>
					      </div>
					      <div class="col-auto d-none d-lg-block">
					      	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="bd-placeholder-img" width="200" height="250"  role="img">
					      </div>
					    </div>
					  </div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</main>