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
  transform: translateY(-10px);
}


  h5, h6 {
      font-family: 'Roboto', sans-serif;
  }

  .fw-bold {
      font-weight: bold;
  }

  .fs-2 {
      font-size: 2rem;
  }

  .text-black {
      color: #000000;
  }

  .card-title {
      font-size: 1.5rem; 
  }

  .text-dark {
      color: #333333;
  }

  .btn-primary {
      background-color: #007bff; 
      color: #ffffff;
  }
</style>


<main class="wrapper" style="margin: 5 auto; width: 100%; margin-bottom: 0; padding-bottom: 20;">
	<div id="layoutSidenav_content" style="background: #FFFFFF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; padding-top:5%">
				<div class="row justify-content-center">
					<div class="col-8">
						<h5 class="pb-2 fw-bold fs-2 text-center" style="border-bottom:1px solid #cccccc;">
							<i class="bi bi-book"></i> ${sessionScope.member.userName}님의 원데이플러스 결과
						
						</h5>
						<c:choose>
							<c:when test="${answerCount != 0}">
								<c:forEach var="dto" items="${qlist}">
								    
							    		<div class="body-container" style=" margin:0% auto; paddng-top:5%">
								        <div class="row border-bottom border-info">
								        <div class="row justify-content-center">
								            <div class="col-12 p-2">
								                <span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i>${status.count} ${dto.subject}</span>								   
								            </div>
								        </div>
								        <div>
								        </div>
									        <c:forEach var="vo" items="${list}">
									            <c:if test="${dto.num == vo.num}">
									                <div class="form-check form-check-inline m-2">
									                    <label class="form-check-label"><i class="bi bi-check-circle"></i> ${vo.content}</label>
									                </div>
									            </c:if>
									        </c:forEach>
								        </div>
								    </div>
								</c:forEach>
						
									
									<div class="row mt-5">
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
												  <div class="m-5 center-message">
												  
													<h5 class="text-center mb-5">결과에 해당하는 클래스가 없습니다.</h5>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								<div class="text-end">
									<button onclick="location.href='${pageContext.request.contextPath}/onedayplus/onedayplus'" class="btn btn-primary">다시 추천받기</button>								
								</div>
							</c:when>
								
							<c:otherwise>
							
							
								<div class="m-5">
									<h4 class="text-center mb-5">원데이 플러스 결과가 없습니다.</h4>
									<button onclick="location.href='${pageContext.request.contextPath}/onedayplus/onedayplus'" class="btn btn-primary" style="float:right;">체험하러가기</button>								
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>