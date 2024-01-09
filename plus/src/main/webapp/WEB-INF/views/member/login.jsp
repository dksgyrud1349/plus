<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}

</script>
<style>
.box {
    background-image: url(https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRdc-LDkQEEALfy3H34NVoH0YwWa5OaRGUP-i8GBBFRwF2FBNic);
    background-position: 13px center;
    background-size: contain;
    background-repeat: no-repeat;

    text-indent: 25px;
}
.box:focus{
	outline: none;
}
.box1 {
    background-image: url(https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTFgsnGyx6ssl-ujbm1KvKxO0OAXXNGzubPAY7UggqTlqvNgH0b);
    background-position: 13px center;
    background-size: contain;
    background-repeat: no-repeat;
    border: 1px solid #ccc;

    text-indent: 25px;
}
.idpwd{
	border:none;
	border-bottom:1px solid #cccccc;
	border-radius:0px;
}
.sign-up{
	background: #FFE65A;
}
.log-in{
	background: #288CFF;
}
</style>

<main class="wrapper" style="margin:5% auto; width:80%;">
	<div id="layoutSidenav_content">
		 	<div class="container-fluid px-5">
				<div class="body-container">
		    				

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="border mt-5 p-4">
                    <form name="loginForm" action="" method="post" class="row g-3">
                    	<h4 class="text-center" style="margin-top:24px;">Welcome</h4>
                        <h3 class="text-center" style="margin-top:8px; font-weight:bold;"><i class="bi bi-calendar2-plus"></i>&nbsp;원데이 플러스</h3>
                        	<div class="col-12">
                            	<label class="mb-1 ps-1">아이디</label>
	                            	<input type="text" name="userId" class="form-control box ps-4 idpwd" placeholder="아이디">
                        	</div>
                        		<div class="col-12">
                            		<label class="mb-1 ps-1">패스워드</label>
                            			<input type="password" name="userPwd" class="form-control box1 ps-4 idpwd"autocomplete="off" placeholder="패스워드" >
                            			<div class="mt-1" style="font-size:11px; color:#a0a0a0">특수문자,영문,숫자 조합 8자 이상으로 입력해주세요.
                            	</div>
                        	</div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label left" for="rememberMe"> 로그인 상태 유지</label>                                
                            </div>
                        </div>
                        <div>
                            <button type="button" style="border-radius: 100px;" class="btn btn-outline-primary text-white col-12 mt-3 log-in" onclick="sendLogin();">&nbsp;로그인&nbsp;<i class="bi bi-unlock"></i></button>
                            <button type="button" style="border-radius: 100px;" class="btn btn-outline-warning border border-black text-black col-12 mt-3 sign-up"
                              onclick="location.href = '${pageContext.request.contextPath}/member/member';">&nbsp;회원가입&nbsp;<i class="bi bi-send"></i></button>
                            
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">
                        	<a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none me-3">아이디 찾기</a>&nbsp;
                        	<span class="border-end border-Secondary"></span>
                        	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none ms-4 me-2">패스워드 찾기</a>
                        </p>
                    </div>
                </div>

                <div class="d-grid">
						<p class="form-control-plaintext text-center text-primary">${message}</p>
                </div>
            </div>
        </div>

	</div>
</div>
</div>
</main>