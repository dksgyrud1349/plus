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
			<div class="body-container pt-5" style="width:100%; margin:5% auto;">
				<div class="body-main" style="width: 100%;">
					<div class="card mb-5 w-80" style="margin:0 auto; border:none;">
			        	<div class="card-header text-center">
			            	<h3>
			                	클래스 문의하기
				            </h3>
				        </div>
		
						<div id="tab-content">
							<form name="boardForm" method="post" enctype="multipart/form-data">	
								<table class="table write-form">
									<tr>
										<td class="bg-light col-sm-2" scope="row" style="text-align: center; vertical-align : middle;">제 목</td>
										<td>
											<input type="text" name="subject" class="form-control" value="${findDto.subject}">
										</td>
									</tr>
									
									<tr>
										<td class="bg-light col-sm-2" scope="row" style="text-align: center; vertical-align : middle;">원데이 클래스</td>
										<td>
											<p class="form-control-plaintext">${vo.className}</p>
										</td>
									</tr>
				        
									<tr>
										<td class="bg-light col-sm-2" scope="row" style="text-align: center; vertical-align : middle;">작성자명</td>
				 						<td>
											<p class="form-control-plaintext">${sessionScope.member.userName}</p>
										</td>
									</tr>
				
									<tr>
										<td class="bg-light col-sm-2" scope="row" style="text-align: center; vertical-align : middle;">내 용</td>
										<td>
											<textarea name="content" class="form-control" style="width: 100%; height: 300px;">${findDto.content}</textarea>
										</td>
									</tr>
								</table>
					
								<table class="table table-borderless">
				 					<tr>
										<td class="text-center">
											<button type="button" class="btn" style="background: #32B0E4; color: white;" onclick="check();">${mode == 'update' ? "수정하기" : "등록하기"}&nbsp;<i class="bi bi-check2"></i></button>
											<button type="reset" class="btn btn-secondary">다시입력</button>
											<button type="button" class="btn btn-danger" onclick="location.href='#';">등록취소&nbsp;<i class="bi bi-x"></i></button>
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
</main>
