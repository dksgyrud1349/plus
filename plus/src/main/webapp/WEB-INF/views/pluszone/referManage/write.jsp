<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style>
	.delete-file { cursor: pointer; }
	.delete-file:hover { color: #0d58ba; }
</style>

<script type="text/javascript">
    function check() {
        const f = document.referManageForm;

    	let str = f.subject.value;
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

    	f.action="${pageContext.request.contextPath}/pluszone/referManage/${mode}";

        return true;
    }
</script>
<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				    	<table class="table">
							<tr>
								<td align="left" width="50%">
									&nbsp;
								</td>
								<td align="right">
									&nbsp;
								</td>
							</tr>
						</table>
						
						<div class="card mb-5 w-80" style="margin:0 auto">
				        	<div class="card-header text-center">
				            	<h3>
				                	<i class="fas fa-clipboard-list"></i> 공지사항 관리
					            </h3>
					        </div>
					        
						    <div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
								<form name="referManageForm" method="post" enctype="multipart/form-data">
									<table class="table table-border border-top2 table-form">
										<tr> 
											<td>클래스번호</td>
											<td>
												<div>
													<select name="classNum">
														<option value="">:: 선택 ::</option>
														<c:forEach var="vo" items="${listTitle}" varStatus="status">
															<option value="${vo.classNum}"></option>
														</c:forEach>
													</select>
												</div>
											</td>
											
										</tr>
										<tr> 
											<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
											<td> 
												<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
											</td>
										</tr>
									
										<tr> 
										<!-- 
											<td>공지여부</td>
											<td> 
												<input type="checkbox" name="referMange" id="referManage" class="form-check-input" value="1" ${dto.notice==1 ? "checked":"" }>
												<label for="notice" class="form-check-label">공지</label>
											</td>
										</tr>
						 			-->
										<tr> 
										<!-- 
											<td>보기</td>
											<td> 
												<input type="checkbox" name="showNotice" id="showNotice" class="form-check-input" value="1" ${mode=="write" || dto.memberIdx==51 ? "checked":"" }>
												<label for="showNotice" class="form-check-label">표시</label>
											</td>
										</tr>
									   -->
										<tr> 
											<td>작성자</td>
											<td> 
												<p class="form-control-plaintext">${sessionScope.member.userName}</p>
											</td>
										</tr>
									
										<tr> 
											<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
											<td valign="top"> 
												<textarea name="content" id="ir1" class="form-control" style="max-width: 97%; height: 290px;">${dto.content}</textarea>
											</td>
										</tr>
									  
										
									</table>
										
									<table class="table">
										<tr> 
											<td align="center">
												<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
												<button type="reset" class="btn btn-success">다시입력</button>
												<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/pluszone/referManage/list';">
													${mode=='update'?'수정취소':'등록취소'}
												</button>
												<c:if test="${mode=='update'}">
													<input type="hidden" name="num" value="${dto.reFnum}">
													<input type="hidden" name="page" value="${page}">
												</c:if>
											</td>
										</tr>
									</table>
										<input type="hidden" name="classNum" value="${dto.classNum}">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>