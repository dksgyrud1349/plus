<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.form-text {
	color: #8c8c8c;
	font-size : 18px;
}

input::placeholder {
  color: #d2d2d2;
  font-size: 18px;
}
.mail{
	border: 1px solid #ced4da; 
	width: 400px; 
	border-radius: 5px; 
	margin-left: 11px;
}
.mail:focus{
	border-color: #3BE0CB;
	outline: none;
}
.mail-send{
	width: 400px;
	background: #1DD1AD;
	padding: 5px;
	border: none;
}


.body-container{
	width: 500px;
	margin: 0 auto;
	
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
<div class="container" style="margin-top:10%;">
    <div class="body-container mt-5">
        <div class="body-title">
            <h2 class="text-center fw-bold">아이디 찾기</h2>
        </div>
        <div class="border rounded my-5 p-5">
            <form name="emailForm" method="post">
                <div class="row">
                    <p class="fw-bold mt-3 mb-1"style="font-size:19px;">가입한 이메일 주소를 입력해주세요.</p>
                    <input type="text" name="email" class="p-3 mail"  placeholder="email2@naver.com">
                </div>

                <div class="row">
                    <span class="form-text text-break mt-5">가입하신 이메일주소를 입력해주시면 <br> 해당 이메일로 고객님의 아이디를 보내드립니다.</span>
                </div>
                <div class="row mt-3">
                    <div class="col text-center">
                        <button type="button" class="btn mail-send btn-outline-success text-light fs-5" style="height:60px" onclick="sendOk()">
                            이메일 전송하기&nbsp;<i class="bi bi-send"></i>
                        </button>
                        <hr>
                    </div>
                </div>
            </form>
			<div class="col-12">
			    <p class="text-center mb-0">
			    	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none ms-3 me-2">회원가입</a>
					<span class="border-end border-Secondary border-2 me-3 ms-4"></span>
					<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none ms-4 me-2">패스워드 찾기</a>
			    </p>
			</div>        
		</div>
        <div class="d-grid">
            <p class="form-control-plaintext text-center py-3">${message}</p>
        </div>
    </div>
</div>
