<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.btn-confirm {
 background-color: #007BFF;
border: none;
 color: white;
}
						
.btn-cancel {
background-color: #6C757D;
 border: none;
 color: white;
}
						
						
.btn-confirm:hover {
 background-color: #0056b3;
}
						
.btn-cancel:hover {
background-color: #5a6268;
}

</style>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.userId.value.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/pwdFind";
	f.submit();
}
</script>


<main class="wrapper" style="margin:5% auto; width:80%;">
	<div id="layoutSidenav_content">
		 	<div class="container-fluid px-5">
				<div class="body-container">	
		<div class="row justify-content-md-center">
            <div class="col-md-7 pt-5">
                <div class="border mt-5 p-4">
                    <form name="pwdForm" method="post" class="row g-3">
                        <h3 class="text-center fw-bold">패스워드 찾기</h3>
                        
		                <div class="d-grid">
							<p class="form-control-plaintext text-center">회원 아이디를 입력 하세요.</p>
		                </div>
                        
                        <div class="d-grid">
                            <input type="text" name="userId" class="form-control form-control-lg" placeholder="아이디">
                        </div>
                     
                    	<div class="d-grid">
                            <input type="text" name="userpwd" class="form-control form-control-lg" placeholder="이메일">
                        </div>
                        <div class="d-grid">
	                        <div class="btn-group" role="group" aria-label="Basic example">
	                            <button type="button" class="btn btn-lg btn-primary" onclick="sendOk();">확인 <i class="bi bi-check2"></i> </button>
	                			<button type="button" class="btn btn-lg btn-cancel" onclick="history.back();">취소 <i class="bi bi-check2"></i> </button>
	                		</div>
                		</div>
                	</form>
				<hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">
                        	<a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none me-2">아이디 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
                        </p>
                    </div>
	                <div class="d-grid">
						<p class="form-control-plaintext text-center py-3">${message}</p>
	                </div>
				</div>
        	</div>
        </div>
	</div>
</div>
</div>
</main>