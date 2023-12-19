<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>

<script type="text/javascript">
$(function(){
	let url = "${pageContext.request.contextPath}/adminChart";
	
	$.getJSON(url, function(data) {
		chartsDayOfWeek(data);
	});	
		
	function chartsDayOfWeek(data) {
		let chartData = [];
		
		let m = new Date().getMonth() + 1;
		let m2 = parseInt(data.dayOfWeek.month.substring(4));
	      
	      let title = (m !== 1 && m > m2) || (m === 1 && m2 === 12) ? 
	               "전월 요일별 판매건수" : "접속자 수 현황";
	      
	      document.querySelector('.charts-dayOfWeek-title').innerHTML = title;
	      
	         chartData.push(data.dayOfWeek.SUN);
	         chartData.push(data.dayOfWeek.MON);
	         chartData.push(data.dayOfWeek.TUE);
	         chartData.push(data.dayOfWeek.WED);
	         chartData.push(data.dayOfWeek.THU);
	         chartData.push(data.dayOfWeek.FRI);
	         chartData.push(data.dayOfWeek.SAT);
	      
	      var chartDom = document.querySelector('.charts-dayOfWeek');
	      var myChart = echarts.init(chartDom);
	      var option;
			
	    
	      option = {
	  	        tooltip : {
	  	           trigger: 'item'
	  	        },
	  	        xAxis: {
	  	          type: 'category',
	  	          data: ['일', '월', '화', '수', '목', '금', '토']
	  	        },
	  	        yAxis: {
	  	          type: 'value'
	  	        },
	  	        series: [
	  	          {
	  	            data: chartData,
	  	            type: 'bar'
	  	      }
	  	    ]
	      };

	      option && myChart.setOption(option);
	      
	}
});
</script>

		<div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">
                            <i class="fas fa-tachometer-alt"></i>
                            관리자 페이지
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
                                        <h3 class="text-center">총 사업자 수</h3>
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
                                        <h4 class="text-center">1000개</h4>
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
                                        <h4 class="text-center">10개</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">진행중인 이벤트</h3>
                                        <hr>
                                        <h4 class="text-center">20개</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
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
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">커뮤니티 게시글</h3>
                                        <hr>
                                        <h4 class="text-center">300개</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">
                                        <h3 class="text-center">현재 접속자 수</h3>
                                        <hr>
                                        <h4 class="text-center">5명</h4>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">전체보기 <i class="fas fa-angle-right"></i></div>
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
                                    <div class="card-body" style="width: 100%; height: 250px;">
										
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                    관리자 정보
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
                                    <label class="charts-dayOfWeek-title">접속자 수 현황</label>
                                    </div>
                                    <div class="card-body charts-dayOfWeek border rounded" style="width: 100%; height: 250px;">
											
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 관리
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>이름</th>
                                                <th>이메일</th>
                                                <th>주소</th>
                                                <th>나이</th>
                                                <th>가입날짜</th>
                                                <th>총 구매</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                        <tr>
                                            <td>홍길동</td>
                                            <td>1234@</td>
                                            <td>서울</td>
                                            <td>27</td>
                                            <td>2011/01/25</td>
                                            <td>112,000</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
