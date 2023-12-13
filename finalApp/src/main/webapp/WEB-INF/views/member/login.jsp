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

<main class="wrapper" style="margin:5% auto; width:80%;">
	<div id="layoutSidenav_content">
		 	<div class="container-fluid px-5">
				<div class="body-container">
		    				

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="border mt-5 p-4">
                    <form name="loginForm" action="" method="post" class="row g-3">
                    	<h4 class="text-center">Welcome</h4>
                        <h3 class="text-center">Oneday Plus</h3>
                        <div class="col-12">
                            <label class="mb-1">아이디</label>
                            <input type="text" name="userId" class="form-control" placeholder="아이디">
                        </div>
                        <div class="col-12">
                            <label class="mb-1">패스워드</label>
                            <div>
                            	
                            	<span><input type="password" name="userPwd" class="form-control" autocomplete="off" 
                            			placeholder="패스워드" >
                            	</span>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label" for="rememberMe"> 로그인 상태 유지</label>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary col-12" onclick="sendLogin();">&nbsp;Login&nbsp;<i class="bi bi-check2"></i></button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">
                        	<a href="${pageContext.request.contextPath}/member/idFind" class="text-decoration-none me-2">아이디 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2">패스워드 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
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