<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   response.setStatus(HttpServletResponse.SC_OK);
%>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main">		

			        <div class="row justify-content-md-center mt-5">
			            <div class="col-md-8">
			                <div class="border mt-5 p-4">
			                       <h4 class="text-center fw-bold"><i class="bi bi-exclamation-triangle"></i> 시스템 오류</h4>
			                       
				                <div class="d-grid pt-3">
									<p class="alert alert-primary text-center bg-light fs-6">
										데이터 처리중 오류가 발생했습니다.<br>
										잠시후 다시 시도 해보시기 바랍니다.				
									</p>
				                </div>
			                       
			                       <div class="d-grid">
			                           <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/';">메인화면으로 이동 <i class="bi bi-arrow-counterclockwise"></i> </button>
			                       </div>
			                </div>
			            </div>
			        </div>
				</div>
			</div>
		</div>
	</div>
</main>
