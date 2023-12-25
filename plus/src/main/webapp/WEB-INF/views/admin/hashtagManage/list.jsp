<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

</style>
<script type="text/javascript">

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function insertHashtag() {
	const f = document.hashtagForm;
	
	if(! f.tagName.value.trim() ){
		alert("해시태그를 입력하세요.");
		f.tagName.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/admin/hashtagManage/write";
	f.submit();
}

function deleteHashtag(long tagNum) {
	var url = "${pageContext.request.contextPath}/admin/hashtagManage/delete";
	var query = "tagNum="+tagNum;
	
	if(! confirm("해시태그를 삭제하시겠습니까 ?")) {
		  return;
	}
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
    			
    			<div class="hashtag-container">
    				<div>
    					<h3>
    						<i class="bi bi-tag"></i> 해시태그 관리
    					</h3>
    				</div>
    				<form name="hashtagForm" method="post">
	    				<div class="input-group mx-2 text-center">
	    					<span class="input-group-text"> 해시태그 추가 </span>
	    					<input type="text" name="tagName" style="width: 50%;">
	    					<button type="button" class="btn btn-outline-dark btn-sm" onclick="insertHashtag();">&nbsp;+&nbsp;</button>
	    				</div>
    				</form>
    				
    				<div class="p-2 border">
    					<c:forEach var="dto" items="${list}" varStatus="status">
		    				<span class="btn btn-success position-relative m-3">
		 						${dto.tagName} <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" onclick="deleteHashtag('${dto.tagNum}');"> x </span>
							</span>
    					</c:forEach>
    				
    				</div>
    			
    			
    			</div>
    			
    		</div>
    	</div>
    </div>
</main>

