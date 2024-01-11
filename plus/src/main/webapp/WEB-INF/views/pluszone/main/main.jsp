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
.infoWelcome{
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 10px;
	text-align: center;

}
.btnStyle{
	background-color: #EAEAEA;
	font-weight: bold;
	border: 1px solid #BCBCBC;
}
.btnStyle:hover{
	background-color: #D5D5D5;
}
.imgStyle{
	width: 30%;
	height: 220px;
	margin-right: 2%;
	border: 1px solid gray;
	
}
.dateYMonth{
	float: left;
	margin-left: 2%;
	margin-top: 5%;
}
.scheduleSize{
	width: 70%;
	height: 93%;
	border: 1px solid #D5D5D5;
	border-radius: 15px;
	margin-left: 27%;
	margin-top: 1%;
	background-color: #EAEAEA;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1);
}
.col-xl-6{
	height: 300px;
}
.canvas{
	width: 100%;
	height: 100%;
}
.col-xl-3{
	width: 24.62%;
}
.reviewSize{
	width: 90%;
	height: 40%;
	border: 1px solid #FFF3CD;
	border-radius: 15px;
	margin-left: 5%;
	margin-top: 5%;
	background-color: #FFF3CD;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.05), 0 6px 6px rgba(0, 0, 0, 0.1);
	color: #4C4C4C;
}
 
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
    let url = "${pageContext.request.contextPath}/charts";

    $.getJSON(url, function(data){
        chartsDay(data);
    });

    function chartsDay(data) {
        let chartData = [];

        for(let item of data.days) {
            let s = parseInt(item.ODATE.substring(5, 7))+'월 ';
            s += parseInt(item.ODATE.substring(8))+'일';

            let obj = {value:item.TOTALMONEY, name:s};
            chartData.push(obj);
        }

        const chartDom = document.querySelector(".charts-day");
        let myChart = echarts.init(chartDom);
        let option;

        option = {
          tooltip: {
            trigger: 'item'
          },
          legend: {
            top: '5%',
            left: 'center'
          },
          series: [
            {
              name: '일별 판매현황',
              type: 'pie',
              radius: ['40%', '70%'],
              avoidLabelOverlap: false,
              itemStyle: {
                borderRadius: 10,
                borderColor: '#fff',
                borderWidth: 2
              },
              label: {
                show: false,
                position: 'center'
              },
              emphasis: {
                label: {
                  show: true,
                  fontSize: '40',
                  fontWeight: 'bold'
                }
              },
              labelLine: {
                show: false
              },
              data: chartData
            }
          ]
        };

        option && myChart.setOption(option);
    }
});
</script>

<main class="wrapper" style="margin:0% auto;">
		<div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <div class="row mt-3">
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
                                        <h3 class="text-center">미승인 클래스</h3>
                                        <hr>
                                        <h4 class="text-center">${lessonPlusCount}건 </h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">
                                        <a href="${pageContext.request.contextPath}/pluszone/lessonPlus/main" class="totaltitle">
                                        	전체보기 
                                        </a>
                                       <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-xl-3 col-md-6 ">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">문의사항</h3>
                                        <hr>
                                        <h4 class="text-center">${plusInqDataCount}개</h4>
                                    </div>
                                    
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">
                                        <a href="${pageContext.request.contextPath}/pluszone/plusInq/inqList" class="totaltitle">
                                        	전체보기
                                        </a>
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
                                    오늘의 할일 <a href="${pageContext.request.contextPath}/pluszone/schedule/main" style="float:right; text-decoration:underline">자세히 보기 <span style="font-weight:bolder;">></span></a>
                                    </div>
                                    <div class="card-body" style="width: 100%;  height: 250px;">
										<div class="dateYMonth">
											<div style="width: 100%; margin-left: 30%; font-size: 25px;">${year}-${month}</div>
											<div style="font-size: 600%; font-weight: 900; width: 100%; position: absolute; top: 34%; left: 6%;">${day}</div>
										</div>
                                    <c:if test="${not empty scheduleList}">
										<div class="scheduleSize">
											<c:forEach var="scheduleDto" items="${scheduleList}" varStatus="status" begin="${status.index}" end="${status.index +2}">
												<div>
													<div style="font-size: 20px; font-weight: bold; margin-left: 10px; margin-top: 10px;">◎ ${scheduleDto.title}</div>
													<div style="margin-left: 25px;"> : ${scheduleDto.sContent}</div>
												</div>
											</c:forEach>
										</div>
									</c:if>
									<c:if test="${empty scheduleList}">
										<div class="scheduleSize">
											<div style="font-size: 18px; text-align: center; margin-top: 70px;">
												오늘의 일정이 비어있습니다.<br>
												오늘의 할일을 정해보세요!
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
                                        	플러스 정보
                                    </div>
                                    
                                    <div class="card-body" style="width: 100%;  height: 250px;">
                                    <c:if test="${not empty infoDto}">
	                                    <div style="margin-left: 30px;">
	                                    	<div class="imageFile"></div>
	                                    	<c:if test="${empty infoDto.photo}">
												<img src ="${pageContext.request.contextPath}/resources/images/person_photo.png" class="imgStyle" style=" float: left;">
											</c:if>
											<c:if test="${not empty infoDto.photo}">
												<img src="${pageContext.request.contextPath}/uploads/infoDetail/${infoDto.photo}" class="card-img-top imgStyle" style=" float: left;">
											</c:if>
	                                    </div>
                                    	<div class="infoWelcome">
                                    		안녕하세요!<span> ${infoDto.nickName}님</span><span>🤗</span>
                                    	</div>
		                                <div style="margin-bottom: 10px;">
			                                    <button type="button" class="btn btnStyle" style="margin-left: 4.2%; width: 25.5%;"
			                                    	onclick="location.href='${pageContext.request.contextPath}/pluszone/member/pwd';">기본정보수정</button>
			                                <span style="">
			                                    <button type="button" class="btn btnStyle" style="width: 25.5%; margin-right: 4%; float: right;"
			                                    	onclick="location.href='${pageContext.request.contextPath}/pluszone/infoDetail/write';">세부정보수정</button>
			                                </span>
		                                </div>
		                                <div><span style="font-size: 15px; font-weight: 200; margin-left: 32px; font-weight: bold;">플러스 소개</span>
		                                	<div style="width: 57%; border: 1px solid black; border-radius: 3px; margin-left: 39%;">
		                                		<span style="margin-left: 5px;">${infoDto.content}</span>
		                                	</div>
                                     	</div>
                                     </c:if>
                                     <c:if test="${empty infoDto}">
                                     <div class="card-body" style="width: 100%; height: 168px; text-align: center; margin-top: 50px;">
                                     	<div>플러스 세부정보를 추가해주세요!</div>
                                     	<div>
			                                <button type="button" class="btn btnStyle"
			                                    onclick="location.href='${pageContext.request.contextPath}/pluszone/infoDetail/write';" style="width: 200px; margin-top: 10px;">세부정보추가</button>
			                            </div>
			                         </div>
                                     </c:if>
                                </div>
                            </div>
                        </div>
                     </div>
		
						<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    공지사항 <a href="${pageContext.request.contextPath}/pluszone/noticePlus/list" style="float:right; text-decoration:underline">자세히 보기 <span style="font-weight:bolder;">></span></a>
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">
                                    <c:if test="${not empty noticeList}">
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
								        </c:if>
								        <c:if test="${empty noticeList}">
								        	<div style="font-size: 20px; text-align: center; margin-top: 75px;">
								        		<div style="margin-bottom: 5px; text-decoration: underline;">공지하신 게시글이 없습니다!</div>
								        		공지사항 목록에서 게시글을 올려주세요<span>😊</span>
								        	</div>
								        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6" style="float: right;">
                                <div class="card mb-4" >
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    매출 현황<a href="${pageContext.request.contextPath}/pluszone/salesStatus/main" style="float:right; text-decoration:underline">자세히 보기 <span style="font-weight:bolder;">></span></a>
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 550px;">
                                    	<div style="font-size: 20px; font-weight: 800; margin-bottom: 10px;">최근 1주일 매출 현황</div>
                                    		<div class="charts-day border rounded" style="height: 480px;"></div>
                                    </div>
                                </div>
                        	</div>
                         </div>
                        

					 	 <div class="row" style="float: left;">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    리뷰 관리 <a href="${pageContext.request.contextPath}/pluszone/review/list" style="float:right; text-decoration:underline">자세히 보기 <span style="font-weight:bolder;">></span></a>
                                    </div>
                                    <div class="card-body" style="width: 100%; height: 250px;">
                                    	<div style="margin-left: 10px; margin-top: 8px;">
											<div style="font-size: 20px; font-weight: 800;">총 리뷰 개수 : <span style="color: blue; font-weight: bold;">${reviewDataCount}</span>개</div>
											<span style="color: gray;">최대 리뷰 3개만 보여집니다.</span>
                                    	</div>
                                    <c:if test="${not empty reviewList}">
	                                    <div style="margin-left: 10px; margin-top: 10px;">
											<table style="border-top: 1px solid gray;">
												<tr style="background-color: #FFF3CD;">
													<th width="70">번호</th>
													<th width="250">클래스명</th>
													<th width="220">제목</th>
													<th width="90">별점</th>
													<th width="100">날짜</th>
												</tr>
												<c:forEach var="reviewDto" items="${reviewList}" varStatus="status" begin="${status.index}" end="${status.index+2}">
													<tr style="border-bottom: 1px solid gray;">
														<td>${status.count}</td>
														<td>${reviewDto.className}</td>
														<td>${reviewDto.reviewSubject}</td>
														<td>${reviewDto.reviewScore}/5점</td>
														<td>${reviewDto.reviewDate}</td>
													</tr>									
												</c:forEach>
											</table>
										  </div>
									  </c:if>
									  <c:if test="${empty reviewList}">
									  	<div class="reviewSize">
											<div style="font-size: 18px; text-align: center; margin-top: 33px;">
												리뷰가 존재하지 않습니다.
											</div>
										</div>
									  </c:if>                                	
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                  </div>
      		  </div>
      		</main>