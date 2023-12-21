<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

@media (min-width: 992px) {
  body {
    padding-top: 0;
    padding-left: 12rem;
  }
}

.pcontent {
  font-size: 1.15rem;
  font-weight: 400;
}

#sideNav {
  padding-left: 1rem;
  padding-right: 1rem;
}
#sideNav .navbar-nav .nav-item .nav-link {
  font-weight: 800;
  letter-spacing: 0.05rem;
  text-transform: uppercase;
}
#sideNav .navbar-toggler:focus {
  outline-color: #d48a6e;
}

@media (min-width: 992px) {
  #sideNav {
    padding-left: 0;
    padding-right: 0;
    position: fixed;
    display: flex;
    flex-direction: column;
    width: 13rem;
    height: 100vh;
    z-index:0;
  }
  #sideNav .navbar-brand {
    display: flex;
    margin: auto auto 0;
    padding: 0.5rem;
  }
  #sideNav .navbar-brand .img-profile {
    max-width: 10rem;
    max-height: 10rem;
    border: 0.5rem solid rgba(255, 255, 255, 0.2);
  }
  #sideNav .navbar-collapse {
    display: flex;
    align-items: flex-start;
    flex-grow: 0;
    width: 100%;
    margin-bottom: auto;
  }
  #sideNav .navbar-collapse .navbar-nav {
    flex-direction: column;
    width: 100%;
  }
  #sideNav .navbar-collapse .navbar-nav .nav-item {
    display: block;
  }
  #sideNav .navbar-collapse .navbar-nav .nav-item .nav-link {
    display: block;
  }
}







.itembox{
  width: 100%;
  margin: 0 auto;
  display: flex;
  gap: 2px;
}

.itembox_bar {
  position: relative;
  font-size: 1.5rem;
  font-weight: bold;
  color: white;
  text-align: center;
  border-radius: 10px;
  padding: 0rem;
  height: 270px;
  flex: 1;
  transition: 0.5s ease-in-out;
}

.itembox_bar:hover {
  flex: 2;
  cursor: pointer;
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypagemenu.css" />

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-light fixed-top" id="sideNav">
    <a class="navbar-brand" href="#page-top">
        <span class="d-none d-lg-block">
            <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg"/>
        </span>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav menu-4">
          <li class="nav-item"><a class="nav-link" href="#" data-hover="마이페이지" style="border-bottom: 3px solid orange !important;">마이페이지</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="내정보 및 수정">내정보 수정</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="알림 / 쪽지 내역">알림 / 쪽지 내역</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="예약내역">예약내역</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="위시리스트">위시리스트</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="리뷰">리뷰</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="문의내역">문의내역</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="탈퇴">탈퇴</a></li>
        </ul>
    </div>
</nav>
<div class=" p-0">
    <section class="resume-section" id="about">
        <div class="resume-section-content">
            <h1 class="mb-0">
               
            </h1>
        </div>
    </section> 
</div>


<main class="wrapper" style="margin:10% auto; width:90%;">
	<div id="layoutSidenav_content">
	    <div class="container-fluid px-7">
	        <div class="body-container" style="width:100%; margin:0% auto; ">
	        	<div class="body-main me-5">
	        	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
					    <!-- <li class="breadcrumb-item active" aria-current="page">Library</li> -->
					  </ol>
					</nav>
					<hr width="22%">
	             	<div class="container text-center mt-5 mb-5">
					  <div class="row me-5" style="background:#lightgrey;">
					    <div class="col">
					    	<h5><i class="bi bi-trophy-fill fa-3x align-middle box-shadow"></i>  
					    	<font style="color:#47a3da; font-weight:bold;">홍길동님</font> 반갑습니다</h5>
					    </div>
					    <div class="col">
					    	<h6 style="color:#828282">적립금</h6>
				  			<h3>1000원</h3>
					    </div>
					    <div class="col">
					    	<h6 style="color:#828282">예약</h6>
				  			<h3>3건</h3>
					    </div>
					    <div class="col">
					     	<h6 style="color:#828282">후기</h6>
						    <h3>1 건</h3>
					    </div>
					  </div>
					</div>
					<hr>
	   
				 	<div style="margin-top:50px;">
						<span style="font-weight: bold;">최근 예약 내역</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="font-size: small; color:#828282">최근 3개월간 주문하신 내역입니다.</span>
						<a href="#" style="float:right; color:#828282">전체예약조회&nbsp;&nbsp;<i class="fas fa-angle-right align-middle;" style="color: #828282"></i></a>
						  	</div>
						<div class="container text-center" style="margin-top:10px;" >
						  
						</div>
						
						<div class="row">
							<div class="col">
								<div class=" p-4 text-center" style="border-bottom: 1px solid #E2E2E2">
									<div class="text-center">
									  <div class="row">
									    <div class="col">
									     	<div class="h1"><i class="bi bi-cart-check"></i></div>
									     	<span style="color: #aaaaaa;">예약접수</span>
									</div>
									<div class="col"><i class="fas fa-angle-right" style="color: #E2E2E2; padding:30px"></i></div>
									<div class="col">
									  <div class="h1"><i class="bi bi-credit-card"></i></div>
									  <span style="color: #aaaaaa;">결제완료</span>
									</div>		
									<div class="col"><i class="fas fa-angle-right" style="color: #E2E2E2; padding:30px"></i></div>
									<div class="col">
									  <div class="h1"><i class="bi bi-box-seam"></i></div>
									  <span style="color: #aaaaaa;">예약 대기중</span>
									</div>
									<div class="col"><i class="fas fa-angle-right" style="color: #E2E2E2; padding:30px"></i></div>
									<div class="col">
									  <div class="h1"><i class="bi bi-airplane"></i></div>
									  <span style="color: #aaaaaa;">예약확정</span>
									</div>
									<div class="col"><i class="fas fa-angle-right" style="color: #E2E2E2; padding:30px"></i></div>
									<div class="col">
									  <div class="h1"><i class="bi bi-gift"></i></div>
									  <span style="color: #aaaaaa;">후기작성</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="text-center" style="margin-top:50px">
				<table class="table table-hover">
				  <thead>
				    <tr class="table-warning">
				      <th scope="col">번호</th>
				      <th scope="col">클래스</th>
				      <th scope="col">강사</th>
				      <th scope="col">주소</th>
				      <th scope="col">예약상태</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr class="table-light">
				      <th scope="row">1</th>
				      <td>나만의 공예</td>
				      <td>홍길동</td>
				      <td>서울특별시</td>
				      <td>후기작성</td>
				    </tr>
				    <tr class="table-light">
				      <th scope="row">2</th>
				      <td>나만의 공예</td>
				      <td>홍길동</td>
				      <td>서울특별시</td>
				      <td>후기작성</td>
				    </tr>
				    <tr class="table-light">
				      <th scope="row">3</th>
				      <td>나만의 공예</td>
				      <td>홍길동</td>
				      <td>서울특별시</td>
				      <td>예약접수</td>
				    </tr>
				  </tbody>
				</table>
				</div>
				
				<div style="margin-top:50px;">
					<span style="font-weight: bold;">MY LIKE ITEMS</span>
					<a href="#" style="float:right; color:#828282">더보기<i class="fas fa-angle-right align-middle; style=color: #828282"></i></a>
				</div>
				  			
				<div class="row" style="margin-top:10px;">
				<div class="col">
					<div class=" p-4 text-center" style="border-top: 3px solid black;">
						</div>
					</div>
				</div>
				
				<div class="text-center" style="margin-top:50px">
					<div class="itembox">
					  <div class="itembox_bar">
					  	<button class="btn btn-light w-100">나만의 공예</button>
					  	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" width="100%">
					  	<button class="btn btn-warning w-100">예약하러가기</button>
					  </div>
					  <div class="itembox_bar">
					  	<button class="btn btn-light w-100">나만의 공예</button>
					  	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" width="100%">
					  	<button class="btn btn-warning w-100">예약하러가기</button>
					  </div>
					  <div class="itembox_bar">
					  	<button class="btn btn-light w-100">나만의 공예</button>
					  	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" width="100%">
					  	<button class="btn btn-warning w-100">예약하러가기</button>
					  </div>
					  <div class="itembox_bar">
					  	<button class="btn btn-light w-100">나만의 공예</button>
					  	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" width="100%">
					  	<button class="btn btn-warning w-100">예약하러가기</button>
					  </div>
					  <div class="itembox_bar">
					  	<button class="btn btn-light w-100">나만의 공예</button>
					  	<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" width="100%">
					  	<button class="btn btn-warning w-100">예약하러가기</button>
					  </div>
					</div>
				</div>

                </div>
            </div>
        </div>
    </div>
</main>