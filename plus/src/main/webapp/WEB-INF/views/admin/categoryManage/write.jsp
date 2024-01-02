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
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.table-category button {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.table-category input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}

.btnCategoryAddOk, .btnSpanIcon {
	cursor: pointer;
}
</style>
<script>
function sendOk() {
	const f = document.categoryForm;
	
	if(! f.mainName.value.trim()) {
		alert("메인 카테고리명을 입력 하세요");
		f.mainName.focus();
		return;
	}
	
	$("input[name=categorys]").each(function(){
		if(! $(this).val().trim()) {
			alert("서브 카테고리를 입력하세요");
			return;
		}
	});
		
	
	f.action = "${pageContext.request.contextPath}/admin/categoryManage/write";
	f.submit();
}

$(function(){
	$('.btnCategoryAdd').click(function(){
		let $el = $(this).closest(".category-layout").find(".category-area");
		
		let $category = $(".category-layout .category-area .category-item:first-child").clone();
		
		$category.find("input[type=hidden]").remove();
		$category.find("input[name=categorys]").removeAttr("value");
		$category.find("input[name=categorys]").val("");
		$el.append($category);
	});
	
	$(".category-layout").on("click", ".category-minus", function(){
		let $minus = $(this);
		let $el = $minus.closest(".category-layout").find(".category-area");
	
		if($el.find(".category-item").length <= 1) {
			$el.find("input[name=categorys]").val("");
			return false;
		}
		
		$minus.closest(".category-item").remove();
	});
});

</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
					
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="fa-solid fa-clipboard-question"></i> 카테고리 추가 
					</h3>

    					<form name="categoryForm" method="post">
							<table class="table table-border border-top2 table-form">
								<tr> 
									<td> 메인 카테고리</td>
									<td> 
										<input type="text" name="mainName" maxlength="100" class="form-control">
									</td>
								</tr>
								
								<tr>
									<td>
										서브 카테고리
									</td> 
									<td> 
									    <div class="category-layout">
									    	<div class="row gx-5">
									    		<div class="col category-area">
									    			<div class="col category-item d-flex flex-row ">
														<input type="text" name="categorys" class="form-control" style="width:40%;">
														<button type="button" class="form-control category-minus btn btn-outline-dark" style="width:15%;">&nbsp;-&nbsp;</button>
													</div>
													<div class="col">
														<button type="button" class="btn btnCategoryAdd btn-outline-dark" style="float: right;">&nbsp;+&nbsp;</button>
													</div>
												</div>
											</div>
										</div>
										</td>
									</tr>
								</table>
							
							<table class="table">
								<tr>
									<td align="center">
										<button type="button" class="btn btn-dark" onclick="sendOk();">등록하기</button>
										<button type="reset" class="btn">다시입력</button>
										<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/categoryManage/list';">등록취소</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>