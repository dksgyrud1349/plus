<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}
</script>


<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="row justify-content-center">
					<div class="col-8">
						<h5 class="pb-2 fw-bold fs-2 pb-5">
							<i class="bi bi-book"></i> 원데이플러스 질문 관리
						</h5>
						<c:forEach var="dto" items="${qsubject}">
						    <div>
						        <div class="row border bg-body-secondary">
						            <div class="col-12 p-2">
						                <span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> ${dto.subject}</span>
						            </div>
						        </div>
						        <c:forEach var="vo" items="${qlist}">
						            <c:if test="${dto.num == vo.num}">
						                <div class="form-check form-check-inline my-3">
						                    <label class="form-check-label"><i class="bi bi-circle"></i>&nbsp; ${vo.content}</label>
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
</main>