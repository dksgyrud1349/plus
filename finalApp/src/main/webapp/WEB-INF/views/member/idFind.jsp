<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.form-text {
	color: #5D5D5D;
	text-weight: bold;
	font-size : 14px;
}
.container{
	
}					
</style>	


<script type="text/javascript">
function sendOk() {
	const f = document.emailForm;

	let str = f.email.value.trim();
	if(!str) {
		alert("이메일을 입력하세요.");
		f.email.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/idFind";
	f.submit();
}
</script>

<div class="container w-50" style="margin-top:10%">
    <div class="body-container mt-5">
        <div class="body-title">
            <h3 class="text-center fw-bold">아이디 찾기</h3>
        </div>
        <div class="border rounded my-5 p-4">
            <form name="emailForm" method="post">
                <div class="row">
                    <p class="form-text">가입한 이메일 주소를 입력해주십시오.</p>
                    <input type="text" name="email" class="form-control form-control-lg" placeholder="이메일">
                </div>

                <div class="row">
                    <span class="form-text text-break">가입하신 이메일 주소를 입력하시면 해당 이메일로 아이디를 보내드립니다.</span>
                </div>
                <div class="row mt-3">
                    <div class="col text-center">
                        <button type="button" class="btn btn-lg btn-primary" onclick="sendOk()">
                            확인 <i class="bi bi-check2"></i>
                        </button>
                        <button type="button" class="btn btn-lg btn-secondary" onclick="location.href='${pageContext.request.contextPath}/'">
                            취소 <i class="bi bi-x"></i>
                        </button>
                    </div>
                </div>
            </form>

            <div class="row my-3">
                <p class="text-center">
                    <a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2">패스워드 찾기</a>
                    <span>&nbsp;|&nbsp;</span>
                    <a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
                </p>
            </div>
        </div>
        <div class="d-grid">
            <p class="form-control-plaintext text-center py-3">${message}</p>
        </div>
    </div>
</div>
