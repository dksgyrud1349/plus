<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function sendOk() {
    const f = document.myForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/inquiryAd/${mode}";
    f.submit();
}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 80%; margin: 10% auto;">
				<div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:2px solid #32B0E4;">
						<i class="bi bi-question-diamond"></i> 1:1 문의 
					</h3>
		
		
			<form name="myForm" method="post">
				<table class="table mt-5 table-form" style="border-top:1px solid #cccccc;">
					<tr>
						<td class="bg-light col-sm-2 align-middle" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>					
        
					<tr>
						<td class="bg-light col-sm-2 align-middle" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea rows="15" cols="50" name="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/inquiryAd/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="inquiryNum" value="${dto.inquiryNum}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
</div>
</main>