<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<script type="text/javascript">
$(function(){
	$("#tab-0").addClass("active");

	$("ul.tabs li").click(function() {
		let tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		let url = "${pageContext.request.contextPath}/admin/questionManage/pluszone";	
		location.href = url;
	});
});

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
						<h3 class="mb-5 p-2" style="border-bottom:3px solid black;">
							<i class="bi bi-book me-2"></i>질문지 관리
						</h3>
						
						<div>
							<ul class="tabs">
								<li id="tab-0" data-tab="0">
									<i class="bi bi-blockquote-left me-2"></i>원데이 플러스 질문
								</li>
								<li id="tab-1" data-tab="1">
									<i class="bi bi-blockquote-right me-2"></i>플러스존 질문
								</li>
							</ul>
						</div>
						
						<div class="bg-white border">
							<div class="tab-content p-4">
								<c:forEach var="dto" items="${qsubject}">
								    <div class="mb-4 px-2">
								        <div class="row border-bottom border-dark border-3 mb-2">
								            <div class="col-12 p-2">
								                <span class="fw-semibold text-black fs-5"><i class="bi bi-pencil-square me-2"></i>${dto.subject}</span>
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
		</div>
	</div>
</main>