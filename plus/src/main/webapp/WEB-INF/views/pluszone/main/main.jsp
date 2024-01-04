<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

h5{font-size: 1.1em;
	line-height: 1.1428em !important;
	margin: 0 0 15px;
	font-weight: normal;
	font-family: inherit !important
}

.communitybox{
	background: #fff;
	padding: 20px;
	margin-bottom: 30px
}
.communitybox, 
.buy-with-us-box li{
	border-bottom: 1px solid #f5f5f5;
	padding: 10px 0 10px 40px;
	position: relative
}

.communitybox{
	border:none;
}
.communitybox li>i{
	position: absolute;font-size: 1.5em;color: #fdb714;left: -25px;top: 12px
}

.communitybox li>*:last-child{
	margin-bottom: 0
}
ul{
	list-style: none;margin: 0
}

i.fa{
	display: inline-block;
	border-radius: 60px;
	box-shadow: 0px 0px 2px #888;
	padding: 0.5em 0.6em
}
	
</style>



<main class="wrapper" style="margin:0% auto;">
		<div id="layoutSidenav_content">
               
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">
                            <i class="fas fa-tachometer-alt"></i>
                            사업자 페이지
                        </h1>
                        <ul class="breadcrumb mb-4" style="list-style-type: none;">
                            <li class="breadcrumb-item active">
                                <i class="fas fa-table me-1"></i>
                                통계
                            </li>
                        </ul>

                        <div class="row">

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">총 회원 수</h3>
                                        <hr>
                                        <h4 class="text-center">100명</h4>
                                    </div>
                                    
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
		
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">총 플러스 수</h3>
                                        <hr>
                                        <h4 class="text-center">50명</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">개설된 클래스</h3>
                                        <hr>
                                        <h4 class="text-center">${bookingDataCount}개</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">
                                        <a href="${pageContext.request.contextPath}/booking/lessonList">전체보기</a>
                                        <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">공지사항</h3>
                                        <hr>
                                        <h4 class="text-center">${noticeDataCount}개</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">
                                        <a href="${pageContext.request.contextPath}/pluszone/noticePlus/list">전체보기</a> 
                                        <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    오늘의 할일  
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">

                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    플러스 정보
                                    </div>
                                    <div class="card-body" style="width: 100%;">
										<div class="d-flex justify-content-center">
								            <a href="#" class="avatar avatar-xl rounded-circle">
								              <i class="bi bi-person-bounding-box fa-4x"></i>
								            </a>
								          </div> 
								          <div class="text-center my-6" >
								            <!-- Title -->
								            <a href="#" class="d-block h5 mb-0">${loginPlusMember.userName}</a>
								            <!-- Subtitle -->
								            <span class="d-block text-sm text-muted">${loginPlusMember.email}</span>
								          </div>
								          <!-- Stats -->
								          <div class="d-flex">
								            <div class="col-4 text-center">
								              <a href="#" class="h4 font-bolder mb-0">${bookingDataCount}</a>
								              <span class="d-block text-sm">개설된 클래스</span>
								            </div>
								            <div class="col-4 text-center">
								              <a href="#" class="h4 font-bolder mb-0">350</a>
								              <span class="d-block text-sm">총 예약자</span>
								            </div>
								            <div class="col-4 text-center">
								              <a href="#" class="h4 font-bolder mb-0">15,000,000</a>
								              <span class="d-block text-sm">매출총액</span>
								            </div>
								          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    원데이 클래스 관리 
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">

                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    접속자 수 현황
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">
										
                                    </div>
                                </div>
                            </div>
                        </div>
                        
						
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    원데이 클래스 관리 
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">

                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    공지사항 <a href="#" style="float:right; text-decoration:underline">더보기</a>
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">
										<div class="communitybox buy-with-us-box">
									
											<c:forEach var="dto" items="${noticeList}">
												<ul>
									                <li> 
									                	<i class="fa fa-user circle"></i>
									                    <h5 class="title">
									                    	<a href="${pageContext.request.contextPath}/pluszone/noticePlus/article?page=1&num=${dto.num}">${dto.subject}</a> 
														</h5>
									                    <p>${dto.content} <font style="float:right;">${dto.regDate}</font> </p>
									                </li>
									            </ul> 
											</c:forEach>
								            
								        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                  </div>
      		</div>
      </main>