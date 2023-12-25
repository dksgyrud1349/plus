<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.userPwd.value.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/pwd";
	f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container pt-5" style="width:80%; margin:0 auto; padding-bottom:5%;">
				<div class="body-main">

        <div class="row justify-content-md-center">
            <div class="col-md-7 pt-5">
                <div class="border mt-5 p-4">
                    <form name="pwdForm" method="post" class="row g-3">
                        <h3 class="text-center fw-bold">패스워드 재확인</h3>
                        
		                <div class="d-grid">
							<p class="form-control-plaintext text-center">정보보호를 위해 패스워드를 다시 한 번 입력해주세요.</p>
		                </div>
                        
                        <div class="d-grid">
                            <input type="text" name="userId" class="form-control form-control-lg" placeholder="아이디"
                            		value="${sessionScope.member.userId}" 
                            		readonly>
                        </div>
                        <div class="d-grid">
                            <input type="password" name="userPwd" class="form-control form-control-lg" autocomplete="off" placeholder="패스워드">
                        </div>
                        <div class="d-grid">
                            <button type="button" class="btn btn-lg btn-primary" onclick="sendOk();">확인 <i class="bi bi-check2"></i> </button>
                            <input type="hidden" name="mode" value="${mode}">
                        </div>
                    </form>
                </div>

                <div class="d-grid">
					<p class="form-control-plaintext text-center">${message}</p>
                </div>
            </div>
        </div>
	</div>
</div>
</div>
</div>
</main>