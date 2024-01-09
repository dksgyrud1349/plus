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
.totaltitle{
	text-decoration:none;
	color:#fff;
}
</style>



<main class="wrapper" style="margin:0% auto;">
		<div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <div class="row mt-5">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">개설된 클래스</h3>
                                        <hr>
                                        <h4 class="text-center">${bookingDataCount}개</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">
                                        	<a href="${pageContext.request.contextPath}/pluszone/booking/lessonList" class="totaltitle">
                                        		전체보기
                                        	</a>
                                        <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">남은 개설 수업</h3>
                                        <hr>
                                        <h4 class="text-center">15건 </h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-3 col-md-6 ">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">문의사항</h3>
                                        <hr>
                                        <h4 class="text-center">5개</h4>
                                    </div>
                                    
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
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
                                        	<a href="${pageContext.request.contextPath}/pluszone/noticePlus/list" class="totaltitle">
                                        		전체보기
                                        	</a> 
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
                                    <div class="card-body" style="width: 100%; height: 250px;">
										<div class="d-flex ms-5 ps-4" style="margin-right: 30px;">
								            <div class="avatar avatar-xl rounded-circle">
								              <i class="bi bi-github fa-4x"></i>
								            </div>
								            <div class="d-block h4 mt-4 mb-4 ms-4">
								            안녕하세요<span class="ms-5 ps-4" style="float: right;"><i class="bi bi-cash-coin"></i>나만의 수익을 창출해보세요!</span>
								            <div>${sessionScope.member.userName}님<span>🤗</span><span class="ms-5 ps-4" style="text-decoration-line: underline; float: right"><a href="${pageContext.request.contextPath}/pluszone/lessonPlus/main" >자세히 알아보기</a></span></div>
								        </div>
								     </div> 
								     <div class="col-12" >
								     <span class="d-block h5 ms-5 ps-4 mb-3"><button type="button" class="btn border" onclick="location.href='${pageContext.request.contextPath}/pluszone/member/pwd';" style="width: 200px">기본정보수정</button>
								        <span class="me-5 fs-5 pe-3 mt-2" style="float: right">⊙ 개설된 클래스
								            <a href="${pageContext.request.contextPath}/pluszone/booking/lessonList" class="h4 font-bolder mb-0">${bookingDataCount}개</a>
								        </span>
								     </span>
								        <span class="d-block h5 ms-5 my-3 fw-bold">
											<button type="button" class="btn border" onclick="location.href='${pageContext.request.contextPath}/pluszone/infoDetail/write';" style="width: 200px;">세부정보수정</button>
								            <span class="d-block me-5 fs-5 pe-3" style="float: right">⊙ 이번달 판매건수
								            	<a href="${pageContext.request.contextPath}/pluszone/salesStatus/main" class="h4 font-bolder mb-0">${thisMonth.COUNT}건</a>
								            </span>
								        </span>
							          	<span class="d-block h5 ms-5 my-3">
							          		<span class="d-block me-5 fs-5 pe-3"  style="float: right">⊙ 이번달 매출총액
							          			<a href="${pageContext.request.contextPath}/pluszone/salesStatus/main" class="h4 font-bolder mb-0">${thisMonth.TOTAL}원</a>
							          		</span>
							          	</span>
							          	
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