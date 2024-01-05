<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>

<style>
.totaltitle{
	text-decoration:none;
	color:#fff;
}
.memberall{
	float:right;
	text-decoration:none;
	color:black;
}
</style>

<div id="layoutSidenav_content">
	<div class="container-fluid px-4">
	    <div class="row mt-5">
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body">
	                    <h3 class="text-center">총 회원 수</h3>
	                    <hr>
	                    <h4 class="text-center">${memberDataCount}명</h4>
	                </div>
	                
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    	<a href="${pageContext.request.contextPath}/admin/memberManage/list" class="totaltitle">전체보기</a>
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body">
	                    <h3 class="text-center">총 사업자 수</h3>
	                    <hr>
	                    <h4 class="text-center">${plusDataCount}명</h4>
	                </div>
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    <a href="${pageContext.request.contextPath}/admin/plusManage/plusList" class="totaltitle">전체보기</a>
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body">
	                    <h3 class="text-center">개설된 클래스</h3>
	                    <hr>
	                    <h4 class="text-center">${lessonDataCount}개</h4>
	                </div>
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    <a href="${pageContext.request.contextPath}/admin/lessonManage/list1" class="totaltitle">전체보기</a> 
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
	                    <a href="${pageContext.request.contextPath}/admin/noticeManage/list" class="totaltitle">전체보기</a> 
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body tabs">
	                    <h3 class="text-center" id="tab-progress" data-category="progress">진행중인 이벤트</h3>
	                    <hr>
	                    <h4 class="text-center">${eventDataCount}개</h4>
	                </div>
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    <a href="${pageContext.request.contextPath}/admin/eventManage/progress/list" class="totaltitle">전체보기</a> 
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body">
	                    <h3 class="text-center">리뷰 게시글</h3>
	                    <hr>
	                    <h4 class="text-center">150개</h4>
	                </div>
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    전체보기 
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body">
	                    <h3 class="text-center">커뮤니티 게시글</h3>
	                    <hr>
	                    <h4 class="text-center">${communityDataCount}개</h4>
	                </div>
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    <a href="${pageContext.request.contextPath}/admin/communityManage/list" class="totaltitle">전체보기</a>
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-3 col-md-6">
	            <div class="card bg-success text-white mb-4">
	                <div class="card-body">
	                    <h3 class="text-center">총 신고건수</h3>
	                    <hr>
	                    <h4 class="text-center">${declarationDataCount}명</h4>
	                </div>
	                <div class="card-footer d-flex align-items-center justify-content-between text-end">
	                    <div class="small text-white">
	                    <a href="${pageContext.request.contextPath}/admin/declarationManage/list" class="totaltitle">전체보기</a>
	                    <i class="fas fa-angle-right"></i></div>
	                </div>
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
	                <div class="card-body" style="width: 100%; height: 300px;">
	
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-6">
	            <div class="card mb-4">
	                <div class="card-header">
	                    <i class="fas fa-chart-bar me-1"></i>
	                	관리자 정보
	                </div>
	                <div class="card-body" style="width: 100%; height: 300px;">
						<div class="d-flex justify-content-center">
	          				<div class="avatar avatar-xl rounded-circle">
	            				<i class="bi bi-person-bounding-box fa-4x"></i>
	          				</div>
	         			</div>
	         			<div class="text-center my-6">
	         				<span class="d-block h5 mb-0">${sessionScope.member.userName}</span>
							<span class="d-block text-sm text-muted">${sessionScope.member.email}</span>
						</div>
						<div class="d-flex">
							<div class="col-4 text-center">
								<a href="${pageContext.request.contextPath}/admin/lessonManage/list1" class="h4 font-bolder mb-0">${lessonDataCount}</a>
								<span class="d-block text-sm">전체 클래스</span>
							</div>
							<div class="col-4 text-center">
							   <a href="#" class="h4 font-bolder mb-0">350</a>
							   <span class="d-block text-sm">총 회원</span>
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
	                 	승인대기 클래스 관리
	                 	<a href="${pageContext.request.contextPath}/admin/lessonManage/list0" class="memberall">전체보기<i class="fas fa-angle-right"></i></a>
	                 </div>
	                 <div class="card-body" style="width: 100%; height: 300px;">
						<table class="table table-bordered table-hover text-center">
		                    <thead>
		                        <tr class="table-warning">
		                            <th>클래스 이름</th>
		                            <th>등록 일자</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                     	<c:forEach var="vo" items="${list0}">
			                        <tr>
			                            <td>${vo.className}</td>
			                            <td>${vo.startDate}</td>
			                        </tr>
		                        </c:forEach>
		                    </tbody>
                		</table>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-6">
	            <div class="card mb-4">
	                <div class="card-header">
	                    <i class="fas fa-chart-bar me-1"></i>
	                <label class="charts-dayOfWeek-title">접속자 수 현황</label>
	                </div>
	                <div class="card-body charts-dayOfWeek border rounded" style="width: 100%; height: 300px;">
						
                    </div>
                </div>
            </div>
        </div>
	        
	
	        <div class="card mb-4">
	            <div class="card-header">
	                <i class="fas fa-table me-1"></i>
	                회원 관리
                	<a href="${pageContext.request.contextPath}/admin/memberManage/list" class="memberall">전체보기<i class="fas fa-angle-right"></i></a>
	            </div>
	            <div class="card-body">
	                <div class="table-responsive">
	                    <table class="table table-bordered table-hover text-center">
	                        <thead>
	                            <tr class="table-warning">
	                            	<th>아이디</th>
	                                <th>이름</th>
	                                <th>생년월일</th>
	                                <th>전화번호</th>
	                                <th>회원구분</th>
	                                <th>이메일</th>
	                            </tr>
	                        </thead>
	
	                        <tbody>
	                        <c:forEach var="dto" items="${list}">
								<tr> 
									<td>${dto.userId}</td>
									<td>${dto.userName}</td>
									<td>${dto.birth}</td>
									<td>${dto.tel}</td>
									<td>${dto.membership==1?"일반회원":(dto.membership==51?"플러스":"미승인플러스")}</td>
									<td>${dto.email}</td>
								</tr>
							</c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</div>
</div>