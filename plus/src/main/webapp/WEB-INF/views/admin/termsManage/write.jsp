<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
function sendOk() {
    const f = document.termsForm;

   	let str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요.");
        f.subject.focus();
        return false;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }
    
    f.action="${pageContext.request.contextPath}/admin/termsManage/${mode}";
    f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		 <div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
		<h2><i class="fa-solid fa-clipboard-question"></i> 서비스 이용약관 </h2>

		<form name="termsForm" method="post">
			<table class="table table-border border-top2 table-form">
				<tr> 
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
					</td>
				</tr>
				
				<tr> 
					<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top"> 
						<textarea name="content" class="form-control">${dto.content}</textarea>
					</td>
				</tr>
			</table>
			
			<table class="table">
				<tr>
					<td align="center">
						<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/termsManage/list?page=${page}';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
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
</main><!-- @@(admin.faq.write)카테고리 수정 등을 여기서 선언하는 이유? -->
		