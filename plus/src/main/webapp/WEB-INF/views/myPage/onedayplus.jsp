<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<style type="text/css">

#box {
  border-radius: 8px;
  transition: all 0.3s cubic-bezier(0.42, 0.0, 0.58, 1.0);
}
#box:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
  transform: translateY(10px);
}

.recobtn {
	border-radius: 10px;
	background-color: #1CA7EC;
	font-weight: 700;
	color : #FFFFFF;
}

.recobtn:hover {
	background-color: #47a3da;
	color : #FFFFFF;
}
.shadow-box {
    border-radius: 25px;
    padding: 2.0em;
    box-shadow: 0 20px 50px -25px rgba(0, 0, 0, 0.7);
    background-color: #cee5f6;
   	color:black;
   	font-weight:bold;
}

</style>

<main class="wrapper" style="margin: 5 auto; width: 100%; margin-bottom: 0; padding-bottom: 30;">
	<div id="layoutSidenav_content" style="background: #FFFFFF;">
		<div class="container-fluid px-7">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:7%">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="mb-3" style="border-bottom:2px solid #32B0E4;">
							<h5 class="pb-2 fw-bold fs-2">
								<i class="bi bi-book me-2"></i> ${sessionScope.member.userName}님의 원데이플러스 결과
							</h5>
						</div>	
						
						<c:choose>
							<c:when test="${answerCount != 0}">
								<c:forEach var="dto" items="${qlist}">
						    		<div class="container-fluid mb-2 shadow-box" style="border:2px solid #ecf6fb; border-radius:30px; width:50%;">
									    <div class="row justify-content-center">
									        <div class="col p-3 mx-4">
									            <div class="row border-bottom border-2" style="color:black;">
									                <span class="fw-semibold fs-5"><i class="bi bi-pencil-square me-2"></i>${status.count} ${dto.subject}</span>								   
									            </div>
									        </div>
									    </div>
									    <c:forEach var="vo" items="${list}">
									        <c:if test="${dto.num == vo.num}">
									            <div class="row justify-content-center">
									                <div class="col p-3">
									                    <div class="form-check form-check-inline mb-3 mx-4">
									                        <label class="form-check-label"><i class="bi bi-check-circle me-2"></i> ${vo.content}</label>
									                    </div>
									                </div>
									            </div>
									        </c:if>
									    </c:forEach>
									</div>
								 </c:forEach>   
								 
									<div class="row mt-4 ms-1">
										<c:choose>
											<c:when test="${resultCount != 0}">
												<c:forEach var="clist" items="${classList}" varStatus="status">
													<div class="card p-1 me-3 mb-5 mx-4" id="box" style="width: 16rem; height: 30rem; border:0.8px solid #cccccc;">
														
														<img src="${pageContext.request.contextPath}/uploads/lesson/${clist.firstPhoto}" class="card-img-top" height="200px" alt="...">
														<div class="card-header" >
															<h6 class="card-title pb-1 text-start" style="margin-top:10px;">
																${status.count}. <a href="${pageContext.request.contextPath}/lesson/detail/${clist.classNum}" class="text-reset">${clist.className}</a>
															</h6>
														</div>
														<div class="card-body">
															<p class="card-text" style="margin-top:10px;">${clist.addr1} ${clist.addr2 }</p>
														</div>
														<div class="card-footer">
															<p class="card-end" style="float:right; margin-top:10px;">₩ ${clist.price}</p>
														</div>
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												  <div class="my-5 center-message text-center">
												  
													<h5 class="mb-5">결과에 해당하는 클래스가 없습니다.</h5>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								<div class="text-end me-5">
									<button onclick="location.href='${pageContext.request.contextPath}/onedayplus/onedayplus'" class="btn recobtn me-5">다시 추천받기</button>								
								</div>
							</c:when>
								
							<c:otherwise>
							
							
								<div class="my-5">
									<div class="text-center my-5">
										<h4>원데이 플러스 결과가 없습니다.</h4>
									</div>
									<div class="text-end me-5">
										<button onclick="location.href='${pageContext.request.contextPath}/onedayplus/onedayplus'" class="btn recobtn me-5">체험하러가기</button>								
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>