<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
	
	<style>
		*{
			cursor: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-balloon-heart" viewBox="0 0 16 16"><path fill-rule="evenodd" d="m8 2.42-.717-.737c-1.13-1.161-3.243-.777-4.01.72-.35.685-.451 1.707.236 3.062C4.16 6.753 5.52 8.32 8 10.042c2.479-1.723 3.839-3.29 4.491-4.577.687-1.355.587-2.377.236-3.061-.767-1.498-2.88-1.882-4.01-.721L8 2.42Zm-.49 8.5c-10.78-7.44-3-13.155.359-10.063.045.041.089.084.132.129.043-.045.087-.088.132-.129 3.36-3.092 11.137 2.624.357 10.063l.235.468a.25.25 0 1 1-.448.224l-.008-.017c.008.11.02.202.037.29.054.27.161.488.419 1.003.288.578.235 1.15.076 1.629-.157.469-.422.867-.588 1.115l-.004.007a.25.25 0 1 1-.416-.278c.168-.252.4-.6.533-1.003.133-.396.163-.824-.049-1.246l-.013-.028c-.24-.48-.38-.758-.448-1.102a3.177 3.177 0 0 1-.052-.45l-.04.08a.25.25 0 1 1-.447-.224l.235-.468ZM6.013 2.06c-.649-.18-1.483.083-1.85.798-.131.258-.245.689-.08 1.335.063.244.414.198.487-.043.21-.697.627-1.447 1.359-1.692.217-.073.304-.337.084-.398Z"/></svg>') 20 20, auto;
		}
		a:hover, button[type="button"]:hover, .btn:hover, #cbp-hrmenu a:hover, #cbp-hrmenu li:hover{
	  		cursor: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="red" class="bi bi-balloon-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8.49 10.92C19.412 3.382 11.28-2.387 8 .986 4.719-2.387-3.413 3.382 7.51 10.92l-.234.468a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.235-.468ZM6.726 1.269c-1.167-.61-2.8-.142-3.454 1.135-.237.463-.36 1.08-.202 1.85.055.27.467.197.527-.071.285-1.256 1.177-2.462 2.989-2.528.234-.008.348-.278.14-.386Z"/></svg>') 20 20, auto;
		}
		.side{
			border-radius: 100px;
		}
		.iconscroll{
			border-radius: 20px;
			margin-right: 3%;
			margin-top: 5%; 
			text-align: center;
			padding: 10px;
			z-index: 3;
			border:3px solid #47a3da;
			background: white;
			text-align: center;
			padding: 1% 1%;
			z-index: 3;
			color:#47a3da;
			font-weight:700;
		}
		.btn-outline-light{
			margin-top: 37.5%;	
		}
		.product-img { height: 150px; width: 150px; cursor: pointer; }
	</style>
	
</head>



<body>
<div class="container">
    <tiles:insertAttribute name="header"/>

<main>
	<tiles:insertAttribute name="left"/>
    <tiles:insertAttribute name="body"/>
</main>
</div>

<footer style="width: 100%; height: 250px;">
    <tiles:insertAttribute name="footer"/>
</footer>

<div id="scroll" class="iconscroll" style="position:absolute;right:0;top:0;" > 
	<table> 
	<c:choose>
		<c:when test="${empty sessionScope.member}">
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="iconOk('/member/login')"><i class="bi bi-person"></i></button></td></tr>
			<td class="fs-6 fw-light">로그인<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/lesson/main';"><i class="bi bi-cart4"></i></button></td></tr>
			<td class="fs-6 fw-light">원데이클래스<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/onedayplus/onedayplus';"><i class="bi bi-camera"></i></button></td> </tr>
			<td class="fs-6 fw-light">원데이플러스<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/event/progress/list';"><i class="bi bi bi-alarm"></i></button></td> </tr>
			<td class="fs-6 fw-light">이벤트<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/notice/list';"><i class="bi bi-credit-card-2-front"></i></button></td> </tr>
			<td class="fs-6 fw-light">공지사항<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/bbs/list';"><i class="bi bi-calendar2-event"></i></button></td> </tr>
			<td class="fs-6 fw-light">커뮤니티</td>
		</c:when>
		<c:otherwise>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="iconOk('/myPage/main')"><i class="bi bi-person"></i></button></td></tr>
			<td class="fs-6 fw-light">마이페이지<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='javascript:recentProductView()';"><i class="bi bi-credit-card-2-front"></i></button></td> </tr>
			<td class="fs-6 fw-light">최근 본 클래스<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/lesson/main';"><i class="bi bi-cart4"></i></button></td></tr>
			<td class="fs-6 fw-light">원데이클래스<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/onedayplus/onedayplus';"><i class="bi bi-camera"></i></button></td> </tr>
			<td class="fs-6 fw-light">원데이플러스<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/event/progress/list';"><i class="bi bi bi-alarm"></i></button></td> </tr>
			<td class="fs-6 fw-light">이벤트<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/notice/list';"><i class="bi bi-credit-card-2-front"></i></button></td> </tr>
			<td class="fs-6 fw-light">공지사항<div class="border-bottom" style="margin-top:8px;"></div></td>
			<tr><td><button type="button" class="btn btn-light side" style="margin-top: 16px;" onclick="location.href='${pageContext.request.contextPath}/bbs/list';"><i class="bi bi-calendar2-event"></i></button></td> </tr>
			<td class="fs-6 fw-light">커뮤니티</td>
		</c:otherwise>
		</c:choose>
	</table> <!-- 로그인, 이벤트, 문의, 공지사항, 커뮤니티 -->
</div>
	<span id="brr"></span>

<script>
	function scroll_follow( id ){
		$(window).scroll(function( ){ 
			var position = $(window).scrollTop();
			$( id ).stop().animate({top:position+"px"}, 1);
		});
	}
	scroll_follow( "#scroll" );
	
	
	function iconOk(url) {
	    window.location.href = "${pageContext.request.contextPath}" + url;
	  }
</script>
















<!-- Login Modal -->
<script type="text/javascript">
	function dialogLogin() {
	    $("form[name=modelLoginForm] input[name=userId]").val("");
	    $("form[name=modelLoginForm] input[name=userPwd]").val("");
	    
		$("#loginModal").modal("show");	
		
	    $("form[name=modelLoginForm] input[name=userId]").focus();
	}

	function sendModelLogin() {
	    var f = document.modelLoginForm;
		var str;
		
		str = f.userId.value;
	    if(!str) {
	        f.userId.focus();
	        return;
	    }
	
	    str = f.userPwd.value;
	    if(!str) {
	        f.userPwd.focus();
	        return;
	    }
	
	    f.action = "${pageContext.request.contextPath}/member/login";
	    f.submit();
	}
</script>
<div class="modal fade" id="loginModal" tabindex="-1"
		data-bs-backdrop="static" data-bs-keyboard="false" 
		aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginViewerModalLabel">Login</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
                <div class="p-3">
                    <form name="modelLoginForm" action="" method="post" class="row g-3">
                    	<div class="mt-0">
                    		 <p class="form-control-plaintext">계정으로 로그인 하세요</p>
                    	</div>
                        <div class="mt-0">
                            <input type="text" name="userId" class="form-control" placeholder="아이디">
                        </div>
                        <div>
                            <input type="password" name="userPwd" class="form-control" autocomplete="off" placeholder="패스워드">
                        </div>
                        <div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMeModel">
                                <label class="form-check-label" for="rememberMeModel"> 아이디 저장</label>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary w-100" onclick="sendModelLogin();">Login</button>
                        </div>
                        <div>
                    		 <p class="form-control-plaintext text-center">
                    		 	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2">패스워드를 잊으셨나요 ?</a>
                    		 </p>
                    	</div>
                    </form>
                    <hr class="mt-3">
                    <div>
                        <p class="form-control-plaintext mb-0">
                        	아직 회원이 아니세요 ?
                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
                        </p>
                    </div>
                </div>
        
			</div>
		</div>
	</div>
</div>

<!-- 최근본 클래스 -->
<div class="modal fade" id="productViewModal" tabindex="-1" aria-labelledby="productViewModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
	  <div class="modal-content">
	    <div class="modal-header">
	      <h1 class="modal-title fs-5" id="productViewModalLabel">최근 본 클래스 목록</h1>
	      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	    </div>
	    <div class="modal-body modal-recentProductView">
	    	최근에 본 클래스 목록이 없습니다.
	    </div>
	  </div>
	</div>
</div>

<script type="text/javascript">
function recentProductView() {
	$(".modal-recentProductView").empty();
	
	let lesson = JSON.parse(localStorage.getItem("lesson")) || [];
	let out = "";
	
	out += "<div class='row row-cols-3 g-3'>";
	for(let item of lesson) {
		let classNum = item.classNum;
		let className = item.className;
		let firstPhoto = item.firstPhoto;
		
		out += "<div class='col p-1' style='width=750px;'>";
		out += "  <div class='border rounded'>";
		out += "    <a href='${pageContext.request.contextPath}/lesson/detail/"+classNum+"'>";
		out += "      <img class='product-img' src='${pageContext.request.contextPath}/uploads/lesson/"+firstPhoto+"'>";
		out += "    </a>";
		out += "    <div class='text-truncate p-2 mt-1'>" + className + "</div>";
		out += "  </div>";
		out += "</div>";
	}
	out += "</div>";
	
	$(".modal-recentProductView").html(out);
	
	$("#productViewModal").modal("show");
}
</script>

</body>
</html>