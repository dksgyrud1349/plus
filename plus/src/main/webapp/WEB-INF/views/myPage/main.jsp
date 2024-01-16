<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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

<script type="text/javascript">
$(function() {
    $(".product-item").click(function() {
      let classNum = $(this).attr("data-productNum");
      let url = "${pageContext.request.contextPath}/lesson/detail/" + classNum;
      location.href = url;
    });
  });
</script>

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
					    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/myPage/main">마이페이지</a></li>
					    <!-- <li class="breadcrumb-item active" aria-current="page">Library</li> -->
					  </ol>
					</nav>
					<hr width="22%">
	             	<div class="container text-center mt-5 mb-5">
					  <div class="row me-5" style="background:#lightgrey;">
					    <div class="col-4">
					    	<h5><i class="bi bi-trophy-fill fa-3x align-middle box-shadow"></i>  
					    	<font style="color:#47a3da; font-weight:bold;">${sessionScope.member.userName}님</font> 반갑습니다</h5>
					    </div>
					    <div class="col">
					    	<h6 style="color:#828282">적립금</h6>
				  			<h3><fmt:formatNumber value="${mileage}" pattern="#,###원" /></h3>
					    </div>
					    <div class="col">
					    	<h6 style="color:#828282">예약</h6>
				  			<h3>${bookCount} 건</h3>
					    </div>
					    <div class="col">
					     	<h6 style="color:#828282">리뷰</h6>
						    <h3>${reviewCount} 건</h3>
					    </div>
					  </div>
					</div>
					<hr>
	   
				 	<div style="margin-top:50px;">
						<span style="font-weight: bold;">최근 예약 내역</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="font-size: small; color:#828282">최근 주문하신 3개 내역입니다.</span>
						<a href="${pageContext.request.contextPath}/myPage/booking/list" style="float:right; color:#828282">전체예약조회&nbsp;&nbsp;<i class="fas fa-angle-right align-middle;" style="color: #828282"></i></a>
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
				      <th scope="col" style="padding-left: 20px;">번호</th>
				      <th scope="col">클래스</th>
				      <th scope="col">강사</th>
				      <th scope="col">주소</th>
				      <th scope="col">예약상태</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach var="dto" items="${rtnList}" varStatus="status" begin="${status.index}" end="${status.index+2}">
						<tr>
							<th style="padding-left: 30px;">${dto.rnum}</th>
							<td>${dto.className}</td>
							<td>${dto.puserName}</td>
							<td>${dto.addr1}, ${dto.addr2}</td>
							<td style="padding-left: 10px;">${dto.mode}</td>
							<input type="hidden" name="orderNum" id="orderNum" value="${dto.orderNum}">
						</tr>
					</c:forEach>
				  </tbody>
				</table>
				</div>
				
				<div style="margin-top:50px;">
					<span style="font-weight: bold;">MY LIKE ITEMS</span>
					<a href="${pageContext.request.contextPath}/myPage/wishList/mylist" style="float:right; color:#828282">더보기<i class="fas fa-angle-right align-middle; style=color: #828282"></i></a>
				</div>
				  			
				<div class="row" style="margin-top:10px;">
				<div class="col">
					<div class=" p-4 text-center" style="border-top: 3px solid black;">
						</div>
					</div>
				</div>
				
				<div class="text-center" style="margin-top:50px">
					<div class="itembox">
						<c:forEach var="dto" items="${wishList}" varStatus="status" begin="${status.index}" end="${status.index+4}">
					  		<div class="itembox_bar">
					  			<button class="btn btn-light w-100" style="height:80px;">${dto.className}</button>
					  			<img src="${pageContext.request.contextPath}/uploads/lesson/${dto.firstPhoto}" width="100%;" height="100%;">
					  			<button class="btn btn-warning w-100 product-item" data-productNum="${dto.classNum}">예약하러가기</button>
					  		</div>
					  	</c:forEach>
					</div>
				</div>

                </div>
            </div>
        </div>
    </div>
</main>