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
.reviewBox{
	width: 30%;
	height: 230px;
	border: 1px solid black;
	border-radius: 5px;
	margin-top: 1%;
	margin-right: 2%;
	float: left;
	text-align: center;
}
img{
	min-height: 100%; 
	max-width: 100%; 
}
.imgHoverEvent{
	width: 30%;
	margin: 5px; 
	position: relative; 
	overflow: hidden; 
	display: inline-block;
}
.imgHoverEvent .imgBox{
	height: 230px; 
	text-align: center; 
	background: black; 
	background-size: auto 100%;
}
.imgHoverEvent .hoverBox{
	position: absolute; 
	top:0; 
	left: 0; 
	min-width: 100%;
	min-height: 230px; 
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
.scheduleSize{
	width: 65%;
	height: 70%;
	border: 1px solid #D5D5D5;
	border-radius: 15px;
	background-color: #EAEAEA;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1);
	position: absolute;
	top: 20%;
	left: 32%;
	
}
.classListSize{
	width: 90%;
	height: 40%;
	border: 1px solid #FFF3CD;
	border-radius: 15px;
	margin-left: 5%;
	margin-top: 8%;
	background-color: #FFF3CD;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1);
	color: #4C4C4C;
}
.col-xl-3{
	width: 24.62%;
}
.plusBox{
	min-width: 30%;
	min-height: 230px;
	border-radius: 5px;
	margin-right: 2%;
	float: left;
	text-align: center;
}
.plusBoxDetail{
	font-size: 18px;
	font-weight: 600;
}
.plusBoxDetail2{
	font-size: 30px;
	font-weight: bold;
}
.monthYear{
	font-size: 25px;
	margin-top: 2%;
	margin-left: 7%;
}
.day{
	font-size: 110px;
	font-weight: 900;
	vertical-align: top;
	position: absolute;
	top: 38%;
	left: 6%;
}
</style>

<div id="layoutSidenav_content">
	<div class="container-fluid px-4">
	    <div class="row mt-3">
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
	
	    <div class="row">
	    	<div class="col-xl-6">
	            <div class="card mb-4">
	                <div class="card-header">
	                    <i class="fas fa-chart-bar me-1"></i>
	                클래스 신고 관리 <a href="${pageContext.request.contextPath}/admin/declarationManage/list" class="memberall">전체보기<i class="fas fa-angle-right"></i></a>
	                </div>
	                <div class="card-body" style="width: 100%; height: 300px;">
	                	<div style="font-size: 20px; font-weight: bold;">오늘 신고목록</div>
	                	<div style="color: #A6A6A6; font-size: 15px;"> (최근 목록 3개만 보여집니다.)</div>
							<div class="monthYear">${year}-${month}</div>
							<div class="day">${day}</div>
					<c:if test="${not empty declarationList}">
						<div class="scheduleSize">
							<c:forEach var="declarationDto" items="${declarationList}" varStatus="status" begin="${status.index}" end="${status.index +2}">
								<div>
									<div style="font-size: 20px; font-weight: bold; margin-left: 10px; margin-top: 17px;">${declarationDto.className}</div>
									<div style="margin-left: 25px;"> : ${declarationDto.rContent}</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${empty declarationList}">
						<div class="scheduleSize">
							<div style="font-size: 18px; text-align: center; margin-top: 90px;">
								오늘의 신고 목록은 없습니다.<br>
								<a href="${pageContext.request.contextPath}/admin/declarationManage/list">전체보기</a>를 눌러 자세한 신고 목록을 확인하세요!
							</div>
						</div>
					</c:if>
                    </div>
                </div>
            </div>
            
	        <div class="col-xl-6">
	            <div class="card mb-4">
	                <div class="card-header">
	                    <i class="fas fa-chart-bar me-1"></i>
	                	플러스 관리 <a href="${pageContext.request.contextPath}/admin/plusManage/plusList" class="memberall">전체보기<i class="fas fa-angle-right"></i></a>
	                </div>
	                <div class="card-body" style="width: 100%; height: 300px;">
	                	<div class="plusBox" style="margin-left: 20px;">
	                		<i class="bi bi-person-fill-x fa-7x"></i>
	                		<div class="plusBoxDetail"> 미승인 플러스 수</div>
	                			<div class="plusBoxDetail2"><span style="color: blue;">${noAppPlusCount}</span>명</div>
	                	</div>
	                	<div class="plusBox">
	                		<i class="bi bi-person-fill fa-7x"></i>
	                		<div class="plusBoxDetail">요청한 플러스 수</div>
	                			<div class="plusBoxDetail2"><span style="color: blue;">${requestPlusCount}</span>명</div>
	                	</div>
	                	<div class="plusBox">
	                		<i class="bi bi-person-fill-check fa-7x"></i>
	                		<div class="plusBoxDetail">승인된 플러스 수</div>
	                			<div class="plusBoxDetail2"><span style="color: blue;">${appPlusCount}</span>명</div>
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
	                 	클래스 관리
	                 	<a href="${pageContext.request.contextPath}/admin/lessonManage/list0" class="memberall">전체보기<i class="fas fa-angle-right"></i></a>
	                 </div>
	                 <div class="card-body" style="width: 100%; height: 300px;">
	                 <div style="font-size: 20px; font-weight: bold; margin-bottom: 5px;">승인대기 클래스 목록</div>
						<table class="table table-bordered table-hover text-center">
		                    <c:if test="${not empty list0}">
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
		                    </c:if>
	                        <c:if test="${empty list0}">
	                        	<div class="classListSize">
									<div style="font-size: 18px; text-align: center; margin-top: 40px; font-weight: 600;">
										승인 대기 중인 클래스가 존재하지 않습니다!
									</div>
								</div>
	                        </c:if>
                		</table>
	                </div>
	            </div>
	        </div>
	
	        <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                    리뷰 관리<a href="${pageContext.request.contextPath}/admin/reviewManage/all/list" class="memberall">전체보기<i class="fas fa-angle-right"></i></a>
                    </div>
                    <div class="card-body" style="width: 100%; height: 300px;">
						<div style="font-size: 20px; margin-left: 5px;">
						<span style="font-weight: bolder;">최근 리뷰 목록</span>
						<span style="color: #A6A6A6; font-size: 15px;"> (최근 목록 3개만 보여집니다.)</span>
						</div>
						
						<c:if test="${not empty reviewManageList}">
						<div style="margin-left: 5%;">
							<c:forEach var="reviewDto" items="${reviewManageList}" varStatus="status" begin="${status.index}" end="${status.index+2}">
								<div class="col imgHoverEvent event5 reviewBox">
									<c:if test="${empty reviewDto.filename}">
										<div class="imgBox">
											<img src="${pageContext.request.contextPath}/resources/images/Image-folder.jpg" alt="">
										</div>
									</c:if>
									<c:if test="${not empty reviewDto.filename}">
										<div class="imgBox">
								         	<img src="${pageContext.request.contextPath}/uploads/review/${reviewDto.filename}" alt="">
							        	</div>
							        </c:if>
							        <div class="hoverBox">
							        	<span>
							            <p class="p1">${reviewDto.reviewSubject}</p>
							            <p class="p1" style="float:right"><i class="bi bi-star-fill star my-0"></i>${reviewDto.reviewScore}/5점</p>
							            <br><div class="p1 bor mt-3 p-0" style="color: white; width: 100%"></div>
							            <p class="p2">${reviewDto.reviewContent}</p>
							            </span>
							       </div>
								</div>
							</c:forEach>
						</div>
						</c:if>
						<c:if test="${empty reviewManageList}">
							<div style="font-size: 20px; text-align: center; margin-top: 90px;">
								<div style="margin-bottom: 5px; text-decoration: underline;">
									작성된 리뷰 목록이 존재하지 않습니다.<span>🙂</span>
								</div>
							</div>
						</c:if>
					</div>
                 </div>
             </div>
        </div>
	<div class="row">
		<div class="col-xl-2">
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
     </div>
  </div>
</div>
