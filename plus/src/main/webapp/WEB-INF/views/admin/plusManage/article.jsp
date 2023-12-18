<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*{ padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body { font-size: 14px; font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif; }

textarea:focus, input:focus { outline: none; }

</style>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<main>
	<div class="container mt-5 pt-3 ">
		<div class="row justify-content-center">
			<div class="col-8">
				<h5 class="pb-2 fw-bold fs-2 pb-5">
					<i class="bi bi-book"></i> ${userName} 플러스님의 질문지 결과
				</h5>
				<form class="questionForm">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div class="mb-5">
							<div class="row border bg-body-secondary">
								<div class="col-12 p-2"><span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> ${dto.content}</span></div>
							</div>
							<c:if test="${dto.ans1 != null}">
								<div class="form-check form-check-inline mt-2">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
									<label class="form-check-label" for="flexCheckDefault">${dto.ans1}</label>
								</div>
							</c:if>
							<c:if test="${dto.ans2 != null}">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
									<label class="form-check-label" for="flexCheckDefault">${dto.ans2}</label>
								</div>
							</c:if>
							<c:if test="${dto.ans3 != null}">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
									<label class="form-check-label" for="flexCheckDefault">${dto.ans3}</label>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</form>
			</div>
		</div>
	</div>
</main>