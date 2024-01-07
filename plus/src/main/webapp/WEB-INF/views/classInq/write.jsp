<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

</style>

<script type="text/javascript">
function check() {
	
    const f = document.boardForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return false;
    }

	str = f.content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }
	
	if(f.mode.value == 'update'){
		f.action = "${pageContext.request.contextPath}/classInq/updateInq";
		
	} else {
		f.action = "${pageContext.request.contextPath}/classInq/insertInq";
	}
	
    f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container pt-5" style="width:80%; margin:5% auto;">
				<div class="body-main">
					<div class="card mb-5 w-80" style="margin:0 auto; border:none;">
			        	<div class="card-header text-center">
			            	<h3>
			                	<i class="bi bi-question-circle"></i> 클래스 문의하기
				            </h3>
				        </div>
		
						<div id="tab-content">
							<form name="boardForm" method="post" enctype="multipart/form-data">	
								<table class="table write-form">
									<tr>
										<td class="bg-light col-sm-2" scope="row">제 목</td>
										<td>
											<input type="text" name="subject" class="form-control" value="${findDto.subject}">
										</td>
									</tr>
									
									<tr>
										<td class="bg-light col-sm-2" scope="row">원데이 클래스</td>
										<td>
											<p class="form-control-plaintext">${vo.className}</p>
										</td>
									</tr>
				        
									<tr>
										<td class="bg-light col-sm-2" scope="row">작성자명</td>
				 						<td>
											<p class="form-control-plaintext">${sessionScope.member.userName}</p>
										</td>
									</tr>
				
									<tr>
										<td class="bg-light col-sm-2" scope="row">내 용</td>
										<td>
											<textarea name="content" class="form-control" style="width: 99%; height: 300px;">${findDto.content}</textarea>
										</td>
									</tr>
								</table>
					
								<table class="table table-borderless">
				 					<tr>
										<td class="text-center">
											<button type="button" class="btn btn-outline-success" onclick="check();">${mode == 'update' ? "수정하기" : "등록하기"}&nbsp;<i class="bi bi-check2"></i></button>
											<button type="reset" class="btn btn-outline-secondary">다시입력</button>
											<button type="button" class="btn btn-outline-danger" onclick="location.href='#';">등록취소&nbsp;<i class="bi bi-x"></i></button>
											<input type="hidden" name="classNum" value="${classNum}">
											<input type="hidden" name="className" value="${vo.className}">
											<c:if test="${mode == 'update'}">
												<input type="hidden" name="inquiryNum" value="${findDto.inquiryNum}">
											</c:if>
											<input type="hidden" name="mode" value="${mode}">
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
