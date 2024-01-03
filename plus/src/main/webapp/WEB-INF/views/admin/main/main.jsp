<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>

<script type="text/javascript">
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
                                        <h4 class="text-center">${memberDataCount}명</h4>
                                    </div>
                                    
                                    <div class="card-footer d-flex align-items-center justify-content-between text-end">
                                        <div class="small text-white">
                                        	<a href="${pageContext.request.contextPath}/admin/memberManage/list">전체보기</a>
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
                                        <a href="${pageContext.request.contextPath}/admin/plusManage/plusList">전체보기</a>
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
                                        <a href="${pageContext.request.contextPath}/admin/lessonManage/list1">전체보기</a> 
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
                                        <a href="${pageContext.request.contextPath}/admin/noticeManage/list">전체보기</a> 
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
                                        <a href="${pageContext.request.contextPath}/admin/eventManage/progress/list">전체보기</a> 
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
                                        <a href="${pageContext.request.contextPath}/admin/communityManage/list">전체보기</a>
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
                                        <a href="${pageContext.request.contextPath}/admin/declarationManage/list">전체보기</a>
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