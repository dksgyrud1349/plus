<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">

</style>

<style type="text/css">
.table-category {
	border-spacing: 1px;
	background: #999;
	width: 100%;
}
.table-category thead>tr {
	text-align: center;
	background: #f8f9fa;
}
.table-category thead tr>th {
	color:  #787878;
	padding: 10px 0;
}

.table-category tbody>tr, .table-category tfoot>tr {
	text-align: center;
	background: #fff;
	height: 30px;
}

.table-category input {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	box-sizing: border-box;
}
.table-category button {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.table-category select {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category select[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.btnCategoryAddOk, .btnSpanIcon {
	cursor: pointer;
}
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.categoryForm;

    if(! f.mainName.value) {
        alert("메인 카테고리를 입력하세요. ");
        f.mainName.focus();
        return;
    }
    
    f.action="${pageContext.request.contextPath}/admin/categoryMange/write";
    f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
					<h2><i class="fa-solid fa-clipboard-question"></i> 카테고리 추가 </h2>
    					<form name="categoryForm" method="post">
							<table class="table table-border border-top2 table-form">
								<tr> 
									<td> 메인 카테고리 이름 </td>
									<td> 
										<input type="text" name="mainName" maxlength="100" class="form-control">
									</td>
								</tr>
							
								<tr> 
									<td>서브 카테고리 이름</td>
									<td> 
										<input type="text" name="subName" maxlength="100" class="form-control">
									</td>
								</tr>
							</table>
							
							<table class="table">
								<tr>
									<td align="center">
										<button type="button" class="btn btn-dark" onclick="sendOk();">등록하기</button>
										<button type="reset" class="btn">다시입력</button>
										<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/categoryManage/list';">등록취소</button>
										<input type="hidden" name="mainNum" value="${dto.mainNum}">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>