<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>


<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="row justify-content-center">
					<div class="col-8">
						<h5 class="pb-2 fw-bold fs-2 pb-4 border-dark border-3 border-bottom">
							<i class="bi bi-book me-2"></i> ${userId}님의 플러스 질문지 결과
						</h5>
						<div class="border bg-white mt-4 py-2">
							<c:forEach var="dto" items="${qlist}">
							    <div class="px-4 py-2">
							        <div class="row border-bottom border-dark border-3 mb-2">
							            <div class="col-12 p-2">
							                <span class="fw-semibold text-black fs-5"><i class="bi bi-pencil-square me-2"></i>${dto.subject}</span>
							            </div>
							        </div>
							        <c:forEach var="vo" items="${list}">
							            <c:if test="${dto.num == vo.num}">
							                <div class="form-check form-check-inline mt-3">
							                    <i class="bi bi-dot me-2"></i><label class="form-check-label">${vo.content}</label>
							                </div>
							            </c:if>
							        </c:forEach>
							    </div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>