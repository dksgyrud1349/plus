<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>
<script type="text/javascript">
function memberOk() {
	const f = document.questionForm;
	
	f.action = "${pageContext.request.contextPath}/pluszone/question/questionOk";
    f.submit();
}
</script>


<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
		<div class="row justify-content-center">
			<div class="col-8">
				<h5 class="pb-2 fw-bold fs-2 pb-5">
					<i class="bi bi-book"></i> 플러스 질문지
				</h5>
				<form class="questionForm">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div>
							<div class="row border bg-body-secondary">
								<div class="col-12 p-2">
									<span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i>${status.index} ${dto.subject}</span>
								</div>
							</div>
							<div class="form-check form-check-inline mt-3">
								<input class="form-check-input" type="checkbox" value=" ">
						  		<label class="form-check-label">${dto.content}</label>
							</div>
						</div>	
					</c:forEach>
					
					
					<div class="col-12 mx-2 text-end">
						<button class="btn btn-outline-success"><span class="fw-semibold text-dark" onclick="questionOk();">등록하기 <i class="bi bi-check-lg"></i></span></button>
						<button class="btn btn-outline-danger"><span class="fw-semibold text-dark" onclick="location.href='${pageContext.request.contextPath}/';">취소하기 <i class="bi bi-x-lg"></i></span></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
</main>