<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.board-article img {
	max-width: 650px;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
</style>
<script type="text/javascript">

	var tableVisible = false;
	
	function showInput() {
		var form = document.getElementById("answerInsertForm");
		var table = document.getElementById("answerInsertTable");
		
		if(tableVisible){
			table.style.display = "none";
			tableVisible = false;	
		} else{
			table.style.display = "table";
			tableVisible = true;
			form.appendChild(table);
		}
	}

	function answerInsert() {
		const f = document.answerInsertForm;

		if (!f.reSubject.value.trim()) {
			alert("제목을 입력해주세요.");
			f.reSubject.focus;
			return;
		}

		if (!f.reContent.value.trim()) {
			alert("내용을 입력해주세요.");
			f.reContent.focus;
			return;
		}
		f.action="${pageContext.request.contextPath}/pluszone/plusInq/writeAnswer";
		f.submit();
	}
	
	function answerUpdate(){
		const f = document.answerInsertForm;

		if (!f.reSubject.value.trim()) {
			alert("제목을 입력해주세요.");
			f.reSubject.focus;
			return;
		}

		if (!f.reContent.value.trim()) {
			alert("내용을 입력해주세요.");
			f.reContent.focus;
			return;
		}
		f.action="${pageContext.request.contextPath}/pluszone/plusInq/updateAnswer";
		f.submit();
	}
	
	function deleteAnswer(){
		if(confirm("답변을 삭제하시겠습니까?")){
			location.href = "${pageContext.request.contextPath}/pluszone/plusInq/deleteAnswer?inquiryNum=" + ${dto.inquiryNum};
		}
	}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container"
				style="width: 100%; margin: 5% auto; padding-top: 5%">
				<div class="body-main">

					<div class="card mb-5 w-80" style="margin: 0 auto;">
						<div class="card-header text-center">
							<h3>
								<i class="bi bi-app"></i> 문의내역 
								<c:if test="${mode == 'write'}">
									<button type="button" style="float: right;" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/pluszone/plusInq/inqList?${query}';">리스트</button>
								</c:if>
								<c:if test="${mode == 'update' }">
									<button type="button" style="float: right;" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/pluszone/plusInq/inqOkList?${query}';">리스트</button>
								</c:if>
							</h3>
						</div>

						<div class="table table-hover board-list " id="nav-tabContent">
							<table class="table">
								<thead>
									<tr>
										<td colspan="2" class="bg-primary text-white fs-4 fw-medium">
											Q. ${dto.subject}</td>
									</tr>
									<tr>
										<td>클래스 : ${dto.className}</td>
									</tr>
									<tr>
										<td width="50%">작성자 : ${dto.userName}</td>
										<td align="right">문의일 : ${dto.inquiryDate}</td>
									</tr>
									<tr>
										<td colspan="2" valign="top" height="200"
											style="border-bottom: none;">${dto.content}</td>
									</tr>
								</thead>
								<tbody>
									<c:if test="${dto1.reInquiryNum == 1}">
										<tr id="answer1">
											<td colspan="2" class="bg-danger text-white fs-4 fw-medium">
												A. ${dto1.reSubject}</td>
										</tr>
										<tr id="answer2">
											<td width="50%">작성자 : ${dto1.nickName}</td>
											<td align="right">답변일 : ${dto1.reInquiryDate}</td>
										</tr>
										<tr id="answer3">
											<td colspan="2" valign="top" height="200"
												style="border-bottom: none;">${dto1.reContent}</td>
										</tr>
									</c:if>
								</tbody>
									<tr id="addButton">
										<td width="50%">
											<button type="button" class="btn btn-secondary" onclick="showInput();"><i class="bi bi-arrow-down"></i></button>
										</td>
										<c:if test="${mode == 'update'}">
											<td>
												<button type="button" style="float: right;" class="btn btn-danger" onclick="deleteAnswer();">답변삭제<i class="bi bi-trash3"></i></button>
											</td>
										</c:if>
									</tr>
							</table>
							<form name="answerInsertForm" id="answerInsertForm" method="post">
								<table class="table table-borderless mb-2" id="answerInsertTable" style="display: none;">
									<tbody>
										<tr>
											<td class="col-sm-2" scope="row" colspan="2">
												제목 : 
												<c:if test="${mode == 'write'}">
													<input type="text" name="reSubject" class="form-control" style="width: 100%;">
												</c:if>
												
												<c:if test="${mode == 'update'}">
													<input type="text" name="reSubject" class="form-control" style="width: 100%;" value="${dto1.reSubject}">
												</c:if>
											</td>
										</tr>
										<tr>
											<c:if test="${mode == 'write'}">
												<td colspan="2">
													내용 : <textarea name="reContent" class="form-control"></textarea>
												</td>
											</c:if>
											
											<c:if test="${mode == 'update'}">
												<td colspan="2">
													내용 : <textarea name="reContent" class="form-control">${dto1.reContent}</textarea>
												</td>
											</c:if>
										</tr>
										<tr>
											<c:if test="${mode == 'write'}">
												<td width="50%">
													<button type="button" style="float: right;" class="btn btn-primary" onclick="answerInsert();">입력하기</button>
												</td>
											</c:if>
											
											<c:if test="${mode == 'update'}">
												<td width="50%">
													<button type="button" style="float: right;" class="btn btn-primary" onclick="answerUpdate();">수정하기</button>
												</td>
											</c:if>
										</tr>
									</tbody>
								</table>
								<input type="hidden" name="inquiryNum" value="${dto.inquiryNum}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
	function login() {
		location.href = '${pageContext.request.contextPath}/member/login';
	}
</script>
