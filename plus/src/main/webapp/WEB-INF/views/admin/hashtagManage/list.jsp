<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
</style>
<script type="text/javascript">

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
   const settings = {
         type: method, 
         data: formData,
         success:function(data) {
            fn(data);
         },
         beforeSend: function(jqXHR) {
            jqXHR.setRequestHeader('AJAX', true);
         },
         complete: function () {
         },
         error: function(jqXHR) {
            if(jqXHR.status === 403) {
               login();
               return false;
            } else if(jqXHR.status === 400) {
               alert('요청 처리가 실패 했습니다.');
               return false;
             }
             
            console.log(jqXHR.responseText);
         }
   };
   
   if(file) {
      settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
      settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
   }
   
   $.ajax(url, settings);
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



function deleteHashtag(tagNum) {
	var url = "${pageContext.request.contextPath}/admin/hashtagManage/delete";
	var query = "tagNum="+tagNum;
	
	if(! confirm("해시태그를 삭제하시겠습니까 ?")) {
		  return;
	}
   
   const fn = function(data){
      location.href = "${pageContext.request.contextPath}/admin/hashtagManage/list";
   };
   ajaxFun(url, "post", query, "json", fn);
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
    			<div class="body-main">
    			
	    			<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
    					<i class="bi bi-tag"></i> 해시태그 관리
   					</h3>
    			
    				<form name="hashtagForm" method="post">
	    				<div class="input-group text-center mt-5">
	    					<span class="input-group-text"> 해시태그 추가 </span>
	    					<input type="text" name="tagName" style="width: 30%; border:none; border-bottom:1px solid #cccccc; border-top:1px solid #cccccc" placeholder="추가하실 해쉬태그를 입력해주세요">
	    					<button type="button" class="btn btn-outline-dark" onclick="insertHashtag();"> + </button>
	    				</div>
    				</form>
    				
    				
    				<div class="mt-5">
    					<c:forEach var="dto" items="${list}" varStatus="status">
		    				<span class="btn btn-success rere position-relative m-3">
		 						${dto.tagName} <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" onclick="deleteHashtag('${dto.tagNum}');"> x </span>
							</span>
    					</c:forEach>
    				
    				</div>
    			
    			
    			</div>
    			
    		</div>
    	</div>
    </div>
</main>

